import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SelectableButtonWithGesture extends StatefulWidget {
  @override
  _SelectableButtonWithGestureState createState() => new _SelectableButtonWithGestureState();
}

class _SelectableButtonWithGestureState extends State<SelectableButtonWithGesture> {
  Color cellColor = Colors.white;

  Text _getText(index) {
    Text text;
    switch (index) {
      case 0:
        text = new Text('lightBlue');
        break;
      case 1:
        text = new Text('red');
        break;
      case 2:
        text = new Text('green');
        break;
      case 3:
        text = new Text('yellow');
        break;
      case 4:
        text = new Text('orange');
        break;
      default:
        text = new Text('brown');
        break;
    }

    return text;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Demo App"),
      ),
      body: new GridView.count(
        crossAxisCount: 5,
        children: new List.generate(5, (index) {
          return new MyWidget(
            index: index,
            color: cellColor,
            text: _getText(index),
          );
        }),
      ),
    );
  }
}

class MyWidget extends StatefulWidget {
  final Color color;
  final Text text;
  final int index;

  MyWidget({this.color, this.text, this.index});

  @override
  _MyWidgetState createState() => new _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  Color cellColor = Colors.white;
  Text cellText = new Text('white');

  @override
  void initState() {
    super.initState();
    cellColor = widget.color;
    cellText = widget.text;
  }

  _changeCell(index) {
    setState(() {
      switch (index) {
        case 0:
          cellColor = Colors.lightBlue;
          cellText = new Text('lightBlue');
          break;
        case 1:
          cellColor = Colors.red;
          cellText = new Text('red');
          break;
        case 2:
          cellColor = Colors.green;
          cellText = new Text('green');
          break;
        case 3:
          cellColor = Colors.yellow;
          cellText = new Text('yellow');
          break;
        case 4:
          cellColor = Colors.orange;
          cellText = new Text('orange');
          break;
        default:
          cellColor = Colors.brown;
          cellText = new Text('brown');
          break;
      }
    });
    print("Container clicked " + index.toString());
  }

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: () => _changeCell(widget.index),
      child: new Container(
        margin: new EdgeInsets.symmetric(horizontal: 1.0),
        width: double.infinity,
        height: double.infinity,
        decoration: new BoxDecoration(
          color: cellColor,
        ),
        child: new Center(
          child: cellText,
        ),
      ),
    );
  }
}