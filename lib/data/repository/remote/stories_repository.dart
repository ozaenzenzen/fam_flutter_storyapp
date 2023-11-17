import 'package:fam_flutter_storyapp/data/model/request/add_story_request/add_story_request_model.dart';
import 'package:fam_flutter_storyapp/data/model/response/add_story_response_model.dart';
import 'package:fam_flutter_storyapp/data/model/response/get_all_story_response/get_all_story_response_model.dart';
import 'package:fam_flutter_storyapp/data/model/response/get_detail_story_detail_story/get_detail_story_detail_story.dart';
import 'package:fam_flutter_storyapp/env.dart';
import 'package:fam_flutter_storyapp/support/app_api_path.dart';
import 'package:fam_flutter_storyapp/support/app_api_service.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';

class StoriesRepository {
  Future<AddStoryResponseModel?> addStory(AddStoryRequestModel data, String token) async {
    try {
      final response = await AppApiService(
        EnvironmentConfig.baseUrl(),
      ).call(
        AppApiPath.stories,
        // request: data.toJson(),
        request: (data.lat == null || data.lon == null)
            ? {
                'description': data.description,
                'photo': await MultipartFile.fromFile(
                  data.photo.path,
                  filename: data.photo.path.split('/').last,
                  contentType: MediaType("image", "jpeg"),
                ),
              }
            : {
                'description': data.description,
                'photo': await MultipartFile.fromFile(
                  data.photo.path,
                  filename: data.photo.path.split('/').last,
                  contentType: MediaType("image", "jpeg"),
                ),
                'lat': data.lat,
                'lon': data.lon,
              },
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

  Future<GetAllStoryResponseModel?> getAllStory({
    required String token,
    String? page,
    String? size,
    String? location,
  }) async {
    try {
      final response = await AppApiService(
        EnvironmentConfig.baseUrl(),
      ).call(
        (page == null || size == null || location == null) ? AppApiPath.stories : "${AppApiPath.stories}?page=$page&size=$size&location=$location",
        token: token,
        method: MethodRequest.get,
      );
      return GetAllStoryResponseModel.fromJson(response.data);
    } catch (errorMessage) {
      debugPrint("[StoriesRepository][getAllStory] errorMessage $errorMessage");
      return null;
    }
  }

  Future<GetDetailStoryResponseModel?> getDetailStory({
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
      return GetDetailStoryResponseModel.fromJson(response.data);
    } catch (errorMessage) {
      debugPrint("[StoriesRepository][getDetailStory] errorMessage $errorMessage");
      return null;
    }
  }
}
