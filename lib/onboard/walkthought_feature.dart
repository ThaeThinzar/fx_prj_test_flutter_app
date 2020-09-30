import 'package:feature_discovery/feature_discovery.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fx_prj_test_flutter_app/Gesture/MyGesturePage.dart';
import 'package:fx_prj_test_flutter_app/data/top_data.dart';
import 'package:fx_prj_test_flutter_app/onboard/feature_discovery_walkthrough.dart';
const String feature1 = 'feature1',
    feature2 = 'feature2',
    feature3 = 'feature3',
    feature4 = 'feature4',
    feature5 = 'feature5';


class WalkThroughFeature extends StatefulWidget {
  _WalkThroughFeatureState createState() => _WalkThroughFeatureState();
}
class _WalkThroughFeatureState extends State<WalkThroughFeature>{
  @override
  Widget build(BuildContext context) {
    var feature1OverflowMode = OverflowMode.clipContent;
    var feature1EnablePulsingAnimation = false;
    return Scaffold(
      appBar: AppBar(
        title: Text('Feature WalkThrough'),
        leading: StatefulBuilder(
          builder:
              (BuildContext context, void Function(void Function()) setState) =>
              DescribedFeatureOverlay(
                featureId: feature1,
                tapTarget: Icon(Icons.menu),
                backgroundColor: Colors.teal,
                title: const Text(
                    'Menu of the App!'),
                overflowMode: feature1OverflowMode,
                enablePulsingAnimation: feature1EnablePulsingAnimation,
                description: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                        'This is a menu and you can click the menu to see all function of the app.', style: TextStyle(fontSize: 22),),
                   /* FlatButton(
                        child: Text('Next Step',
                            style: Theme.of(context)
                                .textTheme
                                .button
                                .copyWith(color: Colors.white)),
                        onPressed: () => setState(() {
                          feature1EnablePulsingAnimation =
                          !feature1EnablePulsingAnimation;
                        })),*/

                  ],
                ),
                child: IconButton(
                  icon: Icon(Icons.menu),
                  onPressed: () {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      FeatureDiscovery.discoverFeatures(
                        context,
                        const <String>{
                          feature1,
                          feature2,
                        },
                      );
                    });
                  },
                ),
              ),
        ),
        actions: [
          DescribedFeatureOverlay(
            featureId: feature2,
            tapTarget: Icon(Icons.search),
            backgroundColor: Colors.green,
            title: const Text('Search your event'),
            description: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                    'Tap the button to search the events that you want to watch for forex chart', style: TextStyle(fontSize: 18),),
               /* FlatButton(
                  padding: const EdgeInsets.all(0),
                  child: Text('Understood',
                      style: Theme.of(context)
                          .textTheme
                          .button
                          .copyWith(color: Colors.white)),
                  onPressed: () async =>
                      FeatureDiscovery.completeCurrentStep(context),
                ),*/
               /* FlatButton(
                  padding: const EdgeInsets.all(8),
                  child: Text(' Dismiss',
                      style: Theme.of(context)
                          .textTheme
                          .button
                          .copyWith(color: Colors.white)),
                  onPressed: () => FeatureDiscovery.dismissAll(context),*/
                //),
              ],
            ),
            child: IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: ContentBody(),
      floatingActionButton: StatefulBuilder(
        builder:
            (BuildContext context, void Function(void Function()) setState) =>
            DescribedFeatureOverlay(
              featureId: feature4,
              tapTarget: Icon(Icons.add),
              backgroundColor: Colors.green,
              overflowMode: OverflowMode.extendBackground,
              title: const Text('Add Events'),
              description: Column(children: <Widget>[
                const Text(
                    'This is the button to add your events in your top page'),
              ]),
              child: FloatingActionButton(
                onPressed: () {},
                tooltip: 'Increment',
                child:  Icon(Icons.add),
              ),
            ),
      ),
    );
  }
}
class ContentBody extends StatefulWidget {
  _ContentBodyState createState() => _ContentBodyState();

}
class _ContentBodyState extends State<ContentBody> {
  GlobalKey<EnsureVisibleState> ensureKey;
  GlobalKey<EnsureVisibleState> ensureKey2;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ensureKey = GlobalKey<EnsureVisibleState>();
    ensureKey2 = GlobalKey<EnsureVisibleState>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FeatureDiscovery.discoverFeatures(
        context,
        const <String>{
          feature1,
          feature2,
          feature3,
          feature4,
          feature6

        },
      );
    });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
   return Stack(
     children: [
       SingleChildScrollView(
         child: Column(
           children: [
             DescribedFeatureOverlay(
               featureId: feature3,
               tapTarget:  Icon(Icons.arrow_forward_ios),
               backgroundColor: Colors.orangeAccent,
               title: const Text('Event! '),
               description: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: <Widget>[
                   const Text(
                     'This is Event. \n You can see detail of the event by clicking event', style: TextStyle(fontSize: 15),),
                 ],
               ),
               child: MyGesturePage( data:TopData(
                   playStyle: "プレイ調み",
                   eventNote: "#リーマンショック¥ドルをもう一度イベント5",
                   eventTitle: "リーマンシ",
                   eventTime: "イベント時間 2020/01/04 20:30",
                   imgUrl: 'assets/images/view5.jpg'),),
             ),
            Container(

              child:  MyGesturePage( data:TopData(
                  playStyle: "プレイ調み",
                  eventNote: "#リーマンショック ¥ドルリ1",
                  eventTitle: "リーマンショック¥ドルリーマンショックをもう一度イベント1",
                  eventTime: "イベント時間 2020/01/04 20:30",
                  imgUrl: 'assets/images/view1.jpg'),),
            ),
             Container(

               child:  MyGesturePage( data:TopData(
                   playStyle: "プレイ調み",
                   eventNote: "#リーマンショック ¥ドルリ1",
                   eventTitle: "リーマンショック¥ドルリーマンショックをもう一度イベント1",
                   eventTime: "イベント時間 2020/01/04 20:30",
                   imgUrl: 'assets/images/view2.jpg'),),
             ),
             StatefulBuilder(
               builder: (BuildContext context,
                   void Function(void Function()) setState) =>
                   DescribedFeatureOverlay(
                     barrierDismissible: false,
                     featureId: feature6,
                     tapTarget: RaisedButton(
                       child: Text("Start "),
                     ),
                     backgroundColor: Colors.green,
                     onComplete: () async {
                       print('Tapped tap target of $feature6.');
                       return true;
                     },
                     onOpen: () async {
                       WidgetsBinding.instance.addPostFrameCallback((_) {
                         ensureKey2.currentState.ensureVisible(
                             duration: const Duration(milliseconds: 600));
                       });
                       return true;
                     },
                     description: Column(children: <Widget>[
                       const Text(
                           'Click this Start button to get started application.'),
                     ]),
                     overflowMode: OverflowMode.wrapBackground,
                     child: EnsureVisible(
                       key: ensureKey2,
                       child: RaisedButton(
                         child: Text("Start"),
                       )
                     ),
                   ),
             ),
           ],
         ),
       )
     ],
   );
  }

}