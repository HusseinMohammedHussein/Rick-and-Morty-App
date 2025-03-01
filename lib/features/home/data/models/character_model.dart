import 'package:json_annotation/json_annotation.dart';

part 'character_model.g.dart';

@JsonSerializable()
class CharacterModel {
  int? id;
  String? name;
  String? status;
  String? species;
  String? gender;
  String? type;
  String? image;
  List<String>? episode;
  OriginLocationModel? origin;
  CurrentLocationModel? location;

  CharacterModel({
    this.id,
    this.name,
    this.status,
    this.species,
    this.gender,
    this.type,
    this.image,
    this.episode,
    this.origin,
    this.location,
  });

  factory CharacterModel.fromJson(Map<String, dynamic> json) =>
      _$CharacterModelFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterModelToJson(this);
}

@JsonSerializable()
class OriginLocationModel {
  String? name;
  String? url;

  OriginLocationModel({this.name, this.url});

  factory OriginLocationModel.fromJson(Map<String, dynamic> json) =>
      _$OriginLocationModelFromJson(json);


  Map<String, dynamic> toJson() => _$OriginLocationModelToJson(this);
}

@JsonSerializable()
class CurrentLocationModel {
  String? name;
  String? url;

  CurrentLocationModel({this.name, this.url});

  factory CurrentLocationModel.fromJson(Map<String, dynamic> json) =>
      _$CurrentLocationModelFromJson(json);


  Map<String, dynamic> toJson() => _$CurrentLocationModelToJson(this);
}
