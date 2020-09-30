import 'dart:async';

import 'package:bubble_showcase/bubble_showcase.dart';
import 'package:flutter/material.dart';
import 'package:fx_prj_test_flutter_app/data/top_data.dart';
import 'package:highlighter_coachmark/highlighter_coachmark.dart';
import 'package:http/http.dart' as http;
import 'package:speech_bubble/speech_bubble.dart';
class BubbleShowDemo extends StatelessWidget {
  GlobalKey _startNotiKey = GlobalObjectKey("startNotiKey");
  GlobalKey _titleKey = GlobalObjectKey("titleKey");
  GlobalKey _firstButtonKey = GlobalObjectKey("firstButtonKey");
  GlobalKey _startButtonKey = GlobalObjectKey("startbuttonkey");
  @override
  Widget build(BuildContext context) {

    TextStyle textStyle = Theme.of(context).textTheme.body1.copyWith(
      color: Colors.white,
    );
    return BubbleShowcase(
      bubbleShowcaseId: 'my_bubble_showcase',
      bubbleSlides: [
        _startNotiSlide(textStyle),
        _firstSlide(textStyle),
      //  _secondSlide(textStyle),
        _thirdSlide(textStyle),
        _startSlide(textStyle)
      ],
      child: FriendsListPage(_titleKey,_firstButtonKey,_startNotiKey, _startButtonKey),
    );
  }
  BubbleSlide _startNotiSlide(TextStyle textStyle) => RelativeBubbleSlide(
      widgetKey: _startNotiKey,
      child: RelativeBubbleSlideChild(
          widget: Column(
            children: [
              SpeechBubble(
                nipLocation: NipLocation.TOP,
                color: Colors.blue,
                child: Text(
                  'Let\'s get it!',
                  style: textStyle,
                ),
              ),
            ],
          )
      )
  );
  BubbleSlide _firstSlide(TextStyle textStyle) => RelativeBubbleSlide(
    widgetKey: _titleKey,
    child: RelativeBubbleSlideChild(
      widget: Padding(
        padding: const EdgeInsets.only(top: 8),
        child: SpeechBubble(
          nipLocation: NipLocation.TOP,
          color: Colors.blue,
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Tutorial !',
                  style: textStyle.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'I will show you how to use !',
                  style: textStyle,
                ),
              ],
            ),
          ),
        ),
      )
    )
  );
  BubbleSlide _secondSlide(TextStyle textStyle) => AbsoluteBubbleSlide(
    positionCalculator: (size) => Position(
      top: 0,
      right: 0,
      left: 0,
      bottom: size.height,
    ),
    child: RelativeBubbleSlideChild(
      widget: Padding(
        padding: const EdgeInsets.only(left: 8),
        child: SpeechBubble(
          nipLocation: NipLocation.LEFT,
          color: Colors.teal,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              'Look at me pointing absolutely nothing.\n(Or maybe that\'s an hidden navigation bar !)',
              style: textStyle,
            ),
          ),
        ),
      ),
      direction: AxisDirection.left,
    ),
  );
  BubbleSlide _thirdSlide(TextStyle textStyle) => RelativeBubbleSlide(
    widgetKey: _firstButtonKey,
    shape: const Oval(
      spreadRadius: 15,
    ),
    child: RelativeBubbleSlideChild(
      widget: Column(
       children: [
         SpeechBubble(
           nipLocation: NipLocation.TOP,
           color: Colors.purple,
           child: Text(
             '  This is button is One .\nOh, please click to continue',
             style: textStyle,
           ),
         ),
       ],

      ),
    ),
  );
  BubbleSlide _startSlide(TextStyle textStyle) => RelativeBubbleSlide(
    widgetKey: _startButtonKey,
    shape: const Oval(
      spreadRadius: 15,
    ),
    child: RelativeBubbleSlideChild(
      widget: Column(
        children: [
          SpeechBubble(
            nipLocation: NipLocation.TOP,
            color: Colors.purple,
            child:Text(
              'This is button is One .\nOh, please click to continue',
              style: textStyle,
            ),
          ),
        ],

      ),
    ),
  );
}
class FriendsListPage extends StatefulWidget {
  final GlobalKey _titleKey;

  /// The first button global key.
  final GlobalKey _firstButtonKey;
  final GlobalKey _startNotiKey;
  final GlobalKey _startButtonKey;
  FriendsListPage(this._titleKey, this._firstButtonKey, this._startNotiKey, this._startButtonKey);
  @override
  _FriendsListPageState createState() => _FriendsListPageState();
}

class _FriendsListPageState extends State<FriendsListPage> {

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Tutorial WalkThrough'),
        actions: [
          IconButton(
            key: widget._startNotiKey,
            icon: Icon(Icons.notifications_active, color: Colors.white,),
          )
          /*Row(
            key: widget._startNotiKey,
            children: [
              SizedBox(width: 20,),
              IconButton(
                icon: Icon(Icons.notifications_active, color: Colors.white,),
              )
            ],
          )*/
        ],),

      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 40,
          horizontal: 20,
        ),
        child:Column(
          children: [
            Padding(
              padding: EdgeInsets.all(16),
              child: Text("Test for tutorial", key: widget._titleKey,style: TextStyle(color: Colors.blue, fontSize: 25),),
            ),
            SizedBox(height: 20,),
            RaisedButton(
              key: widget._firstButtonKey,
              child: Text("Button1"),
            ),

            SizedBox(height: 20,),
            RaisedButton(
              key: widget._startButtonKey,
              child: Text("Button2"),
            ),
            RaisedButton(
              child: Text("Start!"),
            )
          ],
        ),
      )
    );

  }

}

