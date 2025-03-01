import 'dart:developer';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty_app/core/di/dependency_injection.dart';
import 'package:rickandmorty_app/core/utils/custom_widget/no_data_displayed.dart';
import 'package:rickandmorty_app/features/home/data/models/character_model.dart';
import 'package:rickandmorty_app/features/home/data/models/character_result_model.dart';
import 'package:rickandmorty_app/features/home/presentation/cubit/home_cubit.dart';

import '../../../shared/presentation/widgets/character_item_widget.dart';

class CharactersListWidget extends StatefulWidget {
  final CharacterResultModel? characters;

  const CharactersListWidget({super.key, this.characters});

  @override
  State<CharactersListWidget> createState() => _CharactersListWidgetState();
}

class _CharactersListWidgetState extends State<CharactersListWidget> {
  final homeCubit = sl<HomeCubit>();
  final ScrollController _scrollController = ScrollController();
  ValueNotifier<bool> isHasMoreCharacters = ValueNotifier<bool>(true);

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_isBottom && !homeCubit.hasReachedMax) {
      homeCubit.getCharactersWithFilters();
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.99);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      bloc: sl<HomeCubit>()..getCharactersWithFilters(),
      builder: (_, state) {
        if (state is CharactersLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is CharactersSuccessState) {
          List<CharacterModel> characters = state.characters!.results!;

          return Column(
            children: [
              Flexible(
                child: ListView.builder(
                  controller: _scrollController,
                  padding: const EdgeInsetsDirectional.only(bottom: 10),
                  itemCount: characters.length,
                  itemBuilder: (_, index) {
                    log('index:: $index ${characters.length}');
                    return CharacterItemWidget(
                      character: characters[index],
                    );
                  },
                ),
              ),
              if (homeCubit.hasReachedMax)
                Container(
                  padding: const EdgeInsetsDirectional.all(10),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: const AutoSizeText(
                    'No character more',
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                )
            ],
          );
        }
        return const NoDataDisplayed();
      },
    );
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }
}
