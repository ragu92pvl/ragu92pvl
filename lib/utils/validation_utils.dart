

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ValidationUtils{

  static bool emptyValidation(String value){
    if(value.isNotEmpty){
      return true;
    }else{
      return false;
    }
  }

  static bool emptyIntegerValidation(int value){
    if(value.toString().isNotEmpty){
      return true;
    }else{
      return false;
    }
  }

  static showAppToast(String value){
    Fluttertoast.showToast(
        msg: value,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }

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