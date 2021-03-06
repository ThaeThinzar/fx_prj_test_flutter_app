import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fx_prj_test_flutter_app/Gesture/MyGesturePage.dart';
import 'package:fx_prj_test_flutter_app/data/Constants.dart';
import 'package:fx_prj_test_flutter_app/data/common_widget.dart';
import 'package:fx_prj_test_flutter_app/data/history_trading_data.dart';
import 'package:fx_prj_test_flutter_app/data/top_data.dart';
import 'package:fx_prj_test_flutter_app/library/event_item_view.dart';
import 'package:fx_prj_test_flutter_app/library/history_of_library_list.dart';
import 'package:fx_prj_test_flutter_app/library/history_trading_view.dart';

import '../main.dart';

class LibraryMainScreen extends StatefulWidget{
  _LibraryMainScreenState createState() =>_LibraryMainScreenState();
}
class _LibraryMainScreenState extends State<LibraryMainScreen>{
  List<TopData> topDataList = TopData.getTopDataList();
  List<HistoryTradingData> tradingList = HistoryTradingData.getHistoryTradingDataList();
  List<HistoryTradingData> sortedByPLAs = [];
  List<HistoryTradingData> sortedByPLDes = [];
  bool isSortedByPL = null;

  @override
  void initState() {
    super.initState();
    sortedByPLAs.addAll(tradingList);
    sortedByPLDes.addAll(tradingList);
    _sortByPLAscending();
    _sortByPLDescending();
  }
  _sortByPLAscending(){
    sortedByPLAs..sort((item1, item2) => item2.pointLostData.compareTo(item1.pointLostData));
  }
  _sortByPLDescending(){
    sortedByPLDes..sort((item1, item2) => item1.pointLostData.compareTo(item2.pointLostData));
  }

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
                    return EventItemView( topDataList[index]);
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
                  color: isSortedByPL == null ? Colors.white70 :  isSortedByPL ? Colors.blue : Colors.white70  ,
                  onPressed: (){
                    if(isSortedByPL == null){
                      setState(() {
                        isSortedByPL = true;
                      });
                    } else {
                      setState(() {
                        isSortedByPL = !isSortedByPL;
                      });
                    }
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
                itemCount: tradingList.length,
                itemBuilder: (context,index){
                  return HistoryTradingView(data: isSortedByPL == null ? tradingList[index] : isSortedByPL ? sortedByPLAs[index] :sortedByPLDes[index]);
                })
          )
        ],
      );
      return Scaffold(
        appBar: AppBar(
          title: Text('ライブラリー'),
        ),
        body:new Container(
          child:
          ListView(
            padding: EdgeInsets.all(0.0),
            scrollDirection: Axis.vertical,
            children: <Widget>[
              Container(
                  margin:EdgeInsets.all(4),
                  child: Text('Title of Libray',textAlign: TextAlign.center,)),
              demonstrationList,
              _showMoreButton(ScreenURLPath.HISTORY_OF_DEMON_LIST),
              demonstrationLaterList,
              _showMoreButton(ScreenURLPath.HISTORY_OF_DEMON_LATER),
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

