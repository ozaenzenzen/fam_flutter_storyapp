// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_detail_story_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StoryGetDetailImpl _$$StoryGetDetailImplFromJson(Map<String, dynamic> json) =>
    _$StoryGetDetailImpl(
      id: json['id'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      photoUrl: json['photoUrl'] as String?,
      createdAt: dateTimeFromJson(json['createdAt'] as String),
      lat: (json['lat'] as num?)?.toDouble(),
      lon: (json['lon'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$StoryGetDetailImplToJson(
        _$StoryGetDetailImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'photoUrl': instance.photoUrl,
      'createdAt': dateTimeToJson(instance.createdAt),
      'lat': instance.lat,
      'lon': instance.lon,
    };
