import 'package:flutter/material.dart';
import 'package:swipedetector/swipedetector.dart';
class HelpPage extends StatefulWidget {
  _HelpPageState createState() => _HelpPageState();
}
class _HelpPageState extends State<HelpPage>{
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  String _swipeDirection = "";
  Widget build(BuildContext context){

   return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          child: Row(
            children: <Widget>[
              Expanded(
                child:
                SwipeDetector(
                  child: Card(
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      padding: EdgeInsets.only(
                        top: 80.0,
                        bottom: 80.0,
                        left: 16.0,
                        right: 16.0,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          RaisedButton(
                            onPressed: (){
                              Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                    pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
                                      return SecondSlidePage();
                                    },
                                    transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
                                      return SlideTransition(
                                        position: new Tween<Offset>(
                                          begin: const Offset(0.0, -1.0),
                                          end: Offset.zero,
                                        ).animate(animation),
                                        child: new SlideTransition(
                                          position: new Tween<Offset>(
                                            begin: Offset.zero,
                                            end: const Offset(0.0, -1.0),
                                          ).animate(secondaryAnimation),
                                          child: child,
                                        ),
                                      );
                                    },
                                  )
                              );
                            },
                            child: Text('Help'),
                          ),
                          Text(
                            '$_swipeDirection',
                            style: TextStyle(),
                          ),
                        ],
                      ),
                    ),
                  ),
                  onSwipeUp: () {
                    /*Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context)=> SecondSlidePage())
                    );*/
                    setState(() {
                      _swipeDirection = "Swipe Up";
                    });
                  },
                  onSwipeDown: () {
                    Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
                            return SecondSlidePage();
                          },
                          transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
                            return SlideTransition(
                              position: new Tween<Offset>(
                                begin: const Offset(0.0, -1.0),
                                end: Offset.zero,
                              ).animate(animation),
                              child: new SlideTransition(
                                position: new Tween<Offset>(
                                  begin: Offset.zero,
                                  end: const Offset(0.0, -1.0),
                                ).animate(secondaryAnimation),
                                child: child,
                              ),
                            );
                          },
                        )
                    );
                    setState(() {
                      _swipeDirection = "Swipe Down";
                    });
                  },
                  onSwipeLeft: () {
                    setState(() {
                      _swipeDirection = "Swipe Left";
                    });
                  },
                  onSwipeRight: () {
                    setState(() {
                      _swipeDirection = "Swipe Right";
                    });
                  },
                  swipeConfiguration: SwipeConfiguration(
                      verticalSwipeMinVelocity: 100.0,
                      verticalSwipeMinDisplacement: 50.0,
                      verticalSwipeMaxWidthThreshold:100.0,
                      horizontalSwipeMaxHeightThreshold: 50.0,
                      horizontalSwipeMinDisplacement:50.0,
                      horizontalSwipeMinVelocity: 200.0),
                ),
              )
            ],
          ),
        ),
      ),
    );

  }


}

class SlideFirstPage extends StatefulWidget{
  _SlideFirstPageState createState() => _SlideFirstPageState();
}
class _SlideFirstPageState extends State<SlideFirstPage>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:  Container(
          child: RaisedButton(
            onPressed: (){
              Navigator.push(context, SlideRightRoute(page: SecondSlidePage()));
            },
            child: Text('Help'),
          ),
        ),
      ),
    );
  }

}

class SecondSlidePage extends StatefulWidget{
  _SecondSlidePageState createState() => _SecondSlidePageState();
}
class _SecondSlidePageState extends State<SecondSlidePage>{
  String _swipeDirection = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: new Text('Help Page'),

          leading:  new IconButton(
            icon: new Icon(Icons.close),
          onPressed: () => Navigator.of(context).pop(null),
        ),
        ),
      backgroundColor: Colors.orangeAccent,
      body: SwipeDetector(
        onSwipeUp: () {
          Navigator.pop(context);
          setState(() {
            _swipeDirection = "Swipe Up";
          });
        },
        onSwipeDown: () {
         // Navigator.pop(context);
          setState(() {
            _swipeDirection = "Swipe Down";
          });
        },
        onSwipeLeft: () {
          setState(() {
            _swipeDirection = "Swipe Left";
          });
        },
        onSwipeRight: () {
          setState(() {
            _swipeDirection = "Swipe Right";
          });

        },
        swipeConfiguration: SwipeConfiguration(
            verticalSwipeMinVelocity: 100.0,
            verticalSwipeMinDisplacement: 50.0,
            verticalSwipeMaxWidthThreshold:100.0,
            horizontalSwipeMaxHeightThreshold: 50.0,
            horizontalSwipeMinDisplacement:50.0,
            horizontalSwipeMinVelocity: 200.0),
        child: Container(
          color: Colors.orangeAccent,
          child:   Padding(
            padding: EdgeInsets.only(left: 20,right: 20),
            child:
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image(
                    image: AssetImage(
                      'assets/images/onboard2.png',
                    ),
                    height: 300,
                    width: 300,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text('hello this is testing for tutorial app how to use 2',style: TextStyle(fontSize: 20),),
                SizedBox(height: 15,),
                Text('hello this is testing for tutorial app how to use 2',style: TextStyle(fontSize: 12),),
              ],
            ),
          ),
          /*    Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Welcome to Help Page'),
              RaisedButton(
                child: Text('Close'),
                onPressed: (){
                  Navigator.of(context).pop();
                },
              )
            ],
          ),
        )*/
        ),
      )

    );
  }

}


class SlideRightRoute extends PageRouteBuilder {
  final Widget page;
  SlideRightRoute({this.page})
      : super(
    pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        ) => page,
    transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
        ) =>
        SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, -1),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        ),
  );
}