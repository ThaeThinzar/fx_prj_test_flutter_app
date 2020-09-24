
import 'package:flutter_twitter_login/flutter_twitter_login.dart';
import 'package:fx_prj_test_flutter_app/profile/profile_user.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as JSON;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:flutter_line_sdk/flutter_line_sdk.dart';
import 'package:fx_prj_test_flutter_app/login_screen/profile_page.dart';

class LoginScreen extends StatefulWidget {
  _LoginScreenState createState()=> _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen>{
  bool _isLoggedIn = false;
  Map userProfile;
  final facebookLogin = FacebookLogin();
  static final TwitterLogin twitterLogin = TwitterLogin(
    consumerKey: '2AyxORvtEO7owxOVqnnvcZOQJ',
    consumerSecret: '6oa42K7u7fjH4DVqtiRjcbqwb5sWYDq8vEbyvdZVBdGoJdBcTm',
  );
  bool gotProfile = false;
  GoogleSignIn googleSignIn = GoogleSignIn(clientId: "619033735551-plgl572jufnllvoh011e6cspl14sj8bf.apps.googleusercontent.com");


  _loginWithFB() async{

    final result = await facebookLogin.logInWithReadPermissions(['email']);

    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        final token = result.accessToken.token;
        final graphResponse = await http.get('https://graph.facebook.com/v2.12/me?fields=name,picture,email&access_token=$token');
        final profile = JSON.jsonDecode(graphResponse.body);
        print("profile: $profile");
        //Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen(puserId: profile., paccessToken: accesstoken, pdisplayName: displayname, pimgUrl: imgUrl, pstatusMessage: statusmessage,)));

        setState(() {
          userProfile = profile;
          _isLoggedIn = true;
        });
        break;

      case FacebookLoginStatus.cancelledByUser:
        setState(() => _isLoggedIn = false );
        break;
      case FacebookLoginStatus.error:
        setState(() => _isLoggedIn = false );
        break;
    }

  }
  _logout(){
    facebookLogin.logOut();
    setState(() {
      _isLoggedIn = false;
    });
  }

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

  void _loginwithTwitter() async {
    final TwitterLoginResult result = await twitterLogin.authorize();
    String Message;

    switch (result.status) {
      case TwitterLoginStatus.loggedIn:
        Message = 'Logged in! username: ${result.session.username}';
        var userid = result.session.userId;
        Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen(puserId: 'userId', paccessToken: "2222222222", pdisplayName: result.session.username, pimgUrl: "https://twitter.com/ttks17020866/photo", pstatusMessage: result.session.userId,appType: 'Twitter',)));
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: Image.asset("assets/images/onboard3.png", width: 100, height: 100,),
              ),
              Text("Welcome to Our App", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold ),),
              Text("Please login before you can use", style: TextStyle(fontSize: 15,)),
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
                              _loginwithTwitter();
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
                            _loginWithFB();
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
                          color: Colors.white60,
                          textColor: Colors.white,
                          padding: const EdgeInsets.all(1),
                          child: Column(
                            children: <Widget>[
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Image(
                                      image: AssetImage(
                                        'assets/images/gg_ic.png',
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
              )
            ],
          ),
        ),
      );
    }

  }