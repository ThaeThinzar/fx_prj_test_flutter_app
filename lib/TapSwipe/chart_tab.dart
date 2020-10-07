import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ChartTab extends StatefulWidget {
  _ChartTabState createState() => _ChartTabState();
}
class _ChartTabState extends State<ChartTab>{
  int _value =1;
  bool isShowBottomsheet = false;
  bool isTab2Open = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: GestureDetector(
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  margin: EdgeInsets.all(8),
                  width: width,
                  height: 200,
                  color:Colors.blue,
                  alignment: Alignment.center,
                  child: Text('Main Chart'),
                ),
                Container(
                  margin: EdgeInsets.all(8),
                  width: width,
                  height: 100,
                  color:Colors.red,
                  alignment: Alignment.center,
                  child: Text('Sub Chart',textAlign: TextAlign.center,),
                ),
              ],
            ),
            Positioned(
              bottom: -40,
              child: _TabLayout(context,true),
            ),

          ],
        ),
      ),
    );
  }

  Widget _TabLayout (BuildContext context, bool isSwipe){
   double height= MediaQuery.of(context).size.height;
   double width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        BottomSheet(),
        Positioned(
          bottom: 0,
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    margin:EdgeInsets.only(left:8),
                    height:height/20,
                    child: RaisedButton(

                      child: Text("BUY"),
                      onPressed: (){
                      },
                    ),
                  ),
                  SizedBox(
                    width: width/8,
                  ),
                  SizedBox(
                    height:20,
                    child:  DropdownButton(
                        value: 1,
                        items:[
                          DropdownMenuItem(child: Text("logs"), value: 1),
                          DropdownMenuItem(child: Text("logs2"), value: 3),
                          DropdownMenuItem(child: Text("logs3"), value: 2),
                        ],
                        onChanged:(value){
                          setState(() {
                            _value = value;
                          });
                        }

                    ),
                  ),
                  SizedBox(
                    width: width/6,
                  ),
                  Container(
                    margin:EdgeInsets.only(left:8),
                    height:MediaQuery.of(context).size.height/20,
                    child: RaisedButton(
                      child: Text("SELL"),
                      onPressed: (){
                      },
                    ),
                  ),
                ],
              ),
              Container(
                width: width,
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  onPressed: (){

                  },
                  child: Text('P/L'),
                ),
              )
            ],
          ),
        )

      ],
    );
  }
}
class BottomSheet extends StatefulWidget{
  _BottomSheetState createState() => _BottomSheetState();
}
class _BottomSheetState extends State<BottomSheet>{

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(20)),
      child: Container(
        color: Colors.white,
        width: width,
        height: height/3 + 20,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 2.0,horizontal: 10.0),
          child: Column(
            children: [
              Icon(
                Icons.keyboard_arrow_up, size: 20,
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                width: double.infinity,
                child: MaterialButton(
                  color: Colors.red,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('Login wiht Google'),
                        SizedBox(width: 10,),
                        Icon(
                          Icons.arrow_forward,color: Colors.white,
                        )
                      ],
                    ),
                  ),
                  onPressed: (){

                  },
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: MaterialButton(
                  color: Colors.red,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('Login wiht Google'),
                        SizedBox(width: 10,),
                        Icon(
                          Icons.arrow_forward,color: Colors.white,
                        )
                      ],
                    ),
                  ),
                  onPressed: (){

                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

}