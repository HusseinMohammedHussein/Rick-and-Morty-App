import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:rickandmorty_app/core/database/network/dio_consumer.dart';
import 'package:rickandmorty_app/core/database/network/endpoints.dart';
import 'package:rickandmorty_app/core/error/failure.dart';
import 'package:rickandmorty_app/features/home/data/models/character_result_model.dart';
import 'package:rickandmorty_app/features/home/domain/repositories/home_repo.dart';

class HomeRepoImpl extends HomeRepo {
  final DioConsumer dioConsumer;

  HomeRepoImpl(this.dioConsumer);

  @override
  Future<Either<Failure, CharacterResultModel>> filter(
      {String name = '',
      String status = '',
      String species = '',
      int pageNum = 1}) async {
    try {
      final response = await dioConsumer.get(
        charactersEndpoint,
        queryParameters: {
          pages: pageNum,
          filterByName: name,
          filterByStatus: status,
          filterBySpecies: species,
        },
      );
      log('response:: $response');
      final getFilterResult = CharacterResultModel.fromJson(response);
      return Right(getFilterResult);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
