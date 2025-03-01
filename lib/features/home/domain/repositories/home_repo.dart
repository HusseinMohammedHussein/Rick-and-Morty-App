import 'package:dartz/dartz.dart';
import 'package:rickandmorty_app/core/error/failure.dart';
import 'package:rickandmorty_app/features/home/data/models/character_result_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, CharacterResultModel>> filter({
    int pageNum = 1,
    String name = '',
    String status = '',
    String species = '',
  });
}
