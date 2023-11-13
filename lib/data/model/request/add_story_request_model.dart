import 'dart:io';

class AddStoryRequestModel {
  String description;
  File photo;
  double? lat;
  double? lon;

  AddStoryRequestModel({
    required this.description,
    required this.photo,
    this.lat,
    this.lon,
  });

  factory AddStoryRequestModel.fromJson(Map<String, dynamic> json) => AddStoryRequestModel(
        description: json["description"],
        photo: json["photo"],
        lat: json["lat"],
        lon: json["lon"],
      );

  Map<String, dynamic> toJson() => {
        "description": description,
        "photo": photo,
        "lat": lat,
        "lon": lon,
      };
}
