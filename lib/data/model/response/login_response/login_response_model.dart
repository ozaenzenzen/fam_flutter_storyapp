// ignore_for_file: invalid_annotation_target
import 'package:fam_flutter_storyapp/data/model/response/login_response_result/login_response_result.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_response_model.g.dart';
part 'login_response_model.freezed.dart';

@freezed
class LoginResponseModel with _$LoginResponseModel {
  const factory LoginResponseModel({
    bool? error,
    String? message,
    @JsonKey(
      name: 'loginResult',
    )
    LoginResult? loginResult,
  }) = _LoginResponseModel;

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) => _$LoginResponseModelFromJson(json);
}
