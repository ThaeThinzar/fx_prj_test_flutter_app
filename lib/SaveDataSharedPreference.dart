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
}