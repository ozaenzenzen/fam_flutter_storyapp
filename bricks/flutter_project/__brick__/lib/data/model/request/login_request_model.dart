class {{loginClassName.pascalCase()}}RequestModel {
  String email;
  String password;

  {{loginClassName.pascalCase()}}RequestModel({
    required this.email,
    required this.password,
  });

  factory {{loginClassName.pascalCase()}}RequestModel.fromJson(Map<String, dynamic> json) => {{loginClassName.pascalCase()}}RequestModel(
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
      };
}
