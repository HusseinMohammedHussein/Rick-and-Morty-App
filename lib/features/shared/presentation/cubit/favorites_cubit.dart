import 'package:bloc/bloc.dart';
import 'package:rickandmorty_app/features/favorites/data/repositories/favorites_repo_impl.dart';
import 'package:rickandmorty_app/features/home/data/models/character_model.dart';

part 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  final FavoritesRepoImpl repo;

  FavoritesCubit(this.repo) : super(FavoritesLoadingState());

  Future<void> getFavoritesSaved(String key) async {
    emit(
      FavoritesSuccessState(favoritesCharacter: await repo.getFavorites(key)),
    );
  }

  Future<void> saveCharacter(String key, CharacterModel character) async {
    await repo.saveFavoriteCharacter(key, character);
    emit(LocalSaveFavoritesSuccessState());
  }

  Future<void> removeCharacter(String key, CharacterModel character) async {
    await repo.removeFavoriteCharacter(key, character);
    emit(LocalRemoveFavoritesSuccessState());
  }

  Future<void> isFavorite(String key, CharacterModel character) async {
    final isFavorite = await repo.isFavoriteCharacter(key, character);
    emit(LocalIsFavoritesSuccessState(isFavorite));
  }
}
