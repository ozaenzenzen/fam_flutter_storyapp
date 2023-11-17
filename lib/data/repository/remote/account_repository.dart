import 'package:fam_flutter_storyapp/data/model/request/login_request/login_request_model.dart';
import 'package:fam_flutter_storyapp/data/model/request/register_request/register_request_model.dart';
import 'package:fam_flutter_storyapp/data/model/response/login_response/login_response_model.dart';
import 'package:fam_flutter_storyapp/data/model/response/register_response_model.dart';
import 'package:fam_flutter_storyapp/env.dart';
import 'package:fam_flutter_storyapp/support/app_api_path.dart';
import 'package:fam_flutter_storyapp/support/app_api_service.dart';
import 'package:flutter/material.dart';

class AccountRepository {
  Future<LoginResponseModel?> login(LoginRequestModel data) async {
    try {
      final response = await AppApiService(
        EnvironmentConfig.baseUrl(),
      ).call(
        AppApiPath.login,
        request: data.toJson(),
      );
      return LoginResponseModel.fromJson(response.data);
    } catch (errorMessage) {
      debugPrint("[AccountRepository][login] errorMessage $errorMessage");
      return null;
    }
  }

  Future<RegisterResponseModel?> register(RegisterRequestModel data) async {
    try {
      final response = await AppApiService(
        EnvironmentConfig.baseUrl(),
      ).call(
        AppApiPath.register,
        request: data.toJson(),
      );
      return RegisterResponseModel.fromJson(response.data);
    } catch (errorMessage) {
      debugPrint("[AppAccountReposistory][signup] errorMessage $errorMessage");
      return null;
    }
  }
}
