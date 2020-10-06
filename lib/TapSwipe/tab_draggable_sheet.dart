import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomDrawer extends StatefulWidget{
  _TabDraggableSheet createState() => _TabDraggableSheet();
}
class _TabDraggableSheet extends State<BottomDrawer>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: Text('Hello'),
      )
    );
  }

}