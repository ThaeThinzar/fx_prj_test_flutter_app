import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:highlighter_coachmark/highlighter_coachmark.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

class InitialPage extends StatefulWidget{
  _InitialPageState createState() => _InitialPageState();
}
class _InitialPageState extends State<InitialPage>{
  List<TargetFocus> targets = List();
  GlobalKey _fabKey = GlobalObjectKey("fab"); // used by FAB
  GlobalKey _buttonKey = GlobalObjectKey("button");
  GlobalKey _buttonKey1 = GlobalObjectKey("button1");
  GlobalKey _buttonKey2 = GlobalObjectKey("button2");
  GlobalKey _buttonKey3 = GlobalObjectKey("button3");



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 1), () => showCoachMarkFAB());

  }
  void showCoachMarkFAB() {
    CoachMark coachMarkFAB = CoachMark();
    RenderBox target = _fabKey.currentContext.findRenderObject();

    Rect markRect = target.localToGlobal(Offset.zero) & target.size;
    markRect = Rect.fromCircle(
        center: markRect.center, radius: markRect.longestSide * 0.6);

    coachMarkFAB.show(
        targetContext: _fabKey.currentContext,
        markRect: markRect,
        children: [
          Center(
              child: Text("Please Notification on to get information~~",
                  style: const TextStyle(
                    fontSize: 24.0,
                    fontStyle: FontStyle.italic,
                    color: Colors.white,
                  )))
        ],
        duration: Duration(seconds: 3),
        onClose: () {
          Timer(Duration(seconds: 3), () => showCoachMarkTile());
        });
  }
  void showCoachMarkTile() {
    CoachMark coachMarkTile = CoachMark();
    RenderBox target = _buttonKey.currentContext.findRenderObject();

    Rect markRect = target.localToGlobal(Offset.zero) & target.size;
    markRect = markRect.inflate(5.0);

    coachMarkTile.show(
        targetContext: _fabKey.currentContext,
        markRect: markRect,
        markShape: BoxShape.rectangle,
        children: [
          Positioned(
              top: markRect.bottom + 15.0,
              right: 5.0,
              child: Text("Tap on Click Me  to go  Next step",
                  style: const TextStyle(
                    fontSize: 24.0,
                    fontStyle: FontStyle.italic,
                    color: Colors.white,
                  )))
        ],
        duration: Duration(seconds: 3),
        onClose: () {
          Timer(Duration(seconds: 3), () => showCoachRoom2());
        });
  }
  void showCoachRoom2() {
    CoachMark coachMarkTile = CoachMark();
    RenderBox target = _buttonKey1.currentContext.findRenderObject();

    Rect markRect = target.localToGlobal(Offset.zero) & target.size;
    markRect = markRect.inflate(5.0);

    coachMarkTile.show(
        targetContext: _fabKey.currentContext,
        markRect: markRect,
        markShape: BoxShape.rectangle,
        children: [
          Positioned(
              top: markRect.bottom + 15.0,
              right: 5.0,
              child: Text("Visit to Room2 and Go to Room3",
                  style: const TextStyle(
                    fontSize: 24.0,
                    fontStyle: FontStyle.italic,
                    color: Colors.white,
                  )))
        ],
        duration: Duration(seconds: 3),
        onClose: () {
          Timer(Duration(seconds: 3), () => showCoachRoom3());
        });
  }
  void showCoachRoom3() {
    CoachMark coachMarkTile = CoachMark();
    RenderBox target = _buttonKey2.currentContext.findRenderObject();

    Rect markRect = target.localToGlobal(Offset.zero) & target.size;
    markRect = markRect.inflate(5.0);

    coachMarkTile.show(
        targetContext: _buttonKey2.currentContext,
        markRect: markRect,
        markShape: BoxShape.rectangle,
        children: [
          Positioned(
              top: markRect.bottom + 15.0,
              right: 5.0,
              child: Text("Visit to Room2 and Go to Room3",
                  style: const TextStyle(
                    fontSize: 24.0,
                    fontStyle: FontStyle.italic,
                    color: Colors.white,
                  )))
        ],
        duration: Duration(seconds: 3));
  }
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text('Initial Page'),
       actions: [
         IconButton(
           key: _fabKey,
           onPressed: (){
             showCoachMarkTile();
           },
           icon: Icon(Icons.notifications,color: Colors.white,)
         )
       ],
     ),
     body: Center(
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           RaisedButton(
             onPressed: (){
               showCoachRoom2();
             },
             key: _buttonKey,
             color: Colors.blue,
             child: Text('Click Me',style: TextStyle(color: Colors.white),),
           ),
           RaisedButton(
             onPressed: (){
               showCoachRoom3();
             },
             key: _buttonKey1,
             color: Colors.blue,
             child: Text('Room 2',style: TextStyle(color: Colors.white),),
           ),
           RaisedButton(
             onPressed: (){
               // showFAB(_buttonKey1);
             },
             key: _buttonKey2,
             color: Colors.blue,
             child: Text('Room 3',style: TextStyle(color: Colors.white),),
           )
         ],
       ),
     ),

   );
  }
  void showFAB( GlobalKey targetKey, String message) {
    CoachMark coachMarkFAB = CoachMark(bgColor: Colors.black26);
    RenderBox target = targetKey.currentContext.findRenderObject();

    // you can change the shape of the mark
    Rect markRect = target.localToGlobal(Offset.zero) & target.size;
    markRect = Rect.fromCircle(center: markRect.center, radius: markRect.longestSide * 0.6,);

    coachMarkFAB.show(
      targetContext: _fabKey.currentContext,

      markRect: markRect,
      children: [
        Center(
          child: Text(
            message,
            style: const TextStyle(
              fontSize: 24.0,
              fontStyle: FontStyle.italic,
              color: Colors.white,
            ),
          ),
        )
      ],
      duration: Duration(seconds:3 ), // we don't want to dismiss this mark automatically so we are passing null
      // when this mark is closed, after 1s we show mark on RaisedButton
     // onClose: () => Timer(Duration(seconds: 1), () => showButton()),
    );
  }
  void showButton() {
    CoachMark coachMarkTile = CoachMark();
    RenderBox target = _buttonKey.currentContext.findRenderObject();

    Rect markRect = target.localToGlobal(Offset.zero) & target.size;
    markRect = markRect.inflate(5.0);

    coachMarkTile.show(
      targetContext: _fabKey.currentContext,
      markRect: markRect,
      markShape: BoxShape.rectangle,
      children: [
        Positioned(
          top: markRect.bottom + 15.0,
          right: 5.0,
          child: Text(
            "And this is a RaisedButton",
            style: const TextStyle(
              fontSize: 24.0,
              fontStyle: FontStyle.italic,
              color: Colors.white,
            ),
          ),
        )
      ],
      duration: Duration(seconds: 5), // this effect will only last for 5s
    );
  }
  void showTutorial() {
    TutorialCoachMark(
        context,
        targets: targets, // List<TargetFocus>
        colorShadow: Colors.red, // DEFAULT Colors.black
        // alignSkip: Alignment.bottomRight,
        // textSkip: "SKIP",
        // paddingFocus: 10,
        onFinish: (){
          print("finish");
        },
        onClickTarget: (target){
          print(target);
        },
        onClickSkip: (){
          print("skip");
        }
    )..show();
  }
}