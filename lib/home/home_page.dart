import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fx_prj_test_flutter_app/Gesture/MyGesturePage.dart';
import 'package:fx_prj_test_flutter_app/data/Constants.dart';
import 'package:fx_prj_test_flutter_app/data/top_data.dart';
import 'package:fx_prj_test_flutter_app/rating_review_app/custom_dialog_rating.dart';

class HomePage extends StatefulWidget {
  _HomePageState createState()=> _HomePageState();
}
class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    List<TopData> topDataList = TopData.getTopDataList();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black87,
        body:
        Column(
          children: [
            Container(
              margin: EdgeInsets.only(left: 16, right: 16),
              padding: EdgeInsets.only(top: 5, bottom: 5),
              width: MediaQuery.of(context).size.width,
              height: 25,
              color: Colors.black,
              child: Text(' Titles of Category', textAlign: TextAlign.center,style: TextStyle(color: Colors.white, fontSize: 12),),
            ),
            CategoriesScroller(),
            Container(
              margin: EdgeInsets.only(left: 16, right: 16),
              width: MediaQuery.of(context).size.width,
              child: RaisedButton(
                color:Colors.white24,
                child: Text("Review The app", style: TextStyle(color: Colors.white),),
                onPressed: (){
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => CustomDialogRating(
                      title: "Review The App",
                      description:
                      "How about using this app?\nShare your feedback and help us to improve.",
                      buttonText: "Cancel",
                      image: Image(image: AssetImage("assets/images/review.png"),),
                    ),
                  );
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 16, right: 16),
              width: MediaQuery.of(context).size.width,
              height: 20,
              color: Colors.blueGrey,
              child: Text(' イベント', style: TextStyle(color: Colors.white),),
            ),
           Expanded(
             child:  CustomScrollView(
               slivers: [
                 SliverPadding(
                   padding: EdgeInsets.only(left: 8,bottom: 8,right: 8),
                   sliver: SliverFixedExtentList(

                     itemExtent: 150,
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
        )

      ),
    );
  }

}

class CategoriesScroller extends StatelessWidget {
  const CategoriesScroller();

  @override
  Widget build(BuildContext context) {
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
     /* SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child:
      );*/
     /* Container(
        color: Colors.black45,
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: FittedBox(
          fit: BoxFit.fill,
          alignment: Alignment.topCenter,
          child: Row(
            children: <Widget>[
              Container(
                width: 150,
                margin: EdgeInsets.only(right: 20),
                height: categoryHeight,
                decoration: BoxDecoration(color: Colors.orange.shade400, borderRadius: BorderRadius.all(Radius.circular(20.0))),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Most\nFavorites",
                        style: TextStyle(fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: 150,
                margin: EdgeInsets.only(right: 20),
                height: categoryHeight,
                decoration: BoxDecoration(color: Colors.blue.shade400, borderRadius: BorderRadius.all(Radius.circular(20.0))),
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Newest",
                          style: TextStyle(fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "20 Items",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                width: 150,
                margin: EdgeInsets.only(right: 20),
                height: categoryHeight,
                decoration: BoxDecoration(color: Colors.lightBlueAccent.shade400, borderRadius: BorderRadius.all(Radius.circular(20.0))),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Super\nSaving",
                        style: TextStyle(fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "20 Items",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),*//*
    );*/
  }
}