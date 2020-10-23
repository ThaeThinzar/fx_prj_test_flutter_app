import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fx_prj_test_flutter_app/data/my_button_model.dart';

class BottomPop extends StatefulWidget {
  _BottomPopState createState() => _BottomPopState();
}

class _BottomPopState extends State<BottomPop> {
  bool isClick = false;
  List<MyButtonModal> _a = [
    MyButtonModal(buttonText: "1Y ago"),
    MyButtonModal(buttonText: "1M ago"),
    MyButtonModal(buttonText: "1W ago"),
    MyButtonModal(buttonText: "Random"),
  ];
  List<MyButtonModal> _b = [
    MyButtonModal(buttonText: "< 1year"),
    MyButtonModal(buttonText: "1-2 years"),
    MyButtonModal(buttonText: "2-3 years"),
    MyButtonModal(buttonText: "3+ year"),
  ];

  @override
  Widget build(BuildContext context) {
    return
      new ListView(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        padding: EdgeInsets.all(10),
        children: [
          Text(
            "Age",
            style: TextStyle(fontSize: 18),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
          ),
          GridView.count(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
              childAspectRatio: 100 / 35,
              crossAxisCount: 4,
              children: _a.map((MyButtonModal f ) {
                return   Container(
                  child: RaisedButton(
                    color: _changeColor(false, f.changeButtonColor),
                    /*color: f.changeButtonColor
                        ? Colors.blue
                        : Colors.white,*/
                    onPressed: () {
                      setState(() {
                        Fluttertoast.showToast(msg: 'You click on ${f.buttonText}');
                        f.changeButtonColor = !f.changeButtonColor;
                        isClick = !isClick;
                      });
                    },
                    child: Text(
                      f.buttonText,
                      style: TextStyle(fontSize: 10),
                    ),
                  ),
                );
                 /* InkWell(
                  child: Container(
                      decoration: BoxDecoration(
                          color: f.changeButtonColor
                              ? Colors.blue
                              : Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Color(0xffaaaaaa))),
                      padding: EdgeInsets.all(0.0),
                      child: Center(
                        child: Text(f.buttonText,style: TextStyle(fontSize: 10), ),
                      )),
                  onTap: () {
                    setState(() {
                      f.changeButtonColor = !f.changeButtonColor;
                    });
                  },
                );*/
              }).toList()),
          Padding(
            padding: EdgeInsets.only(top: 20),
          ),
          Text(
            "Experiences",
            style: TextStyle(fontSize: 18),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
          ),
          GridView.count(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 100 / 50,
              crossAxisCount: 4,
              children: _b
                  .map(
                    (f) => InkWell(
                  child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Color(0xffaaaaaa))),
                      padding: EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: Center(
                        child: Text(f.buttonText),
                      )),
                  onTap: () {},
                ),
              )
                  .toList()),
          Padding(
            padding: EdgeInsets.only(top: 20),
          ),
          Row(
            children: [
              FlatButton(
                color: Colors.lightBlue,
                child: Text("Filter"),
                onPressed: () {},
              ),
              Padding(
                padding: EdgeInsets.only(right: 10),
              ),
              FlatButton(
                color: Colors.red,
                child: Text("Clear"),
                onPressed: () {},
              ),
            ],
          )
        ],
      );
  }
  Color _changeColor(bool isClick, bool isChangeColor){
    if(isChangeColor){
      return Colors.blue;
    } else {
      return Colors.white;
    }

  }
  Widget _buttonWidget(String name, double width,int id) {
    return
      Container(
      height: 30,
      width: width,
      child: RaisedButton(

        color:  Colors.blue,
        onPressed: () {
          setState(() {
            //pressAttention = !pressAttention;
          });
        },
        child: Text(
          name,
          style: TextStyle(fontSize: 10),
        ),
      ),
    );
  }
}