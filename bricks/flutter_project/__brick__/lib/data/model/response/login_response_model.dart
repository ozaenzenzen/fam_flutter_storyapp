class {{loginClassName.pascalCase()}}ResponseModel {
  bool? error;
  String? message;
  {{loginClassName.pascalCase()}}Result? loginResult;

  {{loginClassName.pascalCase()}}ResponseModel({
    this.error,
    this.message,
    this.loginResult,
  });

  factory {{loginClassName.pascalCase()}}ResponseModel.fromJson(Map<String, dynamic> json) => {{loginClassName.pascalCase()}}ResponseModel(
        error: json["error"],
        message: json["message"],
        loginResult: json["loginResult"] == null ? null : {{loginClassName.pascalCase()}}Result.fromJson(json["loginResult"]),
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "message": message,
        "loginResult": loginResult?.toJson(),
      };
}

class {{loginClassName.pascalCase()}}Result {
  String? userId;
  String? name;
  String? token;

  {{loginClassName.pascalCase()}}Result({
    this.userId,
    this.name,
    this.token,
  });

  factory {{loginClassName.pascalCase()}}Result.fromJson(Map<String, dynamic> json) => {{loginClassName.pascalCase()}}Result(
        userId: json["userId"],
        name: json["name"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "name": name,
        "token": token,
      };
}
