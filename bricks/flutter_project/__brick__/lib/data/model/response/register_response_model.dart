class {{registerClassName.pascalCase()}}ResponseModel {
  bool? error;
  String? message;

  {{registerClassName.pascalCase()}}ResponseModel({
    this.error,
    this.message,
  });

  factory {{registerClassName.pascalCase()}}ResponseModel.fromJson(Map<String, dynamic> json) => {{registerClassName.pascalCase()}}ResponseModel(
        error: json["error"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "message": message,
      };
}
