import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:fx_prj_test_flutter_app/login_screen/profile_page.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as JSON;
import 'package:shared_preferences/shared_preferences.dart';
import '../../SaveDataSharedPreference.dart';
class FBLoginService{
  bool isLogin = false;
  final facebookLogin = FacebookLogin();
  SharedPreferenceManager sharedPreferenceManager = SharedPreferenceManager();
  static const FB_URL = 'https://graph.facebook.com/v2.12/me?fields=name,picture,email&access_token=';

  Future<UserData> displayFBLoginProfile(BuildContext context) async {
    UserData data =UserData.fromJson(await sharedPreferenceManager.read("data"));
    return data;
  }
  Future<UserData> loginWithFB(BuildContext context) async{
    UserData userData;
    isLogin = await SharedPreferenceManager.getLoginStatus();
    if(isLogin){
     userData = await displayFBLoginProfile(context);
     print("Returen Data :${userData.toString()} ");
    } else {
      userData = await  initialFBLogin(context);
      print("Returen Data :${userData.toString()} ");
    }
    return userData;
  }
  Future<UserData> initialFBLogin(BuildContext context) async{
    UserData userData ;
    final result = await facebookLogin.logInWithReadPermissions(['email']);

    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        final token = result.accessToken.token;
        final graphResponse = await http.get(FB_URL+token);
        final profile = JSON.jsonDecode(graphResponse.body);
        SharedPreferenceManager.storedLoginStatus(true);
        UserData data = UserData(profile['name'].toString(),profile['picture']['data']['url'], profile['email'], profile['id'], true);
        sharedPreferenceManager.save("data", data);
        userData = UserData(data.name, data.imageUrl, data.email, data.id, data.isLoggedIn);
        print('Init ProfileData:${profile.toString()}');
        break;

      case FacebookLoginStatus.cancelledByUser:
        SharedPreferenceManager.storedLoginStatus(false);
        break;
      case FacebookLoginStatus.error:
        SharedPreferenceManager.storedLoginStatus(false);
        break;
    }
    return userData;
  }
  void logout(){
    facebookLogin.logOut();
    isLogin = false;
  }
}


class UserData {
  String name;
  String imageUrl;
  String email;
  String id;
  bool isLoggedIn;
  UserData(this.name,this.imageUrl, this.email, this.id,this.isLoggedIn);
  UserData.fromJson(Map<String, dynamic> json) {
    name  = json['name'];
    imageUrl  = json['url'];
    email  = json['email'];
    id = json['id'];
    isLoggedIn = json['isLogin'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = this.name;
    data['url'] = this.imageUrl;
    data['email'] = this.email;
    data['id'] = this.id;
    data['isLogin'] = this.isLoggedIn;
    return data;
  }
}