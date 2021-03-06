import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fx_prj_test_flutter_app/data/Constants.dart';
import 'package:fx_prj_test_flutter_app/data/SortedData.dart';
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
  bool isSortedByDate = null;
  bool isSortedByPL = null;
  SortedData sortedData ;
  CalendarController  _calendarController = CalendarController() ;
  String selectedDate = '';
  List<HistoryTradingData> sortedListByDate = [];
  List<HistoryTradingData> sortedByPL = [];
  List<HistoryTradingData> tradingList = HistoryTradingData.getHistoryTradingDataList();
  List<CurrencyData> currencyList = CurrencyData.getCurrencyList();

  var threshold = 100;
  @override
  void initState() {
    super.initState();
    sortedData  = SortedData(false, false,  false);
    //sorted by date
    sortedListByDate.addAll(tradingList);
    _sortByDate();
    // sorted by PL
    sortedByPL.addAll(tradingList);
    _sortByPL();
    print('Top list lenght : ${tradingList.length}, \nsortedbyPPL : ${sortedByPL.length}, \nsortedbyDate:${sortedListByDate.length}', );
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
      appBar: AppBar(title: Text('History of Trading', style: TextStyle(fontSize: 18),),),
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
                            width: MediaQuery.of(context).size.width,
                            height: 40,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.only(bottom: 16),
                                  child: IconButton(
                                    icon: Icon(Icons.calendar_today, color: Colors.grey,),
                                    iconSize: 26,
                                    color: Colors.white,
                                    onPressed: (){
                                      if(isShowCurrencyList){
                                        setState(() {
                                          isShowCurrencyList = false;
                                        });
                                      }
                                      setState(() {
                                        isShowCalendarView = !isShowCalendarView;
                                      });
                                    },
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(0.0),
                                  height: 30,
                                  child: RaisedButton(
                                    color: Colors.white,
                                    onPressed: (){
                                      if(isShowCalendarView){
                                        setState(() {
                                          isShowCalendarView = false;
                                        });
                                      }
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
                                    color: (sortedData.isSortedByPL && sortedData.isSortedByDate) ? Colors.blue :sortedData.isSortedByPL ? Colors.blue:  Colors.white,
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
                                      setState(() {
                                        sortedData = SortedData(true, false,!sortedData.isAscending);
                                      });
                                    },

                                    child: Text('損益',style: TextStyle(fontSize: 12, color: Colors.black)),
                                  ),
                                ),
                                IconButton(
                                  onPressed: (){
                                    if(isSortedByDate == null){
                                      setState(() {
                                        isSortedByDate = true;
                                      });
                                    } else {
                                      setState(() {
                                        isSortedByDate = !isSortedByDate;
                                      });
                                    }
                                    setState(() {
                                      sortedData = SortedData(false, true, !sortedData.isAscending);
                                    });
                                  },
                                  icon:Icon(Icons.sort,color: (sortedData.isSortedByDate && sortedData.isSortedByPL) ? Colors.blue : sortedData.isSortedByDate ? Colors.blue: Colors.grey,) ,
                                  iconSize: 30,
                                )
                              ],
                            ),
                          ),
                          Container(
                            height: height-150,
                            child:  CustomScrollView(
                              slivers: [
                                SliverPadding(
                                  padding: EdgeInsets.only(left: 4,bottom: 16,right: 4),
                                  sliver: SliverFixedExtentList(
                                    itemExtent: 70,
                                    delegate: SliverChildBuilderDelegate(
                                            (BuildContext context,int index){
                                              if(sortedData.isSortedByPL || sortedData.isSortedByDate){
                                                List<HistoryTradingData> dataList = getSortedList(sortedData);
                                                return HistoryTradingView(data:dataList[index]);
                                              } else {
                                                return HistoryTradingView(data:tradingList[index]);
                                              }

                                            },
                                              //   HistoryTradingView(
                                              //// data: isSortedByDate ? (isSortedByPL ? sortedByPL[index] : sortedListByDate[index]) : (isSortedByPL ? sortedByPL[index] : tradingList[index]) ,),
                                        childCount:tradingList.length
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
  List<HistoryTradingData> getSortedList(SortedData data, ){
    List<HistoryTradingData> sortedList = [];
    sortedList.addAll(tradingList);
    if(data.isSortedByPL){
      sortedList = sortAscending(data, sortedList, true);
    } else if(data.isSortedByDate){
      sortedList = sortAscending(data, sortedList, false);
    } else if(data.isSortedByDate && isSortedByPL){
      sortedList = sortAscending(data, sortedListByDate, true);
    }
    return sortedList;
  }
  List<HistoryTradingData> sortAscending(SortedData data,List<HistoryTradingData> dataList, bool isPL){
    if(data.isAscending){
      dataList..sort((item1, item2) => isPL ? item2.pointLostData.compareTo(item1.pointLostData): item2.date.compareTo(item1.date));
      return dataList;
    } else {
      dataList..sort((item1, item2) => isPL ?  item1.pointLostData.compareTo(item2.pointLostData) : item1.date.compareTo(item2.date));
      return dataList;
    }
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

