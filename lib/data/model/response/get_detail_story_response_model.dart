class GetDetailStoryResponseModel {
  bool? error;
  String? message;
  StoryGetDetail? story;

  GetDetailStoryResponseModel({
    this.error,
    this.message,
    this.story,
  });

  factory GetDetailStoryResponseModel.fromJson(Map<String, dynamic> json) => GetDetailStoryResponseModel(
        error: json["error"],
        message: json["message"],
        story: json["story"] == null ? null : StoryGetDetail.fromJson(json["story"]),
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "message": message,
        "story": story!.toJson(),
      };
}

class StoryGetDetail {
  String? id;
  String? name;
  String? description;
  String? photoUrl;
  DateTime? createdAt;
  double? lat;
  double? lon;

  StoryGetDetail({
    this.id,
    this.name,
    this.description,
    this.photoUrl,
    this.createdAt,
    this.lat,
    this.lon,
  });

  factory StoryGetDetail.fromJson(Map<String, dynamic> json) => StoryGetDetail(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        photoUrl: json["photoUrl"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        lat: json["lat"]?.toDouble(),
        lon: json["lon"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "photoUrl": photoUrl,
        "createdAt": createdAt!.toIso8601String(),
        "lat": lat,
        "lon": lon,
      };
}
