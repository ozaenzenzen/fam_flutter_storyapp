import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_response_model.g.dart';

/// todo-02-04: add this import to insert a generated file
part 'register_response_model.freezed.dart';

/// todo-02-01: change this annotation into freezed
@freezed

/// todo-02-02: change the property and constructor into this code
class RegisterResponseModel with _$RegisterResponseModel {
  const factory RegisterResponseModel({
    bool? error,
    String? message,
  }) = _RegisterResponseModel;

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) => _$RegisterResponseModelFromJson(json);
}
