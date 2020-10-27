import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fx_prj_test_flutter_app/data/currency_data.dart';
import 'package:fx_prj_test_flutter_app/data/history_trading_data.dart';

import '../main.dart';

class CurrencyListItemView extends StatefulWidget {
  final CurrencyData data;
  CurrencyListItemView({Key key,this.data}):super(key:key);
  _CurrencyListItemViewState createState() => _CurrencyListItemViewState();
}
class _CurrencyListItemViewState extends State<CurrencyListItemView>{
  final CurrencyData data;
  _CurrencyListItemViewState({Key key, this.data});
  @override
  void initState() {
    print("HistoryTrading view : RTL optin is $isRTLlayout");
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(4),
      child: Card(
        margin: EdgeInsets.all(4),
        color: Colors.white70,
        child:
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(8),
              child: Text(widget.data.countryCode,style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
            ),
            Container(
              child: Text(widget.data.exchangeRate.toString(), style: TextStyle(fontSize: 12,color: Colors.blue),),
            ),

          ],
        ),
      ),
    );
  }

}