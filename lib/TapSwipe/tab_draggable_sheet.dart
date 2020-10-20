import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fx_prj_test_flutter_app/Gesture/MyGesturePage.dart';
import 'package:fx_prj_test_flutter_app/TapSwipe/sliable_list_test.dart';
import 'package:fx_prj_test_flutter_app/TapSwipe/timer_setting.dart';
import 'package:fx_prj_test_flutter_app/home/home_page.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class BottomDrawer extends StatefulWidget {
  _TabDraggableSheet createState() => _TabDraggableSheet();
}

class _TabDraggableSheet extends State<BottomDrawer> {
  bool isShowBottomsheet = false;
  bool isPLClick = false;
  bool isLogsClick = false;
  String logs = "logs";
  bool isFirstTime = false;
  bool isClear = false;
  bool isShowTimeSetting = false;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var threshold = 100;
    double mainHeight = height - 280;
    int _value = 1;

    return Scaffold(
        backgroundColor: Colors.grey,
        body: GestureDetector(
          onPanEnd: (details) {
            debugPrint(details.velocity.pixelsPerSecond.dy.toString());
            if (details.velocity.pixelsPerSecond.dy > threshold) {
              this.setState(() {
                isShowBottomsheet = false;
                if(isShowTimeSetting){
                  isShowTimeSetting = false;
                }
              });
            } else if (details.velocity.pixelsPerSecond.dy < -threshold) {
              setState(() {
                isShowBottomsheet = true;
              });
            }
          },
          child: Container(
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
                            SizedBox(height: 16,),
                            ChartEventList(),
                            Container(
                              margin: EdgeInsets.all(8),
                              width: width,
                              height: 200,
                              color: Colors.blue,
                              alignment: Alignment.center,
                              child: Text('Main Chart'),
                            ),
                            Container(
                              margin: EdgeInsets.all(8),
                              width: width,
                              height: 100,
                              color: Colors.red,
                              alignment: Alignment.center,
                              child: Text(
                                'Sub Chart',
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                      //TODO Bottom Sheet
                      isShowTimeSetting ? Positioned(
                         bottom: isShowTimeSetting ? -60 : -(height / 3)-180,
                        left: 0,
                        child: TimerSettingDrawer(),
                      ):
                      Positioned(
                        bottom: isShowBottomsheet ? -60 : -(height / 3),
                       // bottom: isShowBottomsheet ? -60: isShowTimeSetting? (isShowBottomsheet ?-(height / 3)-180 : -60):-(height / 3)-180,
                        left: 0,
                        child: BottomSheet(),
                      )
                    ],
                  ),
                ),
               // TimerSetting(),
                isShowTimeSetting ? Container() :Container(
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 8),
                        height: MediaQuery.of(context).size.height / 20,
                        child: RaisedButton(
                          child: Text("BUY"),
                          onPressed: () {},
                        ),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              child: Text(logs),
                              onTap: () {
                                print('Tab on Log');
                                if (isLogsClick) {
                                  setState(() {
                                    isLogsClick = false;
                                  });
                                } else {
                                  if (isPLClick) {
                                    setState(() {
                                      isPLClick = false;
                                      isLogsClick = true;
                                    });
                                  } else {
                                    setState(() {
                                      isLogsClick = true;
                                    });
                                  }
                                }
                              },
                            ),
                            Container(
                              alignment: Alignment.center,
                              child: IconButton(
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return SimpleDialog(
                                          contentPadding: EdgeInsets.fromLTRB(
                                              50.0, 0.0, 24.0, 24.0),
                                          children: [
                                            setupAlertDialoadContainer()
                                          ],
                                        );
                                      });
                                },
                                iconSize: 30,
                                icon: Icon(Icons.arrow_drop_down),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 8),
                        height: MediaQuery.of(context).size.height / 20,
                        child: RaisedButton(
                          child: Text("SELL"),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ),
                //ToDo to add Tab2 and log here
                isShowTimeSetting ? Container() :_Tab2Layout(),
                isShowTimeSetting ? Container(): Container(
                  height: 40,
                  width: width,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 8, right: 8, bottom: 5, top: 5),
                    child: RaisedButton(
                      onPressed: () {
                        if (isPLClick) {
                          setState(() {
                            isPLClick = false;
                          });
                        } else if (isLogsClick) {
                          setState(() {
                            isPLClick = true;
                            isLogsClick = false;
                          });
                        } else {
                          setState(() {
                            isPLClick = true;
                          });
                        }
                      },
                      child: Text("P/L"),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  Widget setupAlertDialoadContainer() {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      width: 100.0,
      height: 250.0,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            onTap: () {
              Navigator.of(context).pop();
              setState(() {
                logs = '0.' + index.toString();
              });
            },
            title: Text('0.' + index.toString()),
          );
        },
      ),
    );
  }

  Widget _pointLostBottomLayout(){
    if(isShowTimeSetting){
      /*return Visibility(
        child: ,
      )*/
    }

  }
  Widget _Tab2Layout() {
    if (isPLClick && !isLogsClick) {
      return Visibility(
        child: _Tab2WidgetLayout(),
        visible: true,
      );
    } else if (isLogsClick && !isPLClick) {
      return Visibility(
        child: _logsLayout(),
        visible: true,
      );
    } else {
      return Visibility(
        visible: false,
        child: Container(),
      );
    }
  }

  Widget _Tab2WidgetLayout() {
    return Container(
        padding: EdgeInsets.only(left: 5, right: 5),
        color: Colors.white,
        height: 260,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: RaisedButton(
                onPressed: () {},
                child: Text('Deposit/ Margin/ Rate of Maintance Margin',
                    style: TextStyle(fontSize: 15)),
              ),
            ),
            NotExistPositionList(),
          ],
        ));
  }

  Widget _logsLayout() {
    return Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        alignment: Alignment.center,
        child: _logsInsertView());
  }

  Widget _logsInsertView() {
    return Container(
      width: 200,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [_KeyButton('1'), _KeyButton('2'), _KeyButton('3')],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [_KeyButton('4'), _KeyButton('5'), _KeyButton('6')],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [_KeyButton('7'), _KeyButton('8'), _KeyButton('9')],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [_KeyButton('.'), _KeyButton('0'), _KeyButton('C')],
          ),
        ],
      ),
    );
  }

  isCheckFirst() {
    if (logs.toString() == '0.0' || logs.toString() == 'logs') {
      setState(() {
        isFirstTime = true;
      });
    } else {
      setState(() {
        isFirstTime = false;
      });
    }
  }

  isClearButton(String value) {
    if (value == "C") {
      setState(() {
        isClear = true;
      });
    } else {
      setState(() {
        isClear = false;
      });
    }
  }

  Widget _KeyButton(String value) {
    return Container(
      width: 200 / 3,
      height: 50,
      child: RaisedButton(
        onPressed: () {
          isClearButton(value);
          if (!isClear) {
            isCheckFirst();
            if (isFirstTime) {
              setState(() {
                logs = value;
              });
            } else {
              setState(() {
                if (logs.length > 3) {
                  setState(() {
                    logs = logs;
                  });
                } else {
                  logs = logs.toString() + value;
                }
              });
            }
          } else {
            setState(() {
              logs = '0.0';
            });
          }
        },
        child: Text(value),
      ),
    );
  }

  Widget ChartEventList(){
    final double categoryHeight = MediaQuery.of(context).size.height * 0.30 - 50;
   return Container(
      height: 50.0,

      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (BuildContext context, int index){
            return
              Container(
                margin: EdgeInsets.only(bottom: 5, left: 5, top: 5),
                height: 40,
                child: Container(
                  alignment: Alignment.center,
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RaisedButton(
                        color: Colors.deepPurple,
                        onPressed: (){
                          print('Show Timer setting');
                          if(isShowTimeSetting){
                            setState(() {
                              isShowTimeSetting = false;
                            });
                          } else {
                            setState(() {
                              isShowTimeSetting = true;
                            });
                          }

                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),

                        ),
                        child: Text('Event ${index+1}',style: TextStyle(color: Colors.white),),
                      )
                  ),
                ),
              );
          }),
    );
  }
}

