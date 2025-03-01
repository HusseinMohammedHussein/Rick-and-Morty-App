import 'dart:developer';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty_app/core/di/dependency_injection.dart';
import 'package:rickandmorty_app/core/helper/helper.dart';
import 'package:rickandmorty_app/core/utils/app_strings.dart';
import 'package:rickandmorty_app/core/utils/app_style.dart';
import 'package:rickandmorty_app/core/utils/custom_widget/base_scaffold.dart';
import 'package:rickandmorty_app/features/character_detail/presentation/cubit/export_favorite_cubit.dart';
import 'package:rickandmorty_app/features/home/data/models/character_model.dart';

class CharacterDetails extends StatefulWidget {
  final CharacterModel character;

  const CharacterDetails({super.key, required this.character});

  @override
  State<CharacterDetails> createState() => _CharacterDetailsState();
}

class _CharacterDetailsState extends State<CharacterDetails> {
  ValueNotifier<bool> isFavorite = ValueNotifier<bool>(false);
  final favoriteCubit = sl<FavoritesCubit>();

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
        isHomeView: false,
        body: SingleChildScrollView(
          padding: const EdgeInsetsDirectional.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  CachedNetworkImage(
                    imageUrl: '${widget.character.image}',
                    width: sizeWidth,
                    fit: BoxFit.fill,
                  ),
                  PositionedDirectional(
                    top: 20,
                    end: 20,
                    child: BlocConsumer<FavoritesCubit, FavoritesState>(
                      bloc: sl<FavoritesCubit>()
                        ..  isFavorite(favoritesKey, widget.character),
                      listener: (_, state) {
                        if (state is LocalIsFavoritesSuccessState) {
                          log('state.isFavorite:: ${state.isFavorites}');
                            isFavorite.value = state.isFavorites;
                        }
                      },
                      builder: (_, state) {
                        return GestureDetector(
                          onTap: () async {
                            log('isFavorite.value:: ${isFavorite.value}');
                            if (isFavorite.value) {
                              favoriteCubit.removeCharacter(
                                  favoritesKey, widget.character);
                            } else {
                              favoriteCubit.saveCharacter(
                                  favoritesKey, widget.character);
                            }

                            isFavorite.value = !isFavorite.value;
                          },
                          child: Container(
                            padding: const EdgeInsetsDirectional.all(10),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.red),
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.white,
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 2,
                                  )
                                ]),
                            child: ValueListenableBuilder(
                              valueListenable: isFavorite,
                              builder: (_, value, w) => Icon(
                                value ? Icons.favorite : Icons.favorite_border,
                                color: value ? Colors.red : Colors.black,
                                size: 30,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              // name
              AutoSizeText(
                '${widget.character.name}',
                maxLines: 2,
                style: bigTitleTextStyle.copyWith(fontSize: 22),
              ),
              spaceHeight20,
              // status
              Row(
                children: [
                  AutoSizeText(
                    'Status',
                    style: smallTitleTextStyle.copyWith(fontSize: 18),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  AutoSizeText(
                    '${widget.character.status}',
                    style: infoTextStyle.copyWith(fontSize: 20),
                  ),
                ],
              ),
              spaceHeight10,
              // species
              Row(
                children: [
                  AutoSizeText(
                    'Species',
                    style: smallTitleTextStyle.copyWith(fontSize: 18),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  AutoSizeText(
                    '${widget.character.species}',
                    style: infoTextStyle.copyWith(fontSize: 20),
                  ),
                ],
              ),
              spaceHeight10,
              // Gender
              Row(
                children: [
                  AutoSizeText(
                    'Gender',
                    style: smallTitleTextStyle.copyWith(fontSize: 18),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  AutoSizeText(
                    '${widget.character.gender}',
                    style: infoTextStyle.copyWith(fontSize: 20),
                  ),
                ],
              ),
              spaceHeight10,
              // Type
              Row(
                children: [
                  AutoSizeText(
                    'Type',
                    style: smallTitleTextStyle.copyWith(fontSize: 18),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  AutoSizeText(
                    widget.character.type!.isNotEmpty
                        ? widget.character.type!
                        : '?',
                    style: infoTextStyle.copyWith(fontSize: 20),
                  ),
                ],
              ),
              // Origin location & current location. List of episodes they appear in
            ],
          ),
        ));
  }
}
