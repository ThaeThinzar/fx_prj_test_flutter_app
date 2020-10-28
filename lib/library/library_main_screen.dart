import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fx_prj_test_flutter_app/Gesture/MyGesturePage.dart';
import 'package:fx_prj_test_flutter_app/data/Constants.dart';
import 'package:fx_prj_test_flutter_app/data/common_widget.dart';
import 'package:fx_prj_test_flutter_app/data/top_data.dart';
import 'package:fx_prj_test_flutter_app/library/event_item_view.dart';
import 'package:fx_prj_test_flutter_app/library/history_of_library_list.dart';

import '../main.dart';

class LibraryMainScreen extends StatefulWidget{
  _LibraryMainScreenState createState() =>_LibraryMainScreenState();
}
class _LibraryMainScreenState extends State<LibraryMainScreen>{
  final  List<TopData> topDataList = [
    TopData(
        playStyle: "プレイ調み",
        eventNote: "#リーマンショック ¥ドルリ1",
        eventTitle: "リーマンショック¥ドルリーマンショックをもう一度イベント1",
        eventTime: "イベント時間 2020/01/04 20:30",
        imgUrl: 'assets/images/view1.jpg'),
    TopData(
        playStyle: "プレイ調み",
        eventNote: "#リーマンショック¥ # 調み",
        eventTitle: "リーマンショック¥ドルリーマンショックをもう一度イベント2",
        eventTime: "イベント時間 2020/01/04 20:30",
        imgUrl: 'assets/images/view2.jpg'),
    TopData(
        playStyle: "プレイ調み",
        eventNote: "#リーマンショック¥ドルリ",
        eventTitle: "リーマンショック¥ドルリーマンショックをもう一度イベント3",
        eventTime: "イベント時間 2020/01/04 20:30",
        imgUrl: 'assets/images/view3.jpg'),
    TopData(
        playStyle: "プレイ調み",
        eventNote: "#リーマンショック¥ドルリーマンショックをもう一度イベント4",
        eventTitle: "リーマンショック¥ドルリーマンショックをもう一度イベント4",
        eventTime: "イベント時間 2020/01/04 20:30",
        imgUrl: 'assets/images/view4.jpg'),
    TopData(
        playStyle: "プレイ調み",
        eventNote: "#リーマンショック¥ドルリーマンショックをもう一度イベント5",
        eventTitle: "リーマンショック¥ドルリーマンショックをもう一度イベント5",
        eventTime: "イベント時間 2020/01/04 20:30",
        imgUrl: 'assets/images/view5.jpg'),

  ];
  @override
  Widget build(BuildContext context) {
      Widget demonstrationList = Column(
        children: [
          new Container(
            padding: EdgeInsets.only(left: 8,top: 4),
            alignment: Alignment.topLeft,
            child: Text('(Title of History of Demonstration)', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),),
          ),
          new Container(
              height: 200.0,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.all(0.0),
                  itemCount: topDataList.length,
                  itemBuilder: (context,index){
                    return EventItemView(topDataList[index]);
              })
          ),
         
        ],
      );
      Widget demonstrationLaterList = Column(
        children: [
          new Container(
            padding: EdgeInsets.only(left: 8,top: 4),
            alignment: Alignment.topLeft,
            child: Text('(Title of Demonstrate later)', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),),
          ),
          new Container(
              height: 200.0,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.all(0.0),
                  itemCount: topDataList.length,
                  itemBuilder: (context,index){
                    return EventItemView(topDataList[index]);
                  })
          ),

        ],
      );
      Widget historyOfTradingList = Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              new Container(
                padding: EdgeInsets.only(left: 8,top: 4),
                alignment: Alignment.topLeft,
                child: Text('(Title of History of Trading)', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),),
              ),
              Container(
                height: 20,
                child: RaisedButton(
                  onPressed: (){

                  },
                  child: Text("損益",style: TextStyle(fontSize: 8),),
                ),
              )
            ],
          ),
          new Container(
            padding: EdgeInsets.all(8),
            height: 200.0,
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                padding: EdgeInsets.all(0.0),
                itemCount: 10,
                itemBuilder: (context,index){
                  return Card(
                    child: Container(
                      margin: EdgeInsets.all(7),
                        child: Text('History of Trading')),
                  );
                })
          )
        ],
      );
      return Scaffold(
        appBar: AppBar(
          title: Text('widget.title'),
        ),
        body:new Container(
          child: ListView(
            padding: EdgeInsets.all(0.0),
            scrollDirection: Axis.vertical,
            children: <Widget>[
              Container(
                  margin:EdgeInsets.all(4),
                  child: Text('Title of Libray',textAlign: TextAlign.center,)),
              demonstrationList,
              _showMoreButton(ScreenURLPath.HISTORYTRADING),
              demonstrationLaterList,
              _showMoreButton(ScreenURLPath.HISTORYTRADING),
              SizedBox(height: 8,),
              historyOfTradingList,
              _showMoreButton(ScreenURLPath.HISTORYTRADING),
              SizedBox(
                height: 16,
              )
            ],
          ),
        )
      );

  }
  Widget _showMoreButton(String screenName){
    return Container(
      height: 20,
      alignment: Alignment.bottomRight,
      child:  RaisedButton(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        onPressed: (){
         CommonWidget.onPressedToNavigate(screenName,context);
        },
        child: Text('Show More',style: TextStyle(fontSize: 12),),
      ),
    );
  }
}

