// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_detail_story_response_model.g.dart';
part 'get_detail_story_response_model.freezed.dart';

@freezed
class StoryGetDetail with _$StoryGetDetail {
  const factory StoryGetDetail({
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
  }) = _StoryGetDetail;

  factory StoryGetDetail.fromJson(Map<String, dynamic> json) => _$StoryGetDetailFromJson(json);
}

DateTime? dateTimeFromJson(String timestamp) {
  return DateTime.tryParse(timestamp);
}

String dateTimeToJson(DateTime? date) => date!.toIso8601String();
