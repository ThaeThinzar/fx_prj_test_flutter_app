import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fx_prj_test_flutter_app/SaveDataSharedPreference.dart';
import 'package:fx_prj_test_flutter_app/localization/language_constants.dart';

import '../main.dart';

class MyPageSetting extends StatefulWidget {
  _MyPageSetting createState() => _MyPageSetting();
}

class _MyPageSetting extends State<MyPageSetting> {
  bool isSwitched;
  getRTLStatus()  {
   setState(() async {
     isRTLlayout  = await SharedPreferenceManager.getRTLOptionStatus();
   });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Flutter Switch Example"),
      ),
      body: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Switch RTL Layout'),
          Switch(
            value: isRTLlayout,
            onChanged: (value) async{
              SharedPreferenceManager.storedRTLOption(value);
              if (value == true) {
                Locale _locale = await setLocale("fa");
                MyApp.setLocale(context, _locale);
                print('langusge code is fa');
              } else {
                Locale _locale = await setLocale("en");
                MyApp.setLocale(context, _locale);
                print('langusge code is en');
              }
              setState(()  {
                isRTLlayout = value;
                print(isSwitched);
              });
            },
            activeTrackColor: Colors.lightGreenAccent,
            activeColor: Colors.green,
          ),
        ],
      )),
    );
  }
}
