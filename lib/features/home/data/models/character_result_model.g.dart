// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CharacterResultModel _$CharacterResultModelFromJson(
        Map<String, dynamic> json) =>
    CharacterResultModel(
      info: json['info'] == null
          ? null
          : InfoModel.fromJson(json['info'] as Map<String, dynamic>),
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => CharacterModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CharacterResultModelToJson(
        CharacterResultModel instance) =>
    <String, dynamic>{
      'info': instance.info,
      'results': instance.results,
    };

InfoModel _$InfoModelFromJson(Map<String, dynamic> json) => InfoModel(
      count: (json['count'] as num?)?.toInt(),
      pages: (json['pages'] as num?)?.toInt(),
      next: json['next'] as String?,
      prev: json['prev'] as String?,
    );

Map<String, dynamic> _$InfoModelToJson(InfoModel instance) => <String, dynamic>{
      'count': instance.count,
      'pages': instance.pages,
      'next': instance.next,
      'prev': instance.prev,
    };
