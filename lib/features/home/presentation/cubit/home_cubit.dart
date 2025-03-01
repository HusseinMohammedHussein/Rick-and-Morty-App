import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:rickandmorty_app/features/home/data/models/character_model.dart';
import 'package:rickandmorty_app/features/home/data/models/character_result_model.dart';
import 'package:rickandmorty_app/features/home/data/repositories/home_repo_impl.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepoImpl repoImpl;

  HomeCubit(this.repoImpl) : super(CharactersInitState());

  // filters
  final findByNameController = TextEditingController();
  final findBySpeciesController = TextEditingController();
  String findByStatus = '';

  // data list
  List<CharacterModel> characters = [];

  // pagination
  int pageNum = 1;

  bool hasReachedMax = false;

  Future<void> getCharactersWithFilters() async {
    log('findByStatus::::::: $findByStatus');
    emit(CharactersLoadingState());
    final response = await repoImpl.filter(
      pageNum: pageNum,
      name: findByNameController.text,
      status: findByStatus,
      species: findBySpeciesController.text,
    );
    response.fold(
      (lift) {
        emit(
          CharactersFailureState(lift.errorMessage),
        );
      },
      (right) {
        int? limit = right.info?.pages;
        log('count:: $limit - PageNum:: $pageNum');
        characters = right.results!;
        if (pageNum < limit!) {
          pageNum++;
        }
        hasReachedMax = pageNum == limit;
        emit(CharactersSuccessState(
          characters: right,
          hasReachedMax: hasReachedMax,
        ));
      },
    );
  }

// fetch by pagination
/*Future<void> loadMoreCharacters() async {
    log('page_number:: $pageNum');
    final response = await repoImpl.filter(
      pageNum: pageNum,
      name: findByNameController.text,
      status: findByStatus,
      species: findBySpeciesController.text,
    );
    response.fold(
      (left) => emit(CharactersFailureState(left.errorMessage)),
      (right) {
        int? limit = right.info?.pages;
        log('count:: $limit - PageNum:: $pageNum');
        if (pageNum < limit!) {
          pageNum++;
        }
        hasReachedMax = pageNum == limit;
        if (right.results!.isNotEmpty) {
          characters.addAll(right.results!);
        }
        emit(CharactersSuccessState(

        ));
      },
    );
  }*/
}
