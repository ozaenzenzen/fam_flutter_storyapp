class AddStoryResponseModel {
  bool? error;
  String? message;

  AddStoryResponseModel({
    this.error,
    this.message,
  });

  factory AddStoryResponseModel.fromJson(Map<String, dynamic> json) => AddStoryResponseModel(
        error: json["error"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "message": message,
      };
}
