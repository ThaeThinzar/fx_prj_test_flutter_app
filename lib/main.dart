import 'package:feature_discovery/feature_discovery.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fx_prj_test_flutter_app/Gesture/MyGesturePage.dart';
import 'package:fx_prj_test_flutter_app/TapSwipe/tap_home.dart';
import 'package:fx_prj_test_flutter_app/TapSwipe/tap_swipe.dart';
import 'package:fx_prj_test_flutter_app/home/homebase.dart';
import 'package:fx_prj_test_flutter_app/home/share_social.dart';
import 'package:fx_prj_test_flutter_app/login_screen/google_sign.dart';
import 'package:fx_prj_test_flutter_app/login_screen/login_screen.dart';
import 'package:fx_prj_test_flutter_app/login_screen/profile_fb_page.dart';
import 'package:fx_prj_test_flutter_app/login_screen/twitter_login.dart';
import 'package:fx_prj_test_flutter_app/onboard/InitialPage.dart';
import 'package:fx_prj_test_flutter_app/onboard/feature_discovery_walkthrough.dart';
import 'package:fx_prj_test_flutter_app/onboard/friend_list.dart';
import 'package:fx_prj_test_flutter_app/onboard/onboard_orginal_test.dart';
import 'package:fx_prj_test_flutter_app/onboard/onboard_page.dart';
import 'package:fx_prj_test_flutter_app/onboard/tuturial_walkthrough_main.dart';
import 'package:fx_prj_test_flutter_app/onboard/walk_through.dart';
import 'package:fx_prj_test_flutter_app/onboard/walkthought_feature.dart';
import 'package:fx_prj_test_flutter_app/slide_gesture/SlidePage.dart';
import 'package:google_sign_in/google_sign_in.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates:[
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        Locale("en", "US"),
        Locale('ja',"JP"),
        Locale("fa", "IR"), // OR Locale('ar', 'AE') OR Other RTL locales
      ],
      locale: Locale("fa", "IR") ,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Test FX Project')
      //MyHomePage(title:'FX project Test')
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
        actions: [

        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => TutorialWalkThroughMain()
              )
              );
            },
            child: Text("Tutorial Walk Through"),
            ),
            RaisedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => LoginScreen()
                )
                );
              },
              child: Text("Login/Sign UP SNS"),
            ),
            RaisedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => HelpPage()
                )
                );
              },
              child: Text("Help Page"),
            ),
            RaisedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => HomeBase()
                )
                );
              },
              child: Text("Top Page"),
            ),
            RaisedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => ShareSocialPage()
                )
                );
              },
              child: Text("Share to SNS"),
            ),
            RaisedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => TapHome()
                )
                );
              },
              child: Text("Tap 1,2,3"),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
