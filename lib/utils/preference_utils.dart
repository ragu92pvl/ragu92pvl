

import 'package:shared_preferences/shared_preferences.dart';

class PreferenceUtils{

  static saveUserId(String userId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("userId", userId);
  }

  static saveUserToken(String userToken) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("token",userToken);
  }

  static Future<String?> getUserToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("token");
  }

  static Future<String?> getUserId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("userId");
  }

}