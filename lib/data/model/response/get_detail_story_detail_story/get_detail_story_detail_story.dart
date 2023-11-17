// ignore_for_file: invalid_annotation_target

import 'package:fam_flutter_storyapp/data/model/response/get_detail_story_response/get_detail_story_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_detail_story_detail_story.g.dart';
part 'get_detail_story_detail_story.freezed.dart';

@freezed
class GetDetailStoryResponseModel with _$GetDetailStoryResponseModel {
  const factory GetDetailStoryResponseModel({
    bool? error,
    String? message,
    @JsonKey(
      name: 'story',
    )
    StoryGetDetail? story,
  }) = _GetDetailStoryResponseModel;

  factory GetDetailStoryResponseModel.fromJson(Map<String, dynamic> json) => _$GetDetailStoryResponseModelFromJson(json);
}
