
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fx_prj_test_flutter_app/SaveDataSharedPreference.dart';
import 'package:fx_prj_test_flutter_app/Setting/MyPageSetting.dart';
import 'package:fx_prj_test_flutter_app/TapSwipe/slectable_btn_gesture.dart';
import 'package:fx_prj_test_flutter_app/TapSwipe/sliable_list_test.dart';
import 'package:fx_prj_test_flutter_app/TapSwipe/tab_draggable_sheet.dart';
import 'package:fx_prj_test_flutter_app/TapSwipe/tap_home.dart';
import 'package:fx_prj_test_flutter_app/TapSwipe/tap_swipe.dart';
import 'package:fx_prj_test_flutter_app/home/homebase.dart';
import 'package:fx_prj_test_flutter_app/home/share_social.dart';
import 'package:fx_prj_test_flutter_app/library/history_of_demonstration_list.dart';
import 'package:fx_prj_test_flutter_app/library/history_of_demostrate_later.dart';
import 'package:fx_prj_test_flutter_app/library/history_of_library_list.dart';
import 'package:fx_prj_test_flutter_app/localization/demo_localization.dart';
import 'package:fx_prj_test_flutter_app/login_screen/login_screen.dart';
import 'package:fx_prj_test_flutter_app/onboard/tuturial_walkthrough_main.dart';
import 'package:fx_prj_test_flutter_app/rating_review_app/rating_page_screen.dart';
import 'package:fx_prj_test_flutter_app/repro_notification/notification_to_updae.dart';
import 'package:fx_prj_test_flutter_app/slide_gesture/SlidePage.dart';

import 'package:google_sign_in/google_sign_in.dart';

import 'data/Constants.dart';
import 'data/common_widget.dart';
import 'localization/language_constants.dart';
import 'maganifing_view/magnify_view.dart';

bool isRTLlayout;
void main() {
  runApp(MyApp());
}
class MyApp extends StatefulWidget{

  const MyApp({Key key}) : super(key: key);
  static void setLocale(BuildContext context, Locale newLocale) {
    _MyAppState state = context.findAncestorStateOfType<_MyAppState>();
    state.setLocale(newLocale);
  }

  _MyAppState createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  final routes =<String,WidgetBuilder>{
    ScreenURLPath.LOGIN:(context) => LoginScreen() ,
    ScreenURLPath.TUTORIAL_WALKTTHROUGH:(context) => TutorialWalkThroughMain(),
    ScreenURLPath.HELP_PAGE:(context) => HelpPage(),
    ScreenURLPath.TOP_PAGE:(context) => HomeBase(),
    ScreenURLPath.SHARE_SNS:(context) => ShareSocialPage(),
    ScreenURLPath.MY_PAGE:(context) => MyPageSetting(),
    ScreenURLPath.TAB:(context) => TapHome(),
    ScreenURLPath.MAGNIFINE:(context) => MagnifyView(),
    ScreenURLPath.SLIDEUPLIBRARY:(context) => TapSwipeTest(),
    ScreenURLPath.BOTTOM_DRAWER:(context) => BottomDrawer(),
    ScreenURLPath.SLIABLELIST:(context) => SlidableListItem(),
    ScreenURLPath.HISTORYTRADING:(context) => HistoryOfTradingListView() ,
    ScreenURLPath.HISTORY_OF_DEMON_LIST:(context) => HistoryOfDemonstrationList() ,
    ScreenURLPath.HISTORY_OF_DEMON_LATER:(context) => HistoryOfDemonstrationLater() ,
    ScreenURLPath.SLIABLE_BUTTON:(context) => SelectableButtonWithGesture(),
    ScreenURLPath.RATING_PAGE:(context) => RatingPageScreen(),
    ScreenURLPath.FORCE_UPDATE:(context) => InAppReviewScreen(),
  };
  Locale _locale;
  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }
  @override
  void didChangeDependencies() {
    getLocale().then((locale) {
      setState(() {
        this._locale = locale;
      });
    });
    super.didChangeDependencies();
  }
  getRTLStatus()async{
      isRTLlayout = await SharedPreferenceManager.getRTLOptionStatus();
  }
  @override
  void initState() {
    super.initState();
    getRTLStatus();
    print('RTL option: $isRTLlayout');
  }

  @override
  Widget build(BuildContext context) {
    if (this._locale == null) {
      return Container(
        child: Center(
          child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue[800])),
        ),
      );
    }else{
      return MaterialApp(
        debugShowCheckedModeBanner: false,
          locale: _locale,
          localizationsDelegates:[
            DemoLocalization.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          supportedLocales: [
            Locale("en", "US"),
            Locale("fa", "IR"), // OR Locale('ar', 'AE') OR Other RTL locales
          ],
          localeResolutionCallback: (locale, supportedLocales) {
            for (var supportedLocale in supportedLocales) {
              if (supportedLocale.languageCode == locale.languageCode &&
                  supportedLocale.countryCode == locale.countryCode) {
                return supportedLocale;
              }
            }
            return supportedLocales.first;
          },
          // locale: isRTLlayout ? Locale("fa", "IR") : Locale("en", "US"),
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
          home: MyHomePage(title: 'Test FX Project'),
        routes: routes,
        //MyHomePage(title:'FX project Test')
      );
    }
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
            CommonWidget.buttonWidget(context, ScreenURLPath.TUTORIAL_WALKTTHROUGH, "Tutorial Walk Through"),
            CommonWidget.buttonWidget(context, ScreenURLPath.LOGIN,'Login/Sign Up SNS'),
            CommonWidget.buttonWidget(context, ScreenURLPath.HELP_PAGE, 'Help Page'),
            CommonWidget.buttonWidget(context, ScreenURLPath.TOP_PAGE, 'Top Page'),
            CommonWidget.buttonWidget(context, ScreenURLPath.TAB, "Tap 1,2,3"),
            CommonWidget.buttonWidget(context, ScreenURLPath.MY_PAGE,'MyPage Setting'),
            CommonWidget.buttonWidget(context, ScreenURLPath.SHARE_SNS, 'Share to SNS'),
            CommonWidget.buttonWidget(context, ScreenURLPath.MAGNIFINE, 'Magnifying Window'),
            CommonWidget.buttonWidget(context, ScreenURLPath.HISTORYTRADING, 'History'),
            CommonWidget.buttonWidget(context, ScreenURLPath.HISTORY_OF_DEMON_LIST, 'History demo'),
            CommonWidget.buttonWidget(context, ScreenURLPath.FORCE_UPDATE, 'Update Your App')

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
