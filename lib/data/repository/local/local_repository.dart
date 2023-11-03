import 'dart:convert';

import 'package:fam_flutter_storyapp/domain/entities/user_data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keychain/flutter_keychain.dart';

class LocalRepository {
  static Future<bool> getIsLogin() async {
    try {
      String isLogin = await FlutterKeychain.get(key: 'isLogin') ?? "";
      if (isLogin == "") {
        return false;
      } else {
        bool decode = jsonDecode(isLogin);
        return decode;
      }
    } catch (e) {
      return false;
    }
  }

  static Future<void> setIsLogin(bool value) async {
    try {
      await FlutterKeychain.put(key: 'isLogin', value: jsonEncode(value));
    } catch (e) {
      debugPrint('error setLogin $e');
    }
  }

  static Future<UserDataModel?> getUserData(String value) async {
    try {
      String isLogin = await FlutterKeychain.get(key: 'userData') ?? "";
      if (isLogin == "") {
        return null;
      } else {
        UserDataModel decode = UserDataModel.fromJson(jsonDecode(isLogin));
        return decode;
      }
    } catch (e) {
      return null;
    }
  }

  static Future<void> setUserData(UserDataModel value) async {
    try {
      await FlutterKeychain.put(key: 'userData', value: jsonEncode(value.toJson()));
    } catch (e) {
      debugPrint('error setUserData $e');
    }
  }
}
