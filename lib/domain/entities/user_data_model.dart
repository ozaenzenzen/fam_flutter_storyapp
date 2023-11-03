class UserDataModel {
  String? userId;
  String? name;
  String? token;

  UserDataModel({
    this.userId,
    this.name,
    this.token,
  });

  factory UserDataModel.fromJson(Map<String, dynamic> json) => UserDataModel(
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
