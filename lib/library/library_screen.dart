import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fx_prj_test_flutter_app/data/history_trading_data.dart';
import 'package:fx_prj_test_flutter_app/library/history_trading_view.dart';

class LibraryScreen extends StatefulWidget {
  _LibraryScreenState createState()=> _LibraryScreenState();
}
class _LibraryScreenState extends State<LibraryScreen>{
  final  List<HistoryTradingData> topDataList = [
    HistoryTradingData(
        title: "History of Trading 1"),
    HistoryTradingData(
       title: "History of Trading 2"),
    HistoryTradingData(
        title: "History of Trading 4"),
    HistoryTradingData(
        title: "History of Trading 5"),
    HistoryTradingData(
        title: "History of Trading 6"),
    HistoryTradingData(
        title: "History of Trading 7"),
    HistoryTradingData(
        title: "History of Trading 8"),
    HistoryTradingData(
        title: "History of Trading 9"),
    HistoryTradingData(
        title: "History of Trading 10"),

  ];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.grey,
      body: GestureDetector(
        child:    Container(
          margin: EdgeInsets.only(top: 16),
          width: width,
          height: height,
          child: Column(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 16, left: 8, right: 8),
                            width: MediaQuery.of(context).size.width,
                            height: 25,
                            child: Text(' Titles of History of Trading', textAlign: TextAlign.center,style: TextStyle(color: Colors.black, fontSize: 12),),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 50,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                IconButton(
                                  icon: Icon(Icons.calendar_today, color: Colors.white,),
                                  iconSize: 30,
                                  color: Colors.white,
                                ),
                                Container(
                                  padding: EdgeInsets.all(0.0),
                                  height: 30,
                                  child: RaisedButton(
                                    color: Colors.white,
                                    onPressed: (){

                                    },
                                    child: Text('取引対象', style: TextStyle(fontSize: 12, color: Colors.black),),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(0.0),
                                  height: 30,
                                  child: RaisedButton(
                                    color: Colors.white,
                                    onPressed: (){

                                    },
                                    child: Text('損益',style: TextStyle(fontSize: 12, color: Colors.black)),
                                  ),
                                ),
                                IconButton(
                                  icon:Icon(Icons.sort,color: Colors.white,) ,
                                  iconSize: 30,
                                )
                              ],
                            ),
                          ),
                          Container(
                            height: height-60,
                            child:  CustomScrollView(
                              slivers: [
                                SliverPadding(
                                  padding: EdgeInsets.only(left: 4,bottom: 4,right: 4),
                                  sliver: SliverFixedExtentList(
                                    itemExtent: 70,
                                    delegate: SliverChildBuilderDelegate(
                                            (context,index)=> HistoryTradingView(data: topDataList[index],),
                                        childCount:topDataList.length
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      )


    );
  }

}