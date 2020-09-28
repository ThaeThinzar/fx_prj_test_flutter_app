import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fx_prj_test_flutter_app/Gesture/MyGesturePage.dart';
import 'package:fx_prj_test_flutter_app/data/Constants.dart';
import 'package:fx_prj_test_flutter_app/data/top_data.dart';

class HomePage extends StatefulWidget {
  _HomePageState createState()=> _HomePageState();
}
class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Widget itemView = Text('Hello');
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
    return Scaffold(
      body:CustomScrollView(
        slivers: [
          SliverPadding(
            padding: EdgeInsets.all(8),
            sliver: SliverFixedExtentList(

              itemExtent: 150,
              delegate: SliverChildBuilderDelegate(
                      (context,index)=> MyGesturePage(data: topDataList[index],),
                childCount:topDataList.length
              ),
            ),
          )
        ],
      ),
    );
  }

}