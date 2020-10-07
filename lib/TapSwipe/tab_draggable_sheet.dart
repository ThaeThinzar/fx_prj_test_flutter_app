import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

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
      backgroundColor: Colors.grey,
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
          color: Colors.grey,
          child:
          Column(
            children: [
              Expanded(
                child: Stack(
                  children: [
                   SingleChildScrollView(
                     child:
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

              Container(
                color: Colors.white,
                child: Row(
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
              ),
              isTab2Open ? Visibility(
                child:  Container(
                    padding: EdgeInsets.only(left: 5, right: 5),
                    color: Colors.white,
                    height: 300,
                    width: width,
                    child:Column(
                      children: [
                         SizedBox(
                           width:width,
                           child: RaisedButton(
                             onPressed: (){

                             },
                             child: Text('Deposit/ Margin/ Rate of Maintance Margin', style: TextStyle(fontSize: 15)),
                           ),
                         )
                      ],
                    )
                ),
                visible: true,

              ):Visibility(
                 child:  Container(
                  height: 300,
                  color: Colors.white,
                  child:Text('Hello')),
                  visible: false,),
              Container(
                height: 40,
                width: width,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8,right: 8,bottom: 5,top: 5),
                  child: RaisedButton(

                    onPressed: (){
                      if(isTab2Open){
                        setState(() {
                          isTab2Open = false;
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: width/5,
                    child: RaisedButton(
                      onPressed: (){

                      },
                      child: Text('BUY \nLimit', style: TextStyle(fontSize: 12),),
                    ),
                  ),
                  SizedBox(
                    width: width/5,
                    child: RaisedButton(
                      onPressed: (){

                      },
                      child: Text('SELL \nLimit', style: TextStyle(fontSize: 12),),
                    ),
                  ),
                 /* SizedBox(
                    width: width/8,
                  ),*/
                  SizedBox(
                    width: width/5,
                    child: RaisedButton(
                      onPressed: (){

                      },
                      child: Text('BUY \nStop', style: TextStyle(fontSize: 12),),
                    ),
                  ),
                  SizedBox(
                    width: width/5,
                    child: RaisedButton(
                      onPressed: (){

                      },
                      child: Text('SELL \nStop', style: TextStyle(fontSize: 12),),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
  
}