class {{registerClassName.pascalCase()}}RequestModel {
  String name;
  String email;
  String password;

  {{registerClassName.pascalCase()}}RequestModel({
    required this.name,
    required this.email,
    required this.password,
  });

  factory {{registerClassName.pascalCase()}}RequestModel.fromJson(Map<String, dynamic> json) => {{registerClassName.pascalCase()}}RequestModel(
        name: json["name"],
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "password": password,
      };
}
