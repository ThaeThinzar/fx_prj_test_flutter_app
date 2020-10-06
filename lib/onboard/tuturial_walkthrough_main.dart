import 'package:feature_discovery/feature_discovery.dart';
import 'package:flutter/material.dart';
import 'package:fx_prj_test_flutter_app/onboard/InitialPage.dart';
import 'package:fx_prj_test_flutter_app/onboard/feature_discovery_walkthrough.dart';
import 'package:fx_prj_test_flutter_app/onboard/onboard_page.dart';
import 'package:fx_prj_test_flutter_app/onboard/walkthought_feature.dart';

import 'friend_list.dart';

class TutorialWalkThroughMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         title: Text('Tutorial WalkThough Testing'),
       ),
       body: Center(
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             RaisedButton(
               onPressed: (){
                 Navigator.push(context, MaterialPageRoute(
                   builder: (context) => OnboardScreen()
                 ));
               },
               child: Text('Onboard Walkthough'),
             ),
             RaisedButton(
               onPressed: (){
                 Navigator.push(context, MaterialPageRoute(
                     builder: (context) =>  FeatureDiscovery(
                        recordStepsInSharedPreferences: false,
                        child: WalkThroughFeature(),
                 ),
                 ));
               },
               child: Text('Feature Discovery library'),
             ),
             RaisedButton(
               onPressed: (){
                 Navigator.push(context, MaterialPageRoute(
                   builder: (context) =>  FeatureDiscovery(
                     recordStepsInSharedPreferences: false,
                     child: BubbleShowDemo(),
                   ),
                 ));
               },
               child: Text('Bubble Show Case'),
             ),
             RaisedButton(
               onPressed: (){
                 Navigator.push(context, MaterialPageRoute(
                   builder: (context) =>  FeatureDiscovery(
                     recordStepsInSharedPreferences: false,
                     child: InitialPage(),
                   ),
                 ));
               },
               child: Text('Hight Light coach'),
             )
           ],
         ),
       ),
     );
  }

}