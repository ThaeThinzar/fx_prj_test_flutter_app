/*
import 'package:flutter/material.dart';

class TutorialOverlay extends ModalRoute<void> {
  @override
  Duration get transitionDuration => Duration(milliseconds: 500);

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => false;

  @override
  Color get barrierColor => Colors.black.withOpacity(0.5);

  @override
  String get barrierLabel => null;

  @override
  bool get maintainState => true;

  @override
  Widget buildPage(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      ) {
    // This makes sure that text and other content follows the material style
    return Material(
      type: MaterialType.transparency,
      // make sure that the overlay content is not cut off
      child: SafeArea(
        child: _buildOverlayContent(context),
      ),
    );
  }

  Widget _buildOverlayContent(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            'This is a nice overlay',
            style: TextStyle(color: Colors.white, fontSize: 30.0),
          ),
          RaisedButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Dismiss'),
          )
        ],
      ),
    );
  }

  @override
  Widget buildTransitions(
      BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
    // You can add your own animations for the overlay content
    return FadeTransition(
      opacity: animation,
      child: ScaleTransition(
        scale: animation,
        child: child,
      ),
    );
  }
}



class TestPage extends StatelessWidget {
  void _showOverlay(BuildContext context) {
    Navigator.of(context).push(TutorialOverlay());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Test')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: RaisedButton(
            onPressed: () => _showOverlay(context),
            child: Text('Show Overlay'),
          ),
        ),
      ),
    );
  }
}*/
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:highlighter_coachmark/highlighter_coachmark.dart';



class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey _fabKey = GlobalObjectKey("fab"); // used by FAB
  GlobalKey _buttonKey = GlobalObjectKey("button"); // used by RaisedButton

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        key: _fabKey, // setting key
        onPressed: null,
        child: Icon(Icons.add),
      ),
      body: Center(
        child: RaisedButton(
          key: _buttonKey, // setting key
          onPressed: showFAB,
          child: Text("RaisedButton"),
        ),
      ),
    );
  }

  // we trigger this method on RaisedButton click
  void showFAB() {
    CoachMark coachMarkFAB = CoachMark();
    RenderBox target = _fabKey.currentContext.findRenderObject();

    // you can change the shape of the mark
    Rect markRect = target.localToGlobal(Offset.zero) & target.size;
    markRect = Rect.fromCircle(center: markRect.center, radius: markRect.longestSide * 0.6);

    coachMarkFAB.show(
      targetContext: _fabKey.currentContext,
      markRect: markRect,
      children: [
        Center(
          child: Text(
            "This is called\nFloatingActionButton",
            style: const TextStyle(
              fontSize: 24.0,
              fontStyle: FontStyle.italic,
              color: Colors.white,
            ),
          ),
        )
      ],
      duration: null, // we don't want to dismiss this mark automatically so we are passing null
      // when this mark is closed, after 1s we show mark on RaisedButton
      onClose: () => Timer(Duration(seconds: 1), () => showButton()),
    );
  }

  // this is triggered once first mark is dismissed
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
}