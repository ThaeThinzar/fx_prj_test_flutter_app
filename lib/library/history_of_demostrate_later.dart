import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fx_prj_test_flutter_app/Gesture/MyGesturePage.dart';
import 'package:fx_prj_test_flutter_app/data/Constants.dart';
import 'package:fx_prj_test_flutter_app/data/history_trading_data.dart';
import 'package:fx_prj_test_flutter_app/data/top_data.dart';
import 'package:fx_prj_test_flutter_app/library/event_item_view.dart';
import 'package:fx_prj_test_flutter_app/library/history_trading_view.dart';

class HistoryOfDemonstrationLater extends StatefulWidget {
  _HistoryOfDemonstrationLaterState createState()=> _HistoryOfDemonstrationLaterState();
}
class _HistoryOfDemonstrationLaterState extends State<HistoryOfDemonstrationLater>{
  List<TopData> topDataList = TopData.getTopDataList();
  var threshold = 100;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    Widget demonstrationLaterList = Column(
      children: [
      /*  new Container(
          padding: EdgeInsets.only(left: 8,top: 16,bottom: 8),
          alignment: Alignment.center,
          child: Text('(Title of Demonstrate later)', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
        ),*/
        new Container(
            padding: EdgeInsets.zero,
            height: (height/6*5 ),
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                padding: EdgeInsets.all(0.0),
                itemCount: topDataList.length,
                itemBuilder: (context,index){
                  return MyGesturePage(data:topDataList[index]);
                })
        ),

      ],
    );
    return Scaffold(
        appBar: AppBar(
          title: Text('Demonstrate Later',style: TextStyle(fontSize: 18),),
        ),
        body: Container(
          padding: EdgeInsets.only(top: 16,left: 8,right: 8),
          child: Column(
            children: [
              demonstrationLaterList
            ],
          ),
        )


    );
  }

}

