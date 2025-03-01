part of 'favorites_cubit.dart';


sealed class FavoritesState {}

class FavoritesInitState extends FavoritesState {}

class FavoritesLoadingState extends FavoritesState {}

class FavoritesSuccessState extends FavoritesState {
  List<CharacterModel>? favoritesCharacter;

  FavoritesSuccessState({
    required this.favoritesCharacter,
  });
}

class LocalSaveFavoritesSuccessState extends FavoritesState {}

class LocalRemoveFavoritesSuccessState extends FavoritesState {}

class LocalIsFavoritesSuccessState extends FavoritesState {
  bool isFavorites;

  LocalIsFavoritesSuccessState(this.isFavorites);
}
