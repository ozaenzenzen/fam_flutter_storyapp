import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_response_result.g.dart';

/// todo-02-04: add this import to insert a generated file
part 'login_response_result.freezed.dart';

/// todo-02-01: change this annotation into freezed
@freezed

/// todo-02-02: change the property and constructor into this code
class LoginResult with _$LoginResult {
  const factory LoginResult({
    String? userId,
    String? name,
    String? token,
  }) = _LoginResult;

  factory LoginResult.fromJson(Map<String, dynamic> json) => _$LoginResultFromJson(json);
}
