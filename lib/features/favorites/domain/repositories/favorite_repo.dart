import 'package:rickandmorty_app/features/home/data/models/character_model.dart';

abstract class FavoritesRepo {
  Future<List<CharacterModel>?> getFavorites(String key);

  Future<void> saveFavoriteCharacter(String key, CharacterModel character);

  Future<void> removeFavoriteCharacter(String key, CharacterModel character);

  Future<bool> isFavoriteCharacter(String key, CharacterModel characterModel);
}
