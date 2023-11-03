import 'dart:convert';

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
}
