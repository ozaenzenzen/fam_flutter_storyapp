// ignore_for_file: invalid_annotation_target

import 'dart:io';
import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_story_request_model.g.dart';

/// todo-02-04: add this import to insert a generated file
part 'add_story_request_model.freezed.dart';

/// todo-02-01: change this annotation into freezed
@freezed

/// todo-02-02: change the property and constructor into this code
class AddStoryRequestModel with _$AddStoryRequestModel {
  const factory AddStoryRequestModel({
    // @JsonKey(name: 'description') required String description,
    // @JsonKey(name: 'photo') required File photo,
    // @JsonKey(name: 'lat') double? lat,
    // @JsonKey(name: 'lon') double? lon,
    required String description,
    @JsonKey(
      name: 'photo',
      fromJson: fileFromJson,
      toJson: fileToJson,
    )
    required File photo,
    double? lat,
    double? lon,
  }) = _AddStoryRequestModel;

  factory AddStoryRequestModel.fromJson(Map<String, dynamic> json) => _$AddStoryRequestModelFromJson(json);

  /// todo-02-03: remove toJson method
  ///
}

File fileFromJson(String data) {
  return File.fromRawPath(Uint8List.fromList(data.codeUnits));
}

String fileToJson(File file) => file.path;
