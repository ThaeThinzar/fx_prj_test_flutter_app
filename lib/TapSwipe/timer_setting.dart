import 'package:bubble_showcase/bubble_showcase.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fx_prj_test_flutter_app/TapSwipe/sliable_list_test.dart';
import 'package:fx_prj_test_flutter_app/data/Constants.dart';
import 'package:fx_prj_test_flutter_app/data/common_widget.dart';
import 'package:fx_prj_test_flutter_app/data/my_button_model.dart';
import 'package:swipedetector/swipedetector.dart';
import 'package:table_calendar/table_calendar.dart';

class TimerSetting extends StatefulWidget {
  TimerSettingState createState() => TimerSettingState();
}

class TimerSettingState extends State<TimerSetting> {
  double _hr_value = 0;
  double min_value = 0;
  double play_speed = 0;
  int _hour = 0;
  int _min = 00;
  int times = 0;
  bool isClickYear = false;
  bool isClickMin = false;
  bool isClickHr = false;
  int clickedYearBtnID = 0;
  int clickedMinBtnID = 0;
  int clickedHourBtnID = 0;
  bool pressAttention = false;
  bool isCalenderShow = false;
  RangeValues _values = RangeValues(0.3, 0.7);
  CalendarController _calendarController ;
  String selectedDate = '';
  String timerProperties = 'Hello';
  String yearButtonText = " ";
  String minButtonText = "";
  String hrButtonText = "";
  List<MyButtonModal> _yearDateButtons = [
    MyButtonModal(buttonText: "1Y ago", buttonType: "YEAR", buttonId: 01, color: Colors.white),
    MyButtonModal(buttonText: "1M ago", buttonType: "YEAR", buttonId: 02,color: Colors.white),
    MyButtonModal(buttonText: "1W ago", buttonType: "YEAR", buttonId: 03,color: Colors.white),
    MyButtonModal(buttonText: "Random", buttonType: "YEAR", buttonId: 04,color: Colors.white),
  ];
  List<MyButtonModal> _minButtons = [
    MyButtonModal(buttonText: "1m", buttonType: "MIN",buttonId: 05, color: Colors.white),
    MyButtonModal(buttonText: "5m", buttonType: "MIN",buttonId: 06, color: Colors.white),
    MyButtonModal(buttonText: "15m", buttonType: "MIN",buttonId: 07, color: Colors.white),
    MyButtonModal(buttonText: "30m", buttonType: "MIN",buttonId: 08, color: Colors.white),
  ];
  List<MyButtonModal> _hoursButtons = [
    MyButtonModal(buttonText: "1h", buttonType: "HR",buttonId: 09, color: Colors.white),
    MyButtonModal(buttonText: "4h", buttonType: "HR",buttonId: 10, color: Colors.white),
    MyButtonModal(buttonText: "10h", buttonType: "HR",buttonId: 11, color: Colors.white),
    MyButtonModal(buttonText: "None", buttonType: "HR",buttonId: 12, color: Colors.white),
  ];
  @override
  void initState() {
    super.initState();
    _calendarController = CalendarController();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        isCalenderShow ?  _showCalenderTab(_calendarController) :timerSettingWidget(),

      ],
    );

  }
  Widget _showCalenderTab(CalendarController controller){
    return Column(
       mainAxisSize: MainAxisSize.min,
      children: [
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
                selectedDate = Constants.changeDateFormat(date);
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
            height: 120,
            child: ListView.builder(
              padding: EdgeInsets.all(0.0),
              itemCount: 10,
              itemBuilder: (context, position) {
                return Card(
                  color: Colors.white24,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8,top: 4, bottom: 4),
                    child: Text('   The event of economic indicator of ${(position+1).toString()}', style: TextStyle(fontSize: 12.0),),
                  ),
                );
              },
            ),
          ),
          Container(
            height: 25,
            margin: EdgeInsets.only(top:5),
            child: RaisedButton(
              color: Colors.black38,
              onPressed: (){
                setState(() {
                  isCalenderShow = false;
                });
              },
              child: Text("CANCEL",style: TextStyle(color: Colors.white, fontSize: 12),)
            ),
          )
      ],
    );

  }
  Color _selectedColor(DateTime date){
    String today = Constants.changeDateFormat(DateTime.now());
    String selectedDate = Constants.changeDateFormat(date);
    if(selectedDate == today){
      return Colors.blue;
    } else {
      return Colors.green;
    }
  }
  Widget timerSettingWidget(){
    var width = MediaQuery.of(context).size.width;
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed:(){
                    if(isCalenderShow){
                      setState(() {
                        isCalenderShow = false;
                      });
                    } else {
                      setState(() {
                        isCalenderShow = true;
                      });
                    }
                  },
                  icon: Icon(
                    Icons.calendar_today,
                    color: Colors.grey,
                  ),
                  iconSize: 20,
                ),
                for ( var ibutton in _yearDateButtons ) _yearButtonWidget(ibutton, width / 5.1, 3),
              ],
            ),
          ),
          Container(
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 16),
                  child: Column(
                    children: [
                      Text(
                        '時間',
                        style: TextStyle(fontSize: 10),
                      ),
                      Text(
                        '$_hour:${(_min.toString().padLeft(2, "0"))}',
                        style: TextStyle(fontSize: 10),
                      )
                    ],
                  ),
                ),
                Container(
                    width: MediaQuery.of(context).size.width -65,
                    child:Column(
                      children: [
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            activeTrackColor: Colors.red[700],
                            inactiveTrackColor: Colors.red[100],
                            trackShape: RectangularSliderTrackShape(),
                            trackHeight: 4.0,
                            thumbColor: Colors.white,
                            thumbShape:RoundSliderThumbShape(enabledThumbRadius: 10),
                            /* CustomSliderThumbCircle(
                        thumbRadius: 20* .4,
                        min:0,
                        max: 100,
                      ),*/
                            overlayColor: Colors.red.withAlpha(32),
                            overlayShape: RoundSliderOverlayShape(overlayRadius: 20.0),
                          ),
                          child: Slider(
                            min: 0,
                            max: 23,
                            value: _hr_value,
                            onChanged: (value) {
                              setState(() {
                                _hr_value = value;
                                _hour = value.toInt();
                              });
                            },
                          ),
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            activeTrackColor: Colors.indigoAccent[700],
                            inactiveTrackColor: Colors.indigoAccent[100],
                            trackShape: RectangularSliderTrackShape(),
                            trackHeight: 4.0,
                            thumbColor: Colors.red,
                            thumbShape:
                            CustomSliderThumbCircle(
                              thumbRadius: 20* .4,
                              min:1,
                              max: 59,
                            ),
                            overlayColor: Colors.indigoAccent.withAlpha(32),
                            overlayShape: RoundSliderOverlayShape(overlayRadius: 20.0),
                          ),
                          child: Slider(
                            min: 0,
                            max: 59,
                            value: min_value,
                            onChanged: (value) {
                              setState(() {
                                min_value = value;
                                _min = min_value.toInt();
                              });
                            },
                          ),
                        ),
                      ],
                    )

                ),
                // CustomSliderThumbCircle( thumbRadius: 12,min: 1, max: 100),
              ],
            ),
          ),
          _playUnit(),
          _playSpeed(),
          RaisedButton(
            onPressed: (){
              String properties = updateTimerPropertiees(_hour.toString(), _min.toString());
              showDialog(context: context, builder: (BuildContext context) => CustomDialog(timerProperties));

            },
            child: Text('Confirm'),
          )
        ],
      ),
    );
  }

  String  updateTimerPropertiees(String hr, String min, ){

    String yeartext = checkNothingSelected(_yearDateButtons) == true ? " ": "$yearButtonText\n";
    String minText = checkNothingSelected(_minButtons)  ? " " :" $minButtonText\n";
    String hourText = checkNothingSelected(_hoursButtons) == true ? " ": "$hrButtonText";
    setState(() {
      timerProperties = "Your Selected timer setting:"+'\n $hr hr '+
       '\n $min min' +'\n ${(play_speed.toInt()).toString()} times and'+
      ' $yeartext'+'$minText '+'$hourText';

    });
  }
  bool checkNothingSelected(List<MyButtonModal> buttonlist){
    List<Color> colorList = List();
    for(int i=0 ;i< buttonlist.length; i++){
      if(buttonlist[i].color == Colors.blue){
        colorList.add(buttonlist[i].color);
      }
    }
    if(colorList.length ==0){
      return true;
    }else {
      return false;
    }
  }
  Widget _yearButtonWidget(MyButtonModal buttonModal, double width,int id) {
    return Container(
      height: 30,
      width: width,
      child: RaisedButton(
        color: buttonModal.color,
        onPressed: () {
          setState(() {
            buttonModal.changeButtonColor = !buttonModal.changeButtonColor;
            isClickYear = true;
            buttonModal.color = _changeYearButtonColor(buttonModal);
          });

        },
        child: Text(
          buttonModal.buttonText,
          style: TextStyle(fontSize: 10),
        ),
      ),
    );
  }
  Color _changeYearButtonColor(MyButtonModal buttonModal){
    if(clickedYearBtnID == 0) {
      setState(() {
        yearButtonText = buttonModal.buttonText;
        clickedYearBtnID = buttonModal.buttonId;
      });
      return Colors.blue;
    } else{
      if(clickedYearBtnID == buttonModal.buttonId){
        setState(() {
          clickedYearBtnID = 0;
        });
      }
      return Colors.white;
    }

  }
  Widget _minButtonWidget(MyButtonModal buttonModal, double width,int id) {
    return Container(
      height: 30,
      width: width,
      child: RaisedButton(
        color: buttonModal.color,
        onPressed: () {
          setState(() {
            buttonModal.changeButtonColor = !buttonModal.changeButtonColor;
            isClickMin = true;
            buttonModal.color = _changeMinButtonColor(buttonModal);
          });

        },
        child: Text(
          buttonModal.buttonText,
          style: TextStyle(fontSize: 10),
        ),
      ),
    );
  }
  Color _changeMinButtonColor(MyButtonModal buttonModal){
    if(clickedMinBtnID == 0) {
      setState(() {
        minButtonText = buttonModal.buttonText;
        clickedMinBtnID = buttonModal.buttonId;
      });
      return Colors.blue;
    } else{
      if(clickedMinBtnID == buttonModal.buttonId){
        setState(() {
          clickedMinBtnID = 0;
        });
      }
      return Colors.white;
    }

  }
  Widget _hourButtonWidget(MyButtonModal buttonModal, double width,int id) {
    return Container(
      height: 30,
      width: width,
      child: RaisedButton(
        color: buttonModal.color,
        onPressed: () {
          setState(() {
            buttonModal.changeButtonColor = !buttonModal.changeButtonColor;
            isClickHr = true;
            buttonModal.color = _changeHrButtonColor(buttonModal);
          });

        },
        child: Text(
          buttonModal.buttonText,
          style: TextStyle(fontSize: 10),
        ),
      ),
    );
  }
  Color _changeHrButtonColor(MyButtonModal buttonModal){
    if(clickedHourBtnID == 0) {
      setState(() {
        hrButtonText = buttonModal.buttonText;
        clickedHourBtnID = buttonModal.buttonId;
      });
      return Colors.blue;
    } else{
      if(clickedHourBtnID == buttonModal.buttonId){
        setState(() {
          clickedHourBtnID = 0;
        });
      }
      return Colors.white;
    }

  }
