import 'dart:convert';
import 'dart:developer';

import 'package:rickandmorty_app/core/database/local/cache_helper.dart';
import 'package:rickandmorty_app/features/favorites/domain/repositories/favorite_repo.dart';
import 'package:rickandmorty_app/features/home/data/models/character_model.dart';

class FavoritesRepoImpl extends FavoritesRepo {
  CacheHelper cacheHelper;

  FavoritesRepoImpl(this.cacheHelper);

  @override
  Future<List<CharacterModel>> getFavorites(String key) async {
    List<String>? favoritesList = cacheHelper.getStringList(key: key);

    if (favoritesList != null) {
      log('favoritesList_length:: ${favoritesList.length}');
      return favoritesList
          .map((jsonString) => CharacterModel.fromJson(json.decode(jsonString)))
          .toList();
    } else {
      return [];
    }
  }

  @override
  Future<bool> isFavoriteCharacter(
      String key, CharacterModel characterModel) async {
    List<String>? charactersList = cacheHelper.getStringList(key: key);
    if (charactersList != null) {
      final id = charactersList.map((char) => json.decode(char)).toList();
      return id.any((item) => item['id'] == characterModel.id);
    }
    return false;
  }

  @override
  Future<void> removeFavoriteCharacter(
      String key, CharacterModel character) async {
    List<String>? favoritesList = cacheHelper.getStringList(key: key);
    favoritesList ??= [];
    favoritesList.remove(json.encode(character.toJson()));
    log('favoritesList_length:: ${favoritesList.length}');
    await cacheHelper.saveStringList(key: key, list: favoritesList);
  }

  @override
  Future<void> saveFavoriteCharacter(
      String key, CharacterModel character) async {
    List<String>? favoritesList = cacheHelper.getStringList(key: key);

    favoritesList ??= [];

    favoritesList.add(json.encode(character.toJson()));
    log('favoritesList_length:: ${favoritesList.length}');
    log('saveCharacter:: $favoritesList');
    await cacheHelper.saveStringList(key: key, list: favoritesList);
  }
}
