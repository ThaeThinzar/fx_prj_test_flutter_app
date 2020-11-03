import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fx_prj_test_flutter_app/Gesture/MyGesturePage.dart';
import 'package:fx_prj_test_flutter_app/data/Constants.dart';
import 'package:fx_prj_test_flutter_app/data/history_trading_data.dart';
import 'package:fx_prj_test_flutter_app/data/top_data.dart';
import 'package:fx_prj_test_flutter_app/library/event_item_view.dart';
import 'package:fx_prj_test_flutter_app/library/history_trading_view.dart';
import 'package:table_calendar/table_calendar.dart';

class HistoryOfDemonstrationList extends StatefulWidget {
  _HistoryOfDemonstrationListViewState createState()=> _HistoryOfDemonstrationListViewState();
}
class _HistoryOfDemonstrationListViewState extends State<HistoryOfDemonstrationList>{
  bool isShowCalendarView = false;
  CalendarController  _calendarController = CalendarController() ;
  String selectedDate = '';
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

  var threshold = 100;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: AppBar(title: Text('History of Demonstration',style: TextStyle(fontSize: 18),),
        actions: [
          GestureDetector(
            onTap: (){
              setState(() {
                isShowCalendarView = !isShowCalendarView;
              });
            },
            child: Container(margin:EdgeInsets.all(4),child: Icon(Icons.calendar_today)),
          )
        ],),
        backgroundColor: Colors.grey,
        body: GestureDetector(
          onPanEnd: (details){
            if (details.velocity.pixelsPerSecond.dy > threshold) {
              this.setState(() {
                isShowCalendarView = false;
              });
            } else if (details.velocity.pixelsPerSecond.dy < -threshold) {
              setState(() {
                isShowCalendarView = true;
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
                              height: height-90,
                              child:  CustomScrollView(
                                slivers: [
                                  SliverPadding(
                                    padding: EdgeInsets.only(left: 4,bottom: 16,right: 4),
                                    sliver: SliverFixedExtentList(
                                      itemExtent: 200,
                                      delegate: SliverChildBuilderDelegate(

                                              (context,index)=> MyGesturePage(data: topDataList[index],),
                                          childCount:topDataList.length
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
                        bottom: isShowCalendarView ? -(height/4): -(height/4)-(height/2),
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
                  _showCalenderTab(_calendarController),
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

