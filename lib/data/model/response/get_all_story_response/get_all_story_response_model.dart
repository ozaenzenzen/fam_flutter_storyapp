// ignore_for_file: invalid_annotation_target

import 'package:fam_flutter_storyapp/data/model/response/get_all_story_list_story/get_all_story_list_story.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_all_story_response_model.g.dart';
part 'get_all_story_response_model.freezed.dart';

@freezed
class GetAllStoryResponseModel with _$GetAllStoryResponseModel {
  const factory GetAllStoryResponseModel({
    bool? error,
    String? message,
    @JsonKey(
      name: 'listStory',
    )
    List<ListStory>? listStory,
  }) = _GetAllStoryResponseModel;

  factory GetAllStoryResponseModel.fromJson(Map<String, dynamic> json) => _$GetAllStoryResponseModelFromJson(json);
}
