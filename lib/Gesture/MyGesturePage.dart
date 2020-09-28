import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fx_prj_test_flutter_app/data/top_data.dart';

class MyGesturePage extends StatefulWidget {
  final TopData data;
  MyGesturePage({Key key,this.data}):super(key:key);
  _MyGesturePageState createState() => _MyGesturePageState();
}

class _MyGesturePageState extends State<MyGesturePage> {
  final TopData data;
  _MyGesturePageState({Key key, this.data});


  @override
  Widget build(BuildContext context) {

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
            child: Text("Demonstrate Later"),
          ),
          PopupMenuItem(
            value: 1,
            child: Text("Add to Starred (Like)"),
          ),
          PopupMenuItem(
            value: 1,
            child: Text("Don't Display "),
          ),
          PopupMenuItem(
            value: 2,
            child: Text("Share"),
          ),
        ],
    );
    Widget banner = Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        new Padding(
            padding: const EdgeInsets.only( left: 90.0 ,),
            child: Column(
              children: [
                Container(
                  child:
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      new Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2),
                            color: Colors.black26.withOpacity(0.5)
                        ),
                        padding: const EdgeInsets.only(left:5.0,right: 5,top: 2,bottom: 2),
                        child: new Text(
                           widget.data.playStyle,
                          style: TextStyle(
                            fontFamily: 'fira',
                            color: Colors.white,
                            fontSize: 8,//18.0,
                            //color: Colors.white,
                          ),
                        ),
                      ),
                      _simplePopup(),
                    ],
                  ),
                ),

              ],
            )
          // ),
          //  ),
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Padding(
                padding: EdgeInsets.only(left: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.data.eventNote,
                      style: TextStyle(color: Colors.deepPurpleAccent,fontSize: 12, fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,),
                    Text(widget.data.eventTitle,style: TextStyle(color: Colors.white, fontSize: 10,fontWeight: FontWeight.bold),),
                    Row(
                      children: [
                        Icon(Icons.access_time,size:15 ,color: Colors.white60,),
                        Text(widget.data.eventTime,style: TextStyle(color: Colors.white70,fontSize: 12,fontWeight: FontWeight.bold),),
                        SizedBox(
                          width: MediaQuery.of(context).size.width/4 ,
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 8),
                          child: Icon(Icons.info, color: Colors.white,size: 20,),
                        )
                      ],
                    ),
                    SizedBox(height: 10,)
                  ],
                ),
              )
            ),
            /*Container(
              margin: EdgeInsets.only(right: 8),
              child: Icon(Icons.info, color: Colors.white,),
            )*/
          ],
        )
      ],
    );
    return Padding(
      padding: EdgeInsets.all(8),
      child:  Stack(
        children: <Widget>[
          Container(
            margin:  EdgeInsets.only(left: 8,right: 8),
            alignment: Alignment.topCenter,
            child: Image.asset(
              widget.data.imgUrl,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          Container(
            height: 200,
            child: banner,
          )
        ],
      ),
       );
  }

}