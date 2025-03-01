import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty_app/core/di/dependency_injection.dart';
import 'package:rickandmorty_app/core/utils/app_strings.dart';
import 'package:rickandmorty_app/core/utils/custom_widget/base_scaffold.dart';
import 'package:rickandmorty_app/core/utils/custom_widget/no_data_displayed.dart';
import 'package:rickandmorty_app/features/favorites/presentation/cubit/export_favorite_cubit.dart';
import 'package:rickandmorty_app/features/shared/presentation/widgets/character_item_widget.dart';

class FavoritesView extends StatefulWidget {
  const FavoritesView({super.key});

  @override
  State<FavoritesView> createState() => _FavoritesViewState();
}

class _FavoritesViewState extends State<FavoritesView> {
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      isHomeView: false,
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BlocBuilder<FavoritesCubit, FavoritesState>(
          bloc: sl<FavoritesCubit>()..getFavoritesSaved(favoritesKey),
          builder: (_, state) {
            if (state is FavoritesSuccessState) {
              if (state.favoritesCharacter!.isEmpty) {
                return const NoDataDisplayed();
              }
              return Flexible(
                child: ListView.builder(
                  itemCount: state.favoritesCharacter!.length,
                  itemBuilder: (ctx, index) {
                    log('favorites_length:: ${state.favoritesCharacter!.length}');
                    final character = state.favoritesCharacter![index];
                    return CharacterItemWidget(
                      character: character,
                    );
                  },
                ),
              );
            }
            return const NoDataDisplayed();
          },
        ),
      ],
    ));
  }
}
