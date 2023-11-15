class {{addStoryClassName.pascalCase()}}ResponseModel {
  bool? error;
  String? message;

  {{addStoryClassName.pascalCase()}}ResponseModel({
    this.error,
    this.message,
  });

  factory {{addStoryClassName.pascalCase()}}ResponseModel.fromJson(Map<String, dynamic> json) => {{addStoryClassName.pascalCase()}}ResponseModel(
        error: json["error"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "message": message,
      };
}
