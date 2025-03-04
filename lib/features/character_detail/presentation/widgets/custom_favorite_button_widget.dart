import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty_app/core/di/dependency_injection.dart';
import 'package:rickandmorty_app/core/utils/app_strings.dart';
import 'package:rickandmorty_app/features/character_detail/presentation/cubit/export_favorite_cubit.dart';
import 'package:rickandmorty_app/features/home/data/models/character_model.dart';

class CustomFavoriteButtonWidget extends StatefulWidget {
  final CharacterModel character;

  const CustomFavoriteButtonWidget({super.key, required this.character});

  @override
  State<CustomFavoriteButtonWidget> createState() =>
      _CustomFavoriteButtonWidgetState();
}

class _CustomFavoriteButtonWidgetState
    extends State<CustomFavoriteButtonWidget> {
  ValueNotifier<bool> isFavorite = ValueNotifier<bool>(false);
  final favoriteCubit = sl<FavoritesCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FavoritesCubit, FavoritesState>(
      bloc: sl<FavoritesCubit>()..isFavorite(favoritesKey, widget.character),
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
              favoriteCubit.removeCharacter(favoritesKey, widget.character);
            } else {
              favoriteCubit.saveCharacter(favoritesKey, widget.character);
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
    );
  }
}
