
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_line_sdk/flutter_line_sdk.dart';
import 'package:flutter_twitter_login/flutter_twitter_login.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'login_screen.dart';

class ProfileScreen extends StatefulWidget{
  final String puserId;
  final String pdisplayName;
  final String pstatusMessage;
  final String paccessToken;
  final String pimgUrl;
  final String appType;
  ProfileScreen({Key key, @required this.puserId, @required this.pdisplayName, @required this.pstatusMessage, @required this.paccessToken, @required this.pimgUrl, @required this.appType}) : super(key: key);

  ProfileScreenState createState()=> ProfileScreenState();
}
class ProfileScreenState extends State<ProfileScreen>{
  String displayName = "{DisplayName}";
  String statusMessage = "{Status}";
  String imgUrl = "{imgUrl}";
  String accessToken = "{AccessToken}";
  String userId = "{userId}";
  String appType = "{'App'}";
  GoogleSignIn googleSignIn = GoogleSignIn(clientId: "619033735551-plgl572jufnllvoh011e6cspl14sj8bf.apps.googleusercontent.com");
  static final TwitterLogin twitterLogin = TwitterLogin(
    consumerKey: '2AyxORvtEO7owxOVqnnvcZOQJ',
    consumerSecret: '6oa42K7u7fjH4DVqtiRjcbqwb5sWYDq8vEbyvdZVBdGoJdBcTm',
  );
  void logout() async{
    try {
      switch (appType.toString()){
        case "Google":
          await googleSignIn.signOut();
          Navigator.pop(context);
          break;
        case "Line":
          await LineSDK.instance.logout();
          Navigator.pop(context);
          break;
        case "Twitter":
          await twitterLogin.logOut();
          Navigator.pop(context);
          break;
        default:
          print("Login with Nothing");
          break;
      }

    } on PlatformException catch (e) {
      print(e.message);
    }
  }
  @override
  void initState() {
    setState(() {
      userId = widget.puserId;
      displayName = widget.pdisplayName;
      statusMessage = widget.pstatusMessage;
      imgUrl = widget.pimgUrl;
      accessToken = widget.paccessToken;
      appType = widget.appType;
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Line Login With profiele"),),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(30),
                  child: imgUrl != null ?Image.network(imgUrl, width: 200, height: 200,) :Image.network('https://vignette.wikia.nocookie.net/a-day-before-us/images/9/99/YeoReum.png/revision/latest?cb=20180725160827', width: 200, height: 200,),
                ),
              ],

            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text("Welcome", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("* DisplayName:", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                ),
              ],
            ),
            Wrap(
              children: <Widget>[
                Padding(padding: EdgeInsets.all(8.0),
                  child: Text(displayName,style: TextStyle(fontSize: 20),),)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("* userId:", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                ),
              ],
            ),
            Wrap(
              children: <Widget>[
                Padding(padding: EdgeInsets.all(8.0),
                  child: Text(userId,style: TextStyle(fontSize: 20),),)
              ],),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("* StatusMessage:", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                ),
              ],
            ),
            Wrap(
              children: <Widget>[
                Padding(padding: EdgeInsets.all(8.0),
                  child: Text(statusMessage,style: TextStyle(fontSize: 20),),)
              ],),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("* accessToken:", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                ),
              ],
            ),
            Wrap(
              children: <Widget>[
                Padding(padding: EdgeInsets.all(8.0),
                  child: Text(accessToken,style: TextStyle(fontSize: 15),),)
              ],),
            Row(children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: FlatButton(
                    child: Text("Log Out", style: TextStyle(color: Colors.white),),
                    color: Color.fromRGBO(255, 59, 10, 1),
                    padding: EdgeInsets.all(8),
                    onPressed: () {
                      logout();
                    },),
                ),
              )
            ],)

          ],
        ),
      ),
    );
  }

}