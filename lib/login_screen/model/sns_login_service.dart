import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:fx_prj_test_flutter_app/login_screen/profile_page.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as JSON;
import 'package:shared_preferences/shared_preferences.dart';
import '../../SaveDataSharedPreference.dart';
class FBLoginService{
  bool isLogin = false;
  Map userProfile;
  var profileData;
  final facebookLogin = FacebookLogin();
  SharedPreferenceManager sharedPreferenceManager = SharedPreferenceManager();
  static const FB_URL = 'https://graph.facebook.com/v2.12/me?fields=name,picture,email&access_token=';
  /*void onLoginStatusChanged(bool isLoggedIn, {data, BuildContext context})async {
    try {
      UserData data =UserData.fromJson(await sharedPreferenceManager.read("data"));
      Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen(puserId: data.name, paccessToken: 'accestoken', pdisplayName: data.email, pimgUrl:  data.imageUrl, pstatusMessage: data.id,appType: 'facebook',)));
    } catch (Excepetion) {
    // do something
      print('Something worng');
    }
    print('ProfileDataStatus:${profileData.toString()}');
  }*/
  Future<void> displayFBLoginProfile(BuildContext context) async {
    UserData data =UserData.fromJson(await sharedPreferenceManager.read("data"));
    Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen(puserId: data.name, paccessToken: 'accestoken', pdisplayName: data.email, pimgUrl:  data.imageUrl, pstatusMessage: data.id,appType: 'facebook',)));
  }
  void loginWithFB(BuildContext context) async{
    isLogin = await SharedPreferenceManager.getLoginStatus();
    if(isLogin){
      displayFBLoginProfile(context);
    } else {
      initialFBLogin(context);
    }

  }
  void initialFBLogin(BuildContext context) async{
    final result = await facebookLogin.logInWithReadPermissions(['email']);

    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        final token = result.accessToken.token;
        final graphResponse = await http.get(FB_URL+token);
        final profile = JSON.jsonDecode(graphResponse.body);
        SharedPreferenceManager.storedLoginStatus(true);
        UserData data = UserData(profile['name'].toString(),profile['picture']['data']['url'], profile['email'], profile['id'], true);
        sharedPreferenceManager.save("data", data);
        print('ProfileData:${profile.toString()}');

        /*print("profile: $profile");
        String name = profile['name'];
        var picture = profile['picture'];
        var data = picture['data'];
        String url = data['url'];
        String email = profile['email'];
        String userId = profile['id'];*/
        // String acctoken = profile['token'];


        break;

      case FacebookLoginStatus.cancelledByUser:
        SharedPreferenceManager.storedLoginStatus(false);
        break;
      case FacebookLoginStatus.error:
        SharedPreferenceManager.storedLoginStatus(false);
        break;
    }
  }
  void logout(){
    facebookLogin.logOut();
    isLogin = false;
  }
}

class FBLoginStatus {
bool isLoggined;
UserData profileData;
FBLoginStatus({this.isLoggined, this.profileData});

FBLoginStatus.fromJson(Map<String, dynamic> json) {
  isLoggined = json['isLoginned'];
  profileData = json['data'];

}

Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = Map<String, dynamic>();
  data['isLoginned'] = this.isLoggined;
  data['data'] = this.profileData;
  return data;
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