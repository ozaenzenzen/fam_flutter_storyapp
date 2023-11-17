// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_detail_story_detail_story.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetDetailStoryResponseModelImpl _$$GetDetailStoryResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$GetDetailStoryResponseModelImpl(
      error: json['error'] as bool?,
      message: json['message'] as String?,
      story: json['story'] == null
          ? null
          : StoryGetDetail.fromJson(json['story'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$GetDetailStoryResponseModelImplToJson(
        _$GetDetailStoryResponseModelImpl instance) =>
    <String, dynamic>{
      'error': instance.error,
      'message': instance.message,
      'story': instance.story,
    };
