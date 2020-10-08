import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class SlidableListItem extends StatefulWidget {
  @override
  _SlidableListItemState createState() => _SlidableListItemState();
}

class _SlidableListItemState extends State<SlidableListItem> {
  String logs = "logs";
  bool isFirstTime = false;
  bool isClear = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(title: Text('Slidable List '),),
      body: Column(
        children: [
          Container(

            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  child: Text(logs),
                  onTap: (){
                    print('Tab on Log');
                  },
                ),
                Container(
                  alignment: Alignment.center,
                  child: IconButton(
                    onPressed: (){
                    //TODO to show dialog
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return SimpleDialog(
                                contentPadding: EdgeInsets.fromLTRB(50.0, 0.0, 24.0, 24.0),
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
          _logsInsertView(),
        ],
      )
     /* Container(
        height: 200,
        margin: EdgeInsets.all(10),
        child: ListView.builder(
            itemCount: 10,
            itemExtent: 50,
            itemBuilder: (context,index){
              return Slidable(key: ValueKey(index),
                actionPane: SlidableDrawerActionPane(),
                secondaryActions: [
                  Container(
                    color: Colors.grey,
                    height: 40,
                    child: FlatButton(
                      child: Text('編集'),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0.0),
                            side: BorderSide(color: Colors.black)
                        ),
                      onPressed: () {

                      }
                    ),
                  ),
                  Container(
                    color: Colors.grey,
                    height: 40,
                    child: FlatButton(
                        child: Text('決済'),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0.0),
                            side: BorderSide(color: Colors.black)
                        ),
                        onPressed: () {

                        }
                    ),
                  ),
                ],
                dismissal: SlidableDismissal(child: SlidableDrawerDismissal()),
                child: Container(
                  child:Card(
                    color: Colors.grey,
                    child:  ListTile(
                      contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
                      dense:true,
                      title: Center(child: Text('Not Exit Position $index',style: TextStyle(fontSize: 12),textAlign: TextAlign.center,)),
                    ),
                  )
                ),
              );
            }),
      ),*/

    );

  }

  Widget setupAlertDialoadContainer() {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return    Container(
        width: 100.0,
        height: 250.0,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            onTap: (){
              Navigator.of(context).pop();
              setState(() {
                logs = '0.'+ index.toString();
              });
            },
            title: Text('0.'+index.toString()),
          );
        },
      ),
    );
  }
  Widget _logsInsertView(){
    return Container(

      width: 200,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _KeyButton('1'),
              _KeyButton('2'),
              _KeyButton('3')
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _KeyButton('4'),
              _KeyButton('5'),
              _KeyButton('6')
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _KeyButton('7'),
              _KeyButton('8'),
              _KeyButton('9')
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _KeyButton('.'),
              _KeyButton('0'),
              _KeyButton('C')
            ],
          ),
        ],
      ),
    );
  }
   isCheckFirst(){
    if(logs.toString() == '0.0'){
      setState(() {
        isFirstTime = true;
      });
    } else{
      setState(() {
        isFirstTime = false;
      });
    }
  }

  isClearButton(String value){
    if(value == "C"){
      setState(() {
        isClear = true;
      });
    } else {
      setState(() {
        isClear = false;
      });
    }
  }
  Widget _KeyButton(String value){
    return Container(
      width: 200/3,
      height: 50,
      child: RaisedButton(
        onPressed: (){
          isClearButton(value);
          if(!isClear){
            isCheckFirst();
            if(isFirstTime){
              setState(() {
                logs = value;
              });
            } else {
             setState(() {
               if(logs.length> 3){
                 setState(() {
                   logs = logs;
                 });
               }else {
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
}


class NotExistPositionList extends StatefulWidget{
  _NotExistPositionListState createState() => _NotExistPositionListState();
}
class _NotExistPositionListState extends State<NotExistPositionList>{
  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 200,
      child: ListView.builder(
          padding: EdgeInsets.all(0.0), // Add to remove a gap above the list view
          itemCount: 5,
          itemExtent: 50,
          itemBuilder: (context,index){
            return Slidable(key: ValueKey(index),
              actionPane: SlidableDrawerActionPane(),
              secondaryActions: [
                Container(
                  color: Colors.grey,
                  height: 40,
                  child: FlatButton(
                      child: Text('編集'),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0.0),
                          side: BorderSide(color: Colors.black)
                      ),
                      onPressed: () {

                      }
                  ),
                ),
                Container(
                  color: Colors.grey,
                  height: 40,
                  child: FlatButton(
                      child: Text('決済'),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0.0),
                          side: BorderSide(color: Colors.black)
                      ),
                      onPressed: () {

                      }
                  ),
                ),
              ],
              dismissal: SlidableDismissal(child: SlidableDrawerDismissal()),
              child: Container(
                  child:Card(
                    color: Colors.grey,
                    child:  ListTile(
                      contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
                      dense:true,
                      title: Center(child: Text('Not Exit Position $index',style: TextStyle(fontSize: 12),textAlign: TextAlign.center,)),
                    ),
                  )
              ),
            );
          }),
    );
  }

}