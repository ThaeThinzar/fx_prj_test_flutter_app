import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomDrawer extends StatefulWidget{
  _TabDraggableSheet createState() => _TabDraggableSheet();
}
class _TabDraggableSheet extends State<BottomDrawer>{

  bool isShowBottomsheet = false;
  bool isTab2Open = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var threshold = 100;
    double mainHeight = height-280;
    int _value =1;
    return Scaffold(
      body:GestureDetector(
        onPanEnd: (details){
          debugPrint(details.velocity.pixelsPerSecond.dy.toString());
          if(details.velocity.pixelsPerSecond.dy > threshold){
            this.setState(() {
              isShowBottomsheet = false;
            });
          } else if( details.velocity.pixelsPerSecond.dy < -threshold){
           setState(() {
             isShowBottomsheet = true;
           });
          }
        },
        child: Container(
          width: width,
          height: height,
          color: Colors.white70,
          child:
          Column(
            children: [
              Container(
                color: Colors.amber,
                height: height-80  ,
                child: Stack(
                  children: [
                   SingleChildScrollView(
                     child: Column(
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
                   ),
                    //TODO Bottom Sheet
                   Positioned(
                     bottom: isShowBottomsheet ? -60 : -(height/3),
                     left: 0,
                     child: BottomSheet(),
                   )

                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin:EdgeInsets.only(left:8),
                    height:MediaQuery.of(context).size.height/20,
                    child: RaisedButton(

                      child: Text("BUY"),
                      onPressed: (){
                      },
                    ),
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
              Expanded(
                child: isTab2Open ? Container(
                  height: 200,
                  color: Colors.greenAccent,
                ): Container(),
              ),
              Container(
                height: 35,
                width: width,
                margin: EdgeInsets.only(left: 8,right: 8, top: 8),
                child: RaisedButton(
                  onPressed: (){
                    if(isTab2Open){
                      setState(() {
                        isTab2Open = false;

                        mainHeight = height - 80;
                      });
                    }else {
                      setState(() {
                        isTab2Open = true;
                      });
                    }
                  },
                  child: Text("P/L"),
                ),
              ),
            ],
          ),
        ),
      )
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