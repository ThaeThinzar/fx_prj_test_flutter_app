import 'dart:convert';

import 'package:fx_prj_test_flutter_app/login_screen/model/sns_login_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceManager{

 static void storedRTLOption(bool isRTLOn) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool('isRTLOn', isRTLOn);
  }

 static Future<bool> getRTLOptionStatus() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getBool('isRTLOn') ?? false;
  }
  static void storedLoginStatus(bool isLoggedIn)async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool('isLoggedIn', isLoggedIn);
  }
 static Future<bool> getLoginStatus() async {
   SharedPreferences pref = await SharedPreferences.getInstance();
   return pref.getBool('isRTLOn') ?? false;
 }
 read(String key) async {
   final prefs = await SharedPreferences.getInstance();
   return json.decode(prefs.getString(key));
 }

 save(String key, value) async {
   final prefs = await SharedPreferences.getInstance();
   prefs.setString(key, json.encode(value));
 }
}