import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop/Model/user.dart';
import 'package:shop/Screens/Login/Loginpage.dart';
import 'package:shop/Shared/constaness/constanesApp.dart';
import 'package:shop/Shared/global/globals.dart';

class Preference {
  static SharedPreferences? preferences;
  static intial() async {
    preferences = await SharedPreferences.getInstance();
  }

  static Future<bool> put({required String key, required String value}) async {
    return await preferences!.setString(key, value);
  }

  static String? get({required String key}) {
    return preferences!.getString(key);
  }

  static void clearprefrences({required BuildContext context}) {
    navigatorPush(context, const LoginPage());
    Preference.put(key: 'id', value: 'null');
    userModel = UserModel.empty();
  }
}
