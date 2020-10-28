import 'package:flutter/material.dart';
import 'package:fx_prj_test_flutter_app/data/common_widget.dart';
import 'package:fx_prj_test_flutter_app/data/top_data.dart';

import '../main.dart';

class EventItemView extends StatelessWidget{
  final TopData data;
  EventItemView(this.data);

  @override
  Widget build(BuildContext context) {
    Widget textDemonstarte (String data){
      return new Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2),
            color: Colors.black26.withOpacity(0.5)
        ),
        padding: const EdgeInsets.only(left:5.0,right: 5,top: 2,bottom: 2),
        child: new Text(data,
          style: TextStyle(
            fontFamily: 'fira',
            color: Colors.white,
            fontSize: 8,//18.0,
            //color: Colors.white,
          ),
        ),
      );
    }
    Widget _simplePopup() => PopupMenuButton<int>(
      color: Colors.white,
      icon: Icon(
        Icons.more_vert,
        color: Colors.white,
        size: 15,
      ),
      itemBuilder: (context) => [
        PopupMenuItem(
          value: 1,

          child: Container(alignment: Alignment.center,child: Text("Demonstrate Later",)),
        ),
        PopupMenuItem(
          value: 1,
          child: Container(alignment: Alignment.center,child: Text("Add to Starred (Like)")),
        ),
        PopupMenuItem(
          value: 1,
          child: Container(alignment: Alignment.center,child: Text("Don't Display ")),
        ),
        PopupMenuItem(
          value: 2,
          child: Container(alignment: Alignment.center,child: Text("Share")),
        ),
      ],
    );
    Widget eventData =  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(data.eventNote,
          style: TextStyle(color: Colors.deepPurpleAccent,fontSize: 10, fontWeight: FontWeight.bold),
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.start,),
        Text(data.eventTitle,style: TextStyle(color: Colors.white, fontSize: 8,fontWeight: FontWeight.bold),),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(Icons.access_time,size:12 ,color: Colors.white60,),
            Text(data.eventTime,style: TextStyle(color: Colors.white70,fontSize: 10,fontWeight: FontWeight.bold),),
            SizedBox(
              width: MediaQuery.of(context).size.width/4 ,
            ),
          ],
        ),
        // SizedBox(height: 10,)
      ],
    );
    return Container(
      padding: EdgeInsets.all(8),
      child: Stack(
        children: [
          Image.asset(data.imgUrl),
          Positioned(
              left: isRTLlayout ? 25:null,
              right:isRTLlayout ?null : 25,
              top: 5,
              child: textDemonstarte(data.playStyle)
          ),
          Positioned(
            top: -10,
            right: isRTLlayout ? null : -10,
            left: isRTLlayout ? -10 : null,
            child: _simplePopup(),
          ),
          Positioned(
            right: isRTLlayout ? 5 : null,
            left: isRTLlayout ? null :5,
            bottom: 8,
            child: eventData,
          ),
          Positioned(
            left: isRTLlayout ? 0 : null,
            right: isRTLlayout ? null : 0,
            bottom: 2,
            child:  InkWell(
              onTap: (){
                showDialog(context: context, builder: (BuildContext context) => CustomDialog("You can learn more detail here and \n See you again tomorrow\n There is the description of the event. \n You can learn more detail here and \n See you again tomorrow"));
              },
              child: Container(

                margin: EdgeInsets.only(right: 8),
                child:Icon(Icons.info, color: Colors.white, size: 15,),

              ),
            ),
          )
        ],
      ),
    );
  }

}