/*  Widget _buttonWidget(MyButtonModal buttonModal, double width,int id) {
    return Container(
      height: 30,
      width: width,
      child: RaisedButton(
        color:  _changeColor(buttonModal),
        onPressed: () {
          switch(buttonModal.buttonType){
            case "YEAR":
              setState(() {
                yearButtonText = buttonModal.buttonText;
                isClickYear = !isClickYear;
              });
              break;
            case "MIN":
              setState(() {
                minButtonText = buttonModal.buttonText;
                isClickMin = !isClickMin;
              });
              break;
            case "HR":
              setState(() {
                hrButtonText = buttonModal.buttonText;
                isClickHr = !isClickHr;
              });
              break;
          }
          setState(() {
            buttonModal.changeButtonColor = !buttonModal.changeButtonColor;
          });

        },
        child: Text(
          buttonModal.buttonText,
          style: TextStyle(fontSize: 10),
        ),
      ),
    );
  }*/
  Widget _playUnit(){
    return Container(
     child:   Row(

       children: [
         Container(

           margin: EdgeInsets.only(left: 16),
           child: Column(
             children: [
               Text(
                 '再生',
                 style: TextStyle(fontSize: 10),
               ),
               Text(
                 '単位',
                 style: TextStyle(fontSize: 10),
               )
             ],
           ),
         ),
         Container(
             width: MediaQuery.of(context).size.width -65,
             child:
             Column(
               children: [
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                   children: [
                     for(var i in _minButtons) _minButtonWidget(i, 60, 1)
                   ],
                 ),
                 SizedBox(height: 5,),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                   children: [
                     for(var hr in _hoursButtons) _hourButtonWidget(hr, 60, 1)
                     /*_buttonWidget('1h', 50,8),
                     _buttonWidget('4h', 50,9),
                     _buttonWidget('10h', 55,10),
                     _buttonWidget('None', 60,11),*/
                   ],
                 )
               ],
             )

         ),
         // CustomSliderThumbCircle( thumbRadius: 12,min: 1, max: 100),
       ],
     ),
    );
  }
  Widget _playSpeed(){
    return Container(
      child:   Row(

        children: [
          Container(
            margin: EdgeInsets.only(top:8,left: 16,right: 2),
            child: Column(
              children: [
                Text(
                  '再生 スピード',
                  style: TextStyle(fontSize: 10),
                ),
                Text(
                  '${play_speed.toInt()}回/1s',
                  style: TextStyle(fontSize: 10),
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 8),
            width: (MediaQuery.of(context).size.width/3)*2,
              decoration: new BoxDecoration(
                  color: Colors.green,
                  borderRadius: new BorderRadius.only(
                    topLeft: const Radius.circular(2.0),
                    topRight: const Radius.circular(2.0),
                  )
              ),
              child: new Center(
                child:  SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    activeTrackColor: Colors.brown[700],
                    inactiveTrackColor: Colors.brown[100],
                    trackShape: RectangularSliderTrackShape(),
                    trackHeight: 2.0,
                    thumbColor: Colors.white,
                    thumbShape:RoundSliderThumbShape(enabledThumbRadius: 10),
                    overlayColor: Colors.red.withAlpha(32),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 20.0),
                  ),
                  child: Slider(
                    min: 0,
                    max: 60,
                    value: play_speed,
                    onChanged: (value) {
                      setState(() {
                        play_speed = value;
                      });
                    },
                  ),
                ),
              )
          ),
          // CustomSliderThumbCircle( thumbRadius: 12,min: 1, max: 100),
        ],
      ),
    );
  }
}

