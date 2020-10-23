import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fx_prj_test_flutter_app/TapSwipe/chart_tab.dart';
import 'package:fx_prj_test_flutter_app/TapSwipe/slectable_btn_gesture.dart';
import 'package:fx_prj_test_flutter_app/TapSwipe/sliable_list_test.dart';
import 'package:fx_prj_test_flutter_app/TapSwipe/tab_draggable_sheet.dart';
import 'package:fx_prj_test_flutter_app/TapSwipe/tap_swipe.dart';
import 'package:fx_prj_test_flutter_app/data/Constants.dart';
import 'package:fx_prj_test_flutter_app/data/common_widget.dart';

class TapHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
            CommonWidget.buttonWidget(context, ScreenURLPath.SLIDEUPLIBRARY, "Slide Up Library"),
            CommonWidget.buttonWidget(context, ScreenURLPath.BOTTOM_DRAWER, 'Bottom Drawer'),
            CommonWidget.buttonWidget(context, ScreenURLPath.SLIABLELIST, 'Selectable Button List'),
            CommonWidget.buttonWidget(context, ScreenURLPath.SLIABLE_BUTTON, 'Selectable Button'),
        ],
      )),
    );
  }

}