class BottomSheet extends StatefulWidget {
  _BottomSheetState createState() => _BottomSheetState();
}

class _BottomSheetState extends State<BottomSheet> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(20)),
      child:
      Container(
        color: Colors.white,
        width: width,
        height: height/3+20 ,
        //height: (height / 3) * 2,// for timer setting
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
             Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: width / 6,
                    child: RaisedButton(
                      onPressed: () {},
                      child: Text(
                        'BUY \nLimit',
                        style: TextStyle(fontSize: 10),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: width / 6,
                    child: RaisedButton(
                      onPressed: () {},
                      child: Text(
                        'SELL \nLimit',
                        style: TextStyle(fontSize: 10),
                      ),
                    ),
                  ),
                   SizedBox(
                    width: width/8,
                  ),
                  SizedBox(
                    width: width / 6,
                    child: RaisedButton(
                      onPressed: () {},
                      child: Text(
                        'BUY \nStop',
                        style: TextStyle(fontSize: 10),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: width / 6,
                    child: RaisedButton(
                      onPressed: () {},
                      child: Text(
                        'SELL \nStop',
                        style: TextStyle(fontSize: 10),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
class TimerSettingDrawer extends StatefulWidget {
  TimerSettingDrawerState createState() => TimerSettingDrawerState();
}

class TimerSettingDrawerState extends State<TimerSettingDrawer> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(20)),
      child:
      Container(
        color: Colors.white,
        width: width,
        //height: height/3+20 ,
        height: (height / 3) * 2,// for timer setting
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
              TimerSetting(),
            ],
          ),
        ),
      ),
    );
  }
}
