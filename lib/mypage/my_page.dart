import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyPageScreen extends StatefulWidget{
  _MyPageScreenState createState() =>_MyPageScreenState();
}
class _MyPageScreenState extends State<MyPageScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Hello to MYPage'),),
    );
  }

}