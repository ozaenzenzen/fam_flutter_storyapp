import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_request_model.g.dart';

/// todo-02-04: add this import to insert a generated file
part 'register_request_model.freezed.dart';

/// todo-02-01: change this annotation into freezed
@freezed

/// todo-02-02: change the property and constructor into this code
class RegisterRequestModel with _$RegisterRequestModel {
  const factory RegisterRequestModel({
    required String name,
    required String email,
    required String password,
  }) = _RegisterRequestModel;

  factory RegisterRequestModel.fromJson(Map<String, dynamic> json) => _$RegisterRequestModelFromJson(json);
}
