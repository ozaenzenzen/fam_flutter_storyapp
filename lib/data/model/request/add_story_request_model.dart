class AddStoryRequestModel {
  bool description;
  String photo;
  String lat;
  String lon;

  AddStoryRequestModel({
    required this.description,
    required this.photo,
    required this.lat,
    required this.lon,
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
