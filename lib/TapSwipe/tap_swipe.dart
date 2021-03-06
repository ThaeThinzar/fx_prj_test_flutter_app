import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class TapSwipeTest extends StatefulWidget {
  _TapSwipeTestState createState() => _TapSwipeTestState();
}
class _TapSwipeTestState extends State<TapSwipeTest>{
  int _value =1;
  final double _initFabHeight = 120.0;
  double _fabHeight;
  double _panelHeightOpen;
  double _panelHeightClosed = 95.0;
  @override
  void initState() {
    super.initState();
    _fabHeight = _initFabHeight;
  }
  @override

  Widget build(BuildContext context){
    _panelHeightOpen = MediaQuery.of(context).size.height * .80;

    return Material(
      child: Stack(
        alignment:Alignment.topCenter,
        children: <Widget>[
          SlidingUpPanel(
            maxHeight: 400,
            minHeight: _panelHeightClosed,
            parallaxEnabled: false,
            parallaxOffset: .5,
            body: _body(),
            panelBuilder: (sc) => _panel(sc),
            borderRadius: BorderRadius.only(topLeft: Radius.circular(18.0), topRight: Radius.circular(18.0)),
            onPanelSlide: (double pos) => setState((){
              _fabHeight = pos * (_panelHeightOpen - _panelHeightClosed) + _initFabHeight;
            }),
          ),
          Container(
              height:MediaQuery.of(context).size.height/18,
              margin:EdgeInsets.only(left:8,right:8,top:5),
              width:double.infinity,
              child:RaisedButton(
                  onPressed: (){

                  },
                  child:Text('P/L')
              )
          ),
        ],
      ),
    );
  }
  Widget _body(){
    return Center(

      child: RaisedButton(
        child:Text("hello")
      )
    );
  }
  Widget _panel(ScrollController sc){
    return MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: ListView(
          controller: sc,
          children: <Widget>[
            SizedBox(height: 12.0,),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 30,
                  height: 3,
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.all(Radius.circular(12.0))
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                   Container(
                     margin:EdgeInsets.only(left:8),
                     height:MediaQuery.of(context).size.height/20,
                     child: RaisedButton(

                       child: Text("BUY"),
                       onPressed: (){
                       },
                     ),
                   ),
                    SizedBox(
                      height:20,
                      child:  DropdownButton(
                          value: 1,
                          items:[
                            DropdownMenuItem(child: Text("logs"), value: 1),
                            DropdownMenuItem(child: Text("logs2"), value: 3),
                            DropdownMenuItem(child: Text("logs3"), value: 2),
                          ],
                          onChanged:(value){
                            setState(() {
                              _value = value;
                            });
                          }

                      ),
                    ),
                    Container(
                      margin:EdgeInsets.only(left:8),
                      height:MediaQuery.of(context).size.height/20,
                      child: RaisedButton(
                        child: Text("SELL"),
                        onPressed: (){
                        },
                      ),
                    ),
                  ],
                ),
                Container(
                    height:MediaQuery.of(context).size.height/18,
                  margin:EdgeInsets.only(left:8,right:8,top:5),
                  width:double.infinity,
                  child:RaisedButton(
                    onPressed: (){

                    },
                    child:Text('P/L')
                  )
                ),
              ],
            ),

            SizedBox(height: 36.0,),

            Container(
              padding: const EdgeInsets.only(left: 24.0, right: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[

                  Text("Images", style: TextStyle(fontWeight: FontWeight.w600,)),
                  SizedBox(height: 12.0,),
                ],
              ),
            ),

            SizedBox(height: 36.0,),

            Container(
              padding: const EdgeInsets.only(left: 24.0, right: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("About", style: TextStyle(fontWeight: FontWeight.w600,)),

                  SizedBox(height: 12.0,),

                  Text(
                    """Pittsburgh is a city in the state of Pennsylvania in the United States, and is the county seat of Allegheny County. A population of about 302,407 (2018) residents live within the city limits, making it the 66th-largest city in the U.S. The metropolitan population of 2,324,743 is the largest in both the Ohio Valley and Appalachia, the second-largest in Pennsylvania (behind Philadelphia), and the 27th-largest in the U.S.\n\nPittsburgh is located in the southwest of the state, at the confluence of the Allegheny, Monongahela, and Ohio rivers. Pittsburgh is known both as "the Steel City" for its more than 300 steel-related businesses and as the "City of Bridges" for its 446 bridges. The city features 30 skyscrapers, two inclined railways, a pre-revolutionary fortification and the Point State Park at the confluence of the rivers. The city developed as a vital link of the Atlantic coast and Midwest, as the mineral-rich Allegheny Mountains made the area coveted by the French and British empires, Virginians, Whiskey Rebels, and Civil War raiders.\n\nAside from steel, Pittsburgh has led in manufacturing of aluminum, glass, shipbuilding, petroleum, foods, sports, transportation, computing, autos, and electronics. For part of the 20th century, Pittsburgh was behind only New York City and Chicago in corporate headquarters employment; it had the most U.S. stockholders per capita. Deindustrialization in the 1970s and 80s laid off area blue-collar workers as steel and other heavy industries declined, and thousands of downtown white-collar workers also lost jobs when several Pittsburgh-based companies moved out. The population dropped from a peak of 675,000 in 1950 to 370,000 in 1990. However, this rich industrial history left the area with renowned museums, medical centers, parks, research centers, and a diverse cultural district.\n\nAfter the deindustrialization of the mid-20th century, Pittsburgh has transformed into a hub for the health care, education, and technology industries. Pittsburgh is a leader in the health care sector as the home to large medical providers such as University of Pittsburgh Medical Center (UPMC). The area is home to 68 colleges and universities, including research and development leaders Carnegie Mellon University and the University of Pittsburgh. Google, Apple Inc., Bosch, Facebook, Uber, Nokia, Autodesk, Amazon, Microsoft and IBM are among 1,600 technology firms generating \$20.7 billion in annual Pittsburgh payrolls. The area has served as the long-time federal agency headquarters for cyber defense, software engineering, robotics, energy research and the nuclear navy. The nation's eighth-largest bank, eight Fortune 500 companies, and six of the top 300 U.S. law firms make their global headquarters in the area, while RAND Corporation (RAND), BNY Mellon, Nova, FedEx, Bayer, and the National Institute for Occupational Safety and Health (NIOSH) have regional bases that helped Pittsburgh become the sixth-best area for U.S. job growth.
                  """,
                    softWrap: true,
                  ),
                ],
              ),
            ),

            SizedBox(height: 24,),
          ],
        )
    );
  }

  /*Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text(' TapSwipe Example'
      ) ,),
      *//*body: SlidingUpPanel(
        panel: Center(
          child: Text("This is the sliding Widget"),
        ),
        body: Center(

          child: Text('Hello world'),
        ),
      )*//*
      body: Stack(
        children: [
          Center(child: Text("This is the Widget behind the sliding panel"),),
          SlidingUpPanel(
            color:Colors.white,
            collapsed:Container(
              height: 200,
              child: Column(
                children: [
                  Icon(Icons.expand_more, color: Colors.grey,size:25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      RaisedButton(
                        child: Text("BUY"),
                        onPressed: (){

                        },
                      ),
                      DropdownButton(
                        value: 1,
                        items:[
                          DropdownMenuItem(child: Text("logs"), value: 1),
                          DropdownMenuItem(child: Text("logs2"), value: 3),
                          DropdownMenuItem(child: Text("logs3"), value: 2),
                          ],
                          onChanged:(value){
                          setState(() {
                            _value = value;
                          });
                        }

                      ),
                      RaisedButton(
                        child: Text("SELL"),
                        onPressed: (){

                        },
                      ),

                    ],
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: RaisedButton(
                      child: Text("P/L"),
                    ),
                  )
                ],
              )
            ),
            panel: Center(
              child: Text('This is widget from sliding'),
            ),
          )
        ],
      ),
    );
  }*/

}