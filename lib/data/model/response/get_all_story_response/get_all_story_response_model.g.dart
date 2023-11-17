// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_story_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetAllStoryResponseModelImpl _$$GetAllStoryResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$GetAllStoryResponseModelImpl(
      error: json['error'] as bool?,
      message: json['message'] as String?,
      listStory: (json['listStory'] as List<dynamic>?)
          ?.map((e) => ListStory.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$GetAllStoryResponseModelImplToJson(
        _$GetAllStoryResponseModelImpl instance) =>
    <String, dynamic>{
      'error': instance.error,
      'message': instance.message,
      'listStory': instance.listStory,
    };