class CustomSliderThumbCircle extends SliderComponentShape {
  final double thumbRadius;
  final int min;
  final int max;

  const CustomSliderThumbCircle({
    @required this.thumbRadius,
    this.min = 0,
    this.max = 10,
  });

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(thumbRadius);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    Animation<double> activationAnimation,
    Animation<double> enableAnimation,
    bool isDiscrete,
    TextPainter labelPainter,
    RenderBox parentBox,
    SliderThemeData sliderTheme,
    TextDirection textDirection,
    double value,
    double textScaleFactor,
    Size sizeWithOverflow,
  }) {
    final Canvas canvas = context.canvas;

    final paint = Paint()
      ..color = Colors.blue //Thumb Background Color
      ..style = PaintingStyle.fill;

   /* TextSpan span = new TextSpan(
      style: new TextStyle(
        fontSize: thumbRadius * .8,
        fontWeight: FontWeight.w700,
        color: sliderTheme.thumbColor, //Text Color of Value on Thumb
      ),
      text: getValue(value),
    );*/

   /* TextPainter tp = new TextPainter(
        text: span,
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr);
    tp.layout();*/
  /*  Offset textCenter =
        Offset(center.dx - (tp.width / 2), center.dy - (tp.height / 2));

    canvas.drawCircle(center, thumbRadius * .9, paint);
    tp.paint(canvas, textCenter);*/
  }

  String getValue(double value) {
    return (min + (max - min) * value).round().toString();
  }
}
