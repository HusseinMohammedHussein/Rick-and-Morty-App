// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CharacterModel _$CharacterModelFromJson(Map<String, dynamic> json) =>
    CharacterModel(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      status: json['status'] as String?,
      species: json['species'] as String?,
      gender: json['gender'] as String?,
      type: json['type'] as String?,
      image: json['image'] as String?,
      episode:
          (json['episode'] as List<dynamic>?)?.map((e) => e as String).toList(),
      origin: json['origin'] == null
          ? null
          : OriginLocationModel.fromJson(
              json['origin'] as Map<String, dynamic>),
      location: json['location'] == null
          ? null
          : CurrentLocationModel.fromJson(
              json['location'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CharacterModelToJson(CharacterModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'status': instance.status,
      'species': instance.species,
      'gender': instance.gender,
      'type': instance.type,
      'image': instance.image,
      'episode': instance.episode,
      'origin': instance.origin,
      'location': instance.location,
    };

OriginLocationModel _$OriginLocationModelFromJson(Map<String, dynamic> json) =>
    OriginLocationModel(
      name: json['name'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$OriginLocationModelToJson(
        OriginLocationModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };

CurrentLocationModel _$CurrentLocationModelFromJson(
        Map<String, dynamic> json) =>
    CurrentLocationModel(
      name: json['name'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$CurrentLocationModelToJson(
        CurrentLocationModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };
