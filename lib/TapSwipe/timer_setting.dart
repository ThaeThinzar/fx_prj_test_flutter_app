import 'package:bubble_showcase/bubble_showcase.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class TimerSetting extends StatefulWidget {
  TimerSettingState createState() => TimerSettingState();
}

class TimerSettingState extends State<TimerSetting> {
  double _hr_value = 0;
  double min_value = 0;
  double play_speed = 0;
  int _hour = 0;
  int _min = 00;
  RangeValues _values = RangeValues(0.3, 0.7);
  @override
  Widget build(BuildContext context) {
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
                    Fluttertoast.showToast(
                        msg: "We'll show calender view soon",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.indigoAccent,
                        textColor: Colors.white,
                        fontSize: 12.0
                    );
                  },
                  icon: Icon(
                    Icons.calendar_today,
                    color: Colors.grey,
                  ),
                  iconSize: 20,
                ),
                _buttonWidget('1Y Ago', width / 5.2),
                _buttonWidget("1M Ago", width / 5.2),
                _buttonWidget('1W Ago', width / 5.2),
                _buttonWidget('Random', width / 5.1)
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
        ],
      ),
    );
  }

  Widget _buttonWidget(String name, double width) {
    return Container(
      height: 30,
      width: width,
      child: RaisedButton(
        onPressed: () {},
        child: Text(
          name,
          style: TextStyle(fontSize: 10),
        ),
      ),
    );
  }
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
                     _buttonWidget('1m', 50),
                     _buttonWidget('5m', 50),
                     _buttonWidget('15m', 55),
                     _buttonWidget('30m', 60),
                   ],
                 ),
                 SizedBox(height: 5,),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                   children: [
                     _buttonWidget('1h', 50),
                     _buttonWidget('4h', 50),
                     _buttonWidget('10h', 55),
                     _buttonWidget('None', 60),
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
