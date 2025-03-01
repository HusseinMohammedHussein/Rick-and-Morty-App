import 'package:json_annotation/json_annotation.dart';
import 'package:rickandmorty_app/features/home/data/models/character_model.dart';

part 'character_result_model.g.dart';

@JsonSerializable()
class CharacterResultModel {
  InfoModel? info;
  List<CharacterModel>? results;

  CharacterResultModel({this.info, this.results});

  factory CharacterResultModel.fromJson(Map<String, dynamic> json) =>
      _$CharacterResultModelFromJson(json);
}

@JsonSerializable()
class InfoModel {
  int? count;
  int? pages;
  String? next;
  String? prev;

  InfoModel({
    this.count,
    this.pages,
    this.next,
    this.prev,
  });

  factory InfoModel.fromJson(Map<String, dynamic> json) =>
      _$InfoModelFromJson(json);
}
