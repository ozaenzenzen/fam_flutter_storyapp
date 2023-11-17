import 'dart:io';

class {{addStoryClassName.pascalCase()}}RequestModel {
  String description;
  File photo;
  double? lat;
  double? lon;

  {{addStoryClassName.pascalCase()}}RequestModel({
    required this.description,
    required this.photo,
    this.lat,
    this.lon,
  });

  factory {{addStoryClassName.pascalCase()}}RequestModel.fromJson(Map<String, dynamic> json) => {{addStoryClassName.pascalCase()}}RequestModel(
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
