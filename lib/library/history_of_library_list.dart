import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fx_prj_test_flutter_app/data/Constants.dart';
import 'package:fx_prj_test_flutter_app/data/currency_data.dart';
import 'package:fx_prj_test_flutter_app/data/history_trading_data.dart';
import 'package:fx_prj_test_flutter_app/library/currency_list_item_view.dart';
import 'package:fx_prj_test_flutter_app/library/history_trading_view.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class HistoryOfTradingListView extends StatefulWidget {
  _HistoryOfTradingListViewState createState()=> _HistoryOfTradingListViewState();
}
class _HistoryOfTradingListViewState extends State<HistoryOfTradingListView>{
  bool isShowCalendarView = false;
  bool isShowCurrencyList = false;
  bool isSortedByDate = false;
  bool isSortedByPL = false;
  CalendarController  _calendarController = CalendarController() ;
  String selectedDate = '';
  List<HistoryTradingData> sortedListByDate = [];
  List<HistoryTradingData> sortedByPL = [];

  final  List<HistoryTradingData> topDataList = [
    HistoryTradingData(
        title: "History of Trading 1",date:Constants.convertDateFromString("2019-08-19 8:40:23"), pointLostData: 112),
    HistoryTradingData(
       title: "History of Trading 2", date:Constants.convertDateFromString("2019-05-19 8:40:23"), pointLostData: 30),
    HistoryTradingData(
        title: "History of Trading 3",date:Constants.convertDateFromString("2020-10-25 8:40:23"), pointLostData: 98),
    HistoryTradingData(
        title: "History of Trading 4", date:Constants.convertDateFromString("2019-02-19 8:40:23"), pointLostData: 21),
    HistoryTradingData(
        title: "History of Trading 5" ,date:Constants.convertDateFromString("2020-02-19 8:40:23"), pointLostData: 65 ),
    HistoryTradingData(
        title: "History of Trading 6",date:Constants.convertDateFromString("2020-05-19 8:40:23"), pointLostData: 121),
    HistoryTradingData(
        title: "History of Trading 7", date:Constants.convertDateFromString("2020-07-20 8:40:23"), pointLostData: 283),
    HistoryTradingData(
        title: "History of Trading 8", date:Constants.convertDateFromString("2020-06-19 8:40:23"), pointLostData: 145),
    HistoryTradingData(
        title: "History of Trading 9",date:Constants.convertDateFromString("2019-07-16 8:40:23"), pointLostData: 56),
    HistoryTradingData(
        title: "History of Trading 10",date:Constants.convertDateFromString("2019-07-25 8:40:23"), pointLostData: 66),
    HistoryTradingData(
        title: "History of Trading 11", date:Constants.convertDateFromString("2020-07-20 8:40:23"), pointLostData: 8),
    HistoryTradingData(
        title: "History of Trading 12", date:Constants.convertDateFromString("2020-06-19 8:40:23"), pointLostData: 145),
    HistoryTradingData(
        title: "History of Trading 13",date:Constants.convertDateFromString("2020-10-27 8:40:23"), pointLostData: 113),
    HistoryTradingData(
        title: "History of Trading 14",date:Constants.convertDateFromString("2019-01-25 8:40:23"), pointLostData: 88),
  ];
  final  List<CurrencyData> currencyList = [
    CurrencyData(countryCode: "USD", exchangeRate: 1288),
    CurrencyData(countryCode: "JPY", exchangeRate: 12),
    CurrencyData(countryCode: "KRW", exchangeRate:  113.94),
    CurrencyData(countryCode: "THB", exchangeRate:  41.14),
    CurrencyData(countryCode: "SGD", exchangeRate:   946.8),
  ];
  var threshold = 100;
  @override
  void initState() {
    super.initState();
    //sorted by date
    sortedListByDate.addAll(topDataList);
    _sortByDate();
    // sorted by PL
    sortedByPL.addAll(topDataList);
    _sortByPL();
    print('Top list lenght : ${topDataList.length}, \nsortedbyPPL : ${sortedByPL.length}, \nsortedbyDate:${sortedListByDate.length}', );
  }
  _sortByDate(){
    sortedListByDate..sort((item1, item2) => item2.date.compareTo(item1.date));
  }
  _sortByPL(){
    sortedByPL..sort((item1, item2) => item2.pointLostData.compareTo(item1.pointLostData));
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: Colors.grey,
      body: GestureDetector(
        onPanEnd: (details){
          if (details.velocity.pixelsPerSecond.dy > threshold) {
            this.setState(() {
              isShowCalendarView = false;
              isShowCurrencyList = false;
            });
          } else if (details.velocity.pixelsPerSecond.dy < -threshold) {
            setState(() {
              isShowCalendarView = true;
              isShowCurrencyList = true;
            });
          }

        },
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
                                  onPressed: (){
                                    setState(() {
                                      isShowCalendarView = !isShowCalendarView;
                                    });
                                  },
                                ),
                                Container(
                                  padding: EdgeInsets.all(0.0),
                                  height: 30,
                                  child: RaisedButton(
                                    color: Colors.white,
                                    onPressed: (){
                                      setState(() {
                                        isShowCurrencyList = !isShowCurrencyList;
                                      });
                                    },
                                    child: Text('取引対象', style: TextStyle(fontSize: 12, color: Colors.black),),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(0.0),
                                  height: 30,
                                  child: RaisedButton(
                                    color: isSortedByPL ? Colors.blue: Colors.white,
                                    onPressed: (){
                                      setState(() {
                                        isSortedByPL = !isSortedByPL;
                                      });
                                      if(isSortedByDate){
                                        setState(() {
                                          isSortedByDate = !isSortedByDate;
                                        });
                                      }
                                    },

                                    child: Text('損益',style: TextStyle(fontSize: 12, color: Colors.black)),
                                  ),
                                ),
                                IconButton(
                                  onPressed: (){
                                    setState(() {
                                      isSortedByDate = !isSortedByDate;
                                    });
                                    if(isSortedByPL){
                                      setState(() {
                                        isSortedByPL = !isSortedByPL;
                                      });
                                    }
                                  },
                                  icon:Icon(Icons.sort,color: isSortedByDate ? Colors.blue: Colors.white,) ,
                                  iconSize: 30,
                                )
                              ],
                            ),
                          ),
                          Container(
                            height: height-90,
                            child:  CustomScrollView(
                              slivers: [
                                SliverPadding(
                                  padding: EdgeInsets.only(left: 4,bottom: 4,right: 4),
                                  sliver: SliverFixedExtentList(
                                    itemExtent: 70,
                                    delegate: SliverChildBuilderDelegate(
                                            (context,index)=> HistoryTradingView(

                                              data: isSortedByDate ? (isSortedByPL ? sortedByPL[index] : sortedListByDate[index]) : (isSortedByPL ? sortedByPL[index] : topDataList[index]) ,),
                                        childCount:topDataList.length+1
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: isShowCalendarView || isShowCurrencyList ? -(height/4): -(height/4)-(height/2),
                      left: 0,
                      child: _calendarDrawer(width, height),
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
  Widget _calendarDrawer(double width, double height){
    return  ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(20)),
      child:
      Container(
        color: Colors.white,
        width: width,
        height: (height / 4) * 3,// for timer setting
        child:
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 10.0),
          child: Column(
            children: [
              Icon(
                Icons.keyboard_arrow_up,
                size: 20,
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  //_showCalenderTab(_calendarController),
                  isShowCurrencyList ? _showCurrencyTab() :_showCalenderTab(_calendarController) ,
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _showCalenderTab(CalendarController controller){
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          child: Text (selectedDate),
        ),
        Container(
          padding: EdgeInsets.all(0.0),
          width: MediaQuery.of(context).size.width,
          child:
          TableCalendar(
            rowHeight: 28,
            availableGestures: AvailableGestures.all,
            formatAnimation: FormatAnimation.slide,
            availableCalendarFormats:{CalendarFormat.month: 'Month'},
            calendarStyle: CalendarStyle(

            ),

            headerStyle: HeaderStyle(
              centerHeaderTitle: true,
              formatButtonDecoration: BoxDecoration(
                color: Colors.brown,
                borderRadius: BorderRadius.circular(22.0),
              ),
              formatButtonTextStyle: TextStyle(color: Colors.white),
              formatButtonShowsNext: false,
            ),
            calendarController: _calendarController,

            onDaySelected: (date, events, dates) {
              setState(() {
                selectedDate = Constants.changeDateFormat(date,DateTimeFormat.CALENDAR_FORMAT);
                // selectedDate = date.year.toString()+'-'+ date.month.toString()+'-'+date.day.toString();
              });
              Fluttertoast.showToast(
                  msg: "Your selected date is $selectedDate",
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.BOTTOM,
                  backgroundColor:  Colors.brown,
                  textColor: Colors.white,
                  fontSize: 12
              );
              print('Selected date :${date.year} + ${date.month} + ${date.day}');
              print('combined Selected date :$selectedDate');
            },
            builders: CalendarBuilders(

              selectedDayBuilder: (context, date, events) => Container(
                  margin: const EdgeInsets.all(5.0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: _selectedColor(date),
                      borderRadius: BorderRadius.circular(8.0)),
                  child: Text(
                    date.day.toString(),
                    style: TextStyle(color: Colors.white),
                  )),
              todayDayBuilder: (context, date, events) => Container(
                  margin: const EdgeInsets.all(5.0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(15.0)),
                  child: Text(
                    date.day.toString(),
                    style: TextStyle(color: Colors.white),
                  )),
            ),
          ),
        ),

        Container(
          height: 25,
          margin: EdgeInsets.only(top:5),
          child: RaisedButton(
              color: Colors.black38,
              onPressed: (){
                setState(() {
                  isShowCalendarView = false;
                });
              },
              child: Text("CANCEL",style: TextStyle(color: Colors.white, fontSize: 12),)
          ),
        )
      ],
    );

  }
  Widget _showCurrencyTab(){
    return Column(
      children: [
        Container(
            height: 200,
            child:  ListView.builder(
                padding: EdgeInsets.all(0.0),
                itemCount: currencyList.length,
                itemBuilder: (context,index){
                  return CurrencyListItemView(data: currencyList[index],);
                })
        ),
        Container(
          height: 25,
          margin: EdgeInsets.only(top:5),
          child: RaisedButton(
              color: Colors.black38,
              onPressed: (){
                setState(() {
                  isShowCurrencyList = false;
                });
              },
              child: Text("CANCEL",style: TextStyle(color: Colors.white, fontSize: 12),)
          ),
        )
      ],
    );
  }
  Color _selectedColor(DateTime date){
    String today = Constants.changeDateFormat(DateTime.now(),DateTimeFormat.CALENDAR_FORMAT);
    String selectedDate = Constants.changeDateFormat(date,DateTimeFormat.CALENDAR_FORMAT);
    if(selectedDate == today){
      return Colors.blue;
    } else {
      return Colors.green;
    }
  }
}


/*

class CalendarDrawerState extends State<CalendarDrawer> {

  @override
  void initState() {

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return
      ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(20)),
      child:
      Container(
        color: Colors.white,
        width: width,
        //height: height/3+20 ,
        height: (height / 4) * 3,// for timer setting
        child:
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 10.0),
          child: Column(
            children: [
              Icon(
                Icons.keyboard_arrow_up,
                size: 20,
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  _showCalenderTab(_calendarController)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }


}*/
