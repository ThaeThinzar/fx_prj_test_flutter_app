
import 'package:flutter_twitter_login/flutter_twitter_login.dart';
import 'package:fx_prj_test_flutter_app/login_screen/model/sns_login_service.dart';
import 'package:fx_prj_test_flutter_app/profile/profile_user.dart';
import 'package:fx_prj_test_flutter_app/slide_gesture/SlidePage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as JSON;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:flutter_line_sdk/flutter_line_sdk.dart';
import 'package:fx_prj_test_flutter_app/login_screen/profile_page.dart';
import 'package:swipedetector/swipedetector.dart';

class LoginScreen extends StatefulWidget {
  _LoginScreenState createState()=> _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen>{
  bool _isLoggedIn = false;
  Map userProfile;
  FBLoginService service = FBLoginService();
 // var profileData;
 // final facebookLogin = FacebookLogin();
  //static const FB_URL = 'https://graph.facebook.com/v2.12/me?fields=name,picture,email&access_token=';
  static final TwitterLogin twitterLogin = TwitterLogin(
    consumerKey: '2AyxORvtEO7owxOVqnnvcZOQJ',
    consumerSecret: '6oa42K7u7fjH4DVqtiRjcbqwb5sWYDq8vEbyvdZVBdGoJdBcTm',
  );
  bool gotProfile = false;
  GoogleSignIn googleSignIn = GoogleSignIn(clientId: "619033735551-plgl572jufnllvoh011e6cspl14sj8bf.apps.googleusercontent.com");

  /*void onLoginStatusChanged(bool isLoggedIn, {profileData}) {
    setState(() {
      this._isLoggedIn = isLoggedIn;
      this.profileData = profileData;
    });
  }*/
/*  _loginWithFB() async{

    if(_isLoggedIn){
      service.displayFBLoginProfile(context);
    } else {
      service.initialFBLogin();
    }

  }*/
/*
  void initialFBLogin() async{
    final result = await facebookLogin.logInWithReadPermissions(['email']);

    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        final token = result.accessToken.token;
        final graphResponse = await http.get(FB_URL+token);
        final profile = JSON.jsonDecode(graphResponse.body);
        onLoginStatusChanged(true, profileData: profile);
        */
/*print("profile: $profile");
        String name = profile['name'];
        var picture = profile['picture'];
        var data = picture['data'];
        String url = data['url'];
        String email = profile['email'];
        String userId = profile['id'];*//*

        // String acctoken = profile['token'];
        _displayFBLoginProfile(profileData);
        setState(() {
          userProfile = profile;
          _isLoggedIn = true;
        });
        break;

      case FacebookLoginStatus.cancelledByUser:
       // setState(() => _isLoggedIn = false );
        onLoginStatusChanged(false);
        break;
      case FacebookLoginStatus.error:
        onLoginStatusChanged(false);
        break;
    }
  }
*/
/*  _displayFBLoginProfile(profileData){
    Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen(puserId: profileData['name'], paccessToken: 'accestoken', pdisplayName: profileData['email'], pimgUrl:  profileData['picture']['data']['url'], pstatusMessage: 'statusmessage',appType: 'facebook',)));

  }*/
/*  _logout(){
    facebookLogin.logOut();
    setState(() {
      _isLoggedIn = false;
    });
  }*/

  void startLineLogin() async{
    try {
      final result = await LineSDK.instance.login(scopes: ["profile"]);
      print(result.toString());
      var accesstoken = await getAccessToken();
      var displayname = result.userProfile.displayName;
      var statusmessage = result.userProfile.statusMessage;
      var imgUrl = result.userProfile.pictureUrl;
      var userId = result.userProfile.userId;

      print("AccessToken> " + accesstoken);
      print("DisplayName> " + displayname);
      print("StatusMessage> " + statusmessage);
      print("ProfileURL> " + imgUrl);
      print("userId> " + userId);

      Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen(puserId: userId, paccessToken: accesstoken, pdisplayName: displayname, pimgUrl: imgUrl, pstatusMessage: statusmessage,appType: 'Line',)));

    } on PlatformException catch (e) {
      print(e);
      switch (e.code.toString()){
        case "CANCEL":
          showDialogBox("You canceled the login.", "A moment you pressed cancel login Please log in again.");
          print("User Cancel the login");
          break;
        case "AUTHENTICATION_AGENT_ERROR":
          showDialogBox("You are not allowed to log in as well LINE", "A moment you pressed cancel login Please log in again.");
          print("User decline the login");
          break;
        default:
          showDialogBox("Something went wrong", "An unknown error occurred. Please log in again.");
          print("Unknown but failed to login");
          break;
      }
    }
  }
  Future getAccessToken() async{
    try {
      final result = await LineSDK.instance.currentAccessToken;
      return result.value;
    }  on PlatformException catch (e) {
      print(e.message);
    }
  }
  void showDialogBox(String title, String body) async{
    return showDialog<void>(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: SingleChildScrollView(
              child: ListBody(children: <Widget>[
                Text(body)
              ],),
            ),
            actions: <Widget>[
              FlatButton(
                  child: Text("Close"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],);
        }
    );
  }
  void lineSDKInit() async{
    await LineSDK.instance.setup("1654951350").then((_){// set up your channel ID
      print("LineSDK is Prepared");
    });
  }
  void startGoogleSignIn() async{
    GoogleSignInAccount user = await googleSignIn.signIn();

    //getProfile();
    final GoogleSignInAuthentication googleAuth = await user.authentication;
    if(user == null){
      print('Sign in fail');
    } else {
      await googleSignIn.signInSilently();
      var account = googleSignIn.currentUser;
      var auth = await account.authentication;
      print(account);
      Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen(puserId: 'userId', paccessToken: "2222222222", pdisplayName: account.displayName, pimgUrl: account.photoUrl, pstatusMessage: account.email,appType: 'Google',)));

    }

  }

  void checkSignInStatus() async{
      await Future.delayed(Duration(seconds: 2));

      bool isSignedIn = await googleSignIn.isSignedIn();
      if(isSignedIn){
        print('User already Signed In');
        // Navigator.pushReplacementNamed(context, '/')
      } else {
        print('NOt signed in ye');

      }
    }

  void _loginWithTwitter() async {
    final TwitterLoginResult result = await twitterLogin.authorize();
    String Message;

    switch (result.status) {
      case TwitterLoginStatus.loggedIn:
        Message = 'Logged in! username: ${result.session.username}';
        var userid = result.session.userId;
        Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen(puserId: result.session.userId, paccessToken: "******", pdisplayName: result.session.username, pimgUrl: "https://twitter.com/ttks154/photo", pstatusMessage: "Welcome to my Page",appType: 'Twitter',)));
        break;
      case TwitterLoginStatus.cancelledByUser:
        Message = 'Login cancelled by user.';
        break;
      case TwitterLoginStatus.error:
        Message = 'Login error: ${result.errorMessage}';
        break;
    }
  }

    @override
    void initState() {
      lineSDKInit();
      checkSignInStatus();
      super.initState();
    }
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body:Center(
          child: SwipeDetector(
            child:
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 50),
                  child: Image.asset("assets/images/onboard3.png", width: 100, height: 100,),
                ),
                Text("Welcome to Our App", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold ),),
                Text("Please login with SNS before you can use", style: TextStyle(fontSize: 15,)),
                Padding(
                  padding: const EdgeInsets.only(left:24, right:24,top: 15),
                  child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(top: 0, bottom: 10, right: 10, left: 10),
                            child: RaisedButton(
                              color: Color.fromRGBO(0, 185, 0, 1),
                              textColor: Colors.white,
                              padding: const EdgeInsets.all(1),
                              child: Column(
                                children: <Widget>[
                                  Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: <Widget>[
                                        Image(
                                          image: AssetImage(
                                            'assets/images/line_logo.png',
                                          ),
                                          height: 50,
                                          width: 50,
                                        ),
                                        Container(
                                          color: Colors.black12,
                                          width: 2,
                                          height: 40,
                                        ),
                                        Expanded(
                                          child: Center(child: Text("LINEでログイン", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold))),)
                                      ]
                                  ),
                                ],
                              ),
                              onPressed: (){
                                startLineLogin();
                              },
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                      ]
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(left:24, right:24,top: 15),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(top: 0, bottom: 10, right: 10, left: 10),
                            child: RaisedButton(
                              color: Color.fromRGBO(0, 120, 225, 1),
                              textColor: Colors.white,
                              padding: const EdgeInsets.all(1),
                              child: Column(
                                children: <Widget>[
                                  Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: <Widget>[
                                        Image(
                                          image: AssetImage(
                                            'assets/images/twitter_ic.png',
                                          ),
                                          height: 50,
                                          width: 50,
                                        ),
                                        Container(
                                          color: Colors.black12,
                                          width: 2,
                                          height: 40,
                                        ),
                                        Expanded(
                                          child: Center(child: Text("Twitter でログイン", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold))),)
                                      ]
                                  )
                                ],
                              ),
                              onPressed: (){
                                _loginWithTwitter();
                              },
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                ),
                Padding(
                    padding: const EdgeInsets.only(left:24, right:24,top: 15),
                    child:  Row(
                      children: [Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(top: 0, bottom: 10, right: 10, left: 10),
                          child: RaisedButton(
                            color: Color.fromRGBO(0, 120, 225, 1),
                            textColor: Colors.white,
                            padding: const EdgeInsets.all(1),
                            child: Column(
                              children: <Widget>[
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Image(
                                        image: AssetImage(
                                          'assets/images/facebook_icon.png',
                                        ),
                                        height: 50,
                                        width: 50,
                                      ),
                                      Container(
                                        color: Colors.black12,
                                        width: 2,
                                        height: 40,
                                      ),
                                      Expanded(
                                        child: Center(child: Text("Facebook でログイン", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold))),)
                                    ]
                                )
                              ],
                            ),
                            onPressed: (){
                              service.loginWithFB(context);
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),],
                    )
                ),
                Padding(
                    padding: const EdgeInsets.only(left:24, right:24,top: 15),
                    child:Row(
                      children: [Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(top: 0, bottom: 10, right: 10, left: 10),
                          child: RaisedButton(
                            color: Colors.white24,
                            textColor: Colors.white,
                            padding: const EdgeInsets.all(1),
                            child: Column(
                              children: <Widget>[
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        padding: EdgeInsets.all(8),
                                        child: Image(
                                          image: AssetImage(
                                            'assets/images/gg_ic.png',
                                          ),
                                          height: 40,
                                          width: 40,
                                        ),
                                      ),
                                      Container(
                                        color: Colors.black12,
                                        width: 2,
                                        height: 40,
                                      ),
                                      Expanded(
                                        child: Center(child: Text("Google でログイン", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold))),)
                                    ]
                                )
                              ],
                            ),
                            onPressed: (){
                              startGoogleSignIn();
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),],
                    )
                ),
                RaisedButton(
                  onPressed: (){
                    Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
                            return SecondSlidePage();
                          },
                          transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
                            return SlideTransition(
                              position: new Tween<Offset>(
                                begin: const Offset(0.0, -1.0),
                                end: Offset.zero,
                              ).animate(animation),
                              child: new SlideTransition(
                                position: new Tween<Offset>(
                                  begin: Offset.zero,
                                  end: const Offset(0.0, -1.0),
                                ).animate(secondaryAnimation),
                                child: child,
                              ),
                            );
                          },
                        )
                    );
                  },
                  child: Text("Help Page"),
                ),
              ],
            ),
            onSwipeDown: (){
              Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
                      return SecondSlidePage();
                    },
                    transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
                      return SlideTransition(
                        position: new Tween<Offset>(
                          begin: const Offset(0.0, -1.0),
                          end: Offset.zero,
                        ).animate(animation),
                        child: new SlideTransition(
                          position: new Tween<Offset>(
                            begin: Offset.zero,
                            end: const Offset(0.0, -1.0),
                          ).animate(secondaryAnimation),
                          child: child,
                        ),
                      );
                    },
                  )
              );
            },
          ),
        ),
      );
    }

  }