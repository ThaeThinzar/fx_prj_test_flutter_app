import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fx_prj_test_flutter_app/TapSwipe/chart_tab.dart';
import 'package:fx_prj_test_flutter_app/TapSwipe/tab_draggable_sheet.dart';
import 'package:fx_prj_test_flutter_app/TapSwipe/tap_swipe.dart';

class TapHome extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
     return Scaffold(
       body: Center(
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             RaisedButton(
               onPressed: (){
                 Navigator.push(context, MaterialPageRoute(
                     builder: (context)=> TapSwipeTest()
                 ));
               },
               child: Text("Slide Up Libray"),
             ),
             RaisedButton(
               onPressed: (){
                 Navigator.push(context, MaterialPageRoute(
                     builder: (context)=> BottomDrawer()
                 ));
               },
               child: Text("Bottom Drawer"),
             ),
             RaisedButton(
               onPressed: (){
                 Navigator.push(context, MaterialPageRoute(
                     builder: (context)=> ChartTab()
                 ));
               },
               child: Text("Fx Tab"),
             ),
           ],
         )
       ),
     );
  }

}