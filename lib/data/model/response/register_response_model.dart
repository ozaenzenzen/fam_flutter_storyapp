class RegisterResponseModel {
  bool? error;
  String? message;

  RegisterResponseModel({
    this.error,
    this.message,
  });

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) => RegisterResponseModel(
        error: json["error"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "message": message,
      };
}
