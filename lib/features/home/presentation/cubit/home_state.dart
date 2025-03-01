part of 'home_cubit.dart';

sealed class HomeState {}

class CharactersInitState extends HomeState {}

class CharactersLoadingState extends HomeState {}

class CharactersSuccessState extends HomeState {
  final CharacterResultModel? characters;
  final bool hasReachedMax;

  CharactersSuccessState({
    this.hasReachedMax = false,
    this.characters,
  });
}

class CharactersFailureState extends HomeState {
  String message;

  CharactersFailureState(this.message);
}
