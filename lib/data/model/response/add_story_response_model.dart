import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_story_response_model.g.dart';

/// todo-02-04: add this import to insert a generated file
part 'add_story_response_model.freezed.dart';

/// todo-02-01: change this annotation into freezed
@freezed

/// todo-02-02: change the property and constructor into this code
class AddStoryResponseModel with _$AddStoryResponseModel {
  const factory AddStoryResponseModel({
    bool? error,
    String? message,
  }) = _AddStoryResponseModel;

  factory AddStoryResponseModel.fromJson(Map<String, dynamic> json) => _$AddStoryResponseModelFromJson(json);
}
