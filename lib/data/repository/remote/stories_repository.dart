import 'package:fam_flutter_storyapp/data/model/request/add_story_request_model.dart';
import 'package:fam_flutter_storyapp/data/model/response/add_story_response_model.dart';
import 'package:fam_flutter_storyapp/data/model/response/get_all_story_response_model.dart';
import 'package:fam_flutter_storyapp/env.dart';
import 'package:fam_flutter_storyapp/support/app_api_path.dart';
import 'package:fam_flutter_storyapp/support/app_api_service.dart';
import 'package:flutter/material.dart';

class StoriesRepository {
  Future<AddStoryResponseModel?> addStory(AddStoryRequestModel data, String token) async {
    try {
      final response = await AppApiService(
        EnvironmentConfig.baseUrl(),
      ).call(
        AppApiPath.stories,
        request: data.toJson(),
        method: MethodRequest.post,
        header: {
          // 'Authorization' : 'Bearer $token',
          'Content-Type': 'multipart/form-data',
        },
        token: token,
        useFormData: true,
      );
      return AddStoryResponseModel.fromJson(response.data);
    } catch (errorMessage) {
      debugPrint("[StoriesRepository][addStory] errorMessage $errorMessage");
      return null;
    }
  }

  Future<AddStoryResponseModel?> addStoryGuest(AddStoryRequestModel data) async {
    try {
      final response = await AppApiService(
        EnvironmentConfig.baseUrl(),
      ).call(
        AppApiPath.storiesGuest,
        request: data.toJson(),
        method: MethodRequest.post,
        useFormData: true,
      );
      return AddStoryResponseModel.fromJson(response.data);
    } catch (errorMessage) {
      debugPrint("[StoriesRepository][addStoryGuest] errorMessage $errorMessage");
      return null;
    }
  }

  Future<GetAllStoryResponseModel?> getAllStory(String token) async {
    try {
      final response = await AppApiService(
        EnvironmentConfig.baseUrl(),
      ).call(
        AppApiPath.stories,
        token: token,
        method: MethodRequest.get,
      );
      return GetAllStoryResponseModel.fromJson(response.data);
    } catch (errorMessage) {
      debugPrint("[StoriesRepository][getAllStory] errorMessage $errorMessage");
      return null;
    }
  }

  Future<GetAllStoryResponseModel?> getDetailStory({
    required String token,
    required String idStory,
  }) async {
    try {
      final response = await AppApiService(
        EnvironmentConfig.baseUrl(),
      ).call(
        "${AppApiPath.stories}/$idStory",
        token: token,
        method: MethodRequest.get,
      );
      return GetAllStoryResponseModel.fromJson(response.data);
    } catch (errorMessage) {
      debugPrint("[StoriesRepository][getAllStory] errorMessage $errorMessage");
      return null;
    }
  }
}
