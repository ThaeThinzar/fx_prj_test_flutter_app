import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fx_prj_test_flutter_app/data/history_trading_data.dart';

import '../main.dart';

class HistoryTradingView extends StatefulWidget {
  final HistoryTradingData data;
  HistoryTradingView({Key key,this.data}):super(key:key);
  _HistoryTradingViewState createState() => _HistoryTradingViewState();
}
class _HistoryTradingViewState extends State<HistoryTradingView>{
  final HistoryTradingData data;
  _HistoryTradingViewState({Key key, this.data});
  @override
  void initState() {
    print("HistoryTrading view : RTL optin is $isRTLlayout");
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(2),
      child: Card(
        child:
        Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(4),
              child: Text(widget.data.title,style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
            ),
            Container(
              child: Text(widget.data.title, style: TextStyle(fontSize: 12,color: Colors.blue),),
            )
          ],
        ),
      ),
    );
  }

}