// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_story_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AddStoryRequestModelImpl _$$AddStoryRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AddStoryRequestModelImpl(
      description: json['description'] as String,
      photo: fileFromJson(json['photo'] as String),
      lat: (json['lat'] as num?)?.toDouble(),
      lon: (json['lon'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$AddStoryRequestModelImplToJson(
        _$AddStoryRequestModelImpl instance) =>
    <String, dynamic>{
      'description': instance.description,
      'photo': fileToJson(instance.photo),
      'lat': instance.lat,
      'lon': instance.lon,
    };
