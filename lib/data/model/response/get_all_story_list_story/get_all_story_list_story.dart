// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_all_story_list_story.g.dart';
part 'get_all_story_list_story.freezed.dart';

@freezed
class ListStory with _$ListStory {
  const factory ListStory({
    String? id,
    String? name,
    String? description,
    String? photoUrl,
    @JsonKey(
      name: 'createdAt',
      fromJson: dateTimeFromJson,
      toJson: dateTimeToJson,
    )
    DateTime? createdAt,
    double? lat,
    double? lon,
  }) = _ListStory;

  factory ListStory.fromJson(Map<String, dynamic> json) => _$ListStoryFromJson(json);
}

DateTime? dateTimeFromJson(String timestamp) {
  return DateTime.tryParse(timestamp);
}

String dateTimeToJson(DateTime? date) => date!.toIso8601String();
