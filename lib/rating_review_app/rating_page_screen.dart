import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fx_prj_test_flutter_app/home/home_page.dart';

class RatingPageScreen extends StatefulWidget{
  RatingPageScreenState createState()=> RatingPageScreenState();

}
class RatingPageScreenState extends State<RatingPageScreen>{
  var rating = 0.0;
  TextEditingController _commentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(title: Text('Rate your App'),),
      body:
      Container(
        padding: EdgeInsets.all(16),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('Please Rate at Rating Bar',style: TextStyle(color: Colors.amber, fontSize: 16,fontWeight: FontWeight.bold),),
            RatingBar(
              initialRating: 0,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rr) {
                setState(() {
                  rating = rr;
                });
                print('rating$rating');
              },
            ),
            Container(
                margin: EdgeInsets.only(top: 16,bottom: 8),
                width: 300,
                child: TextField(
                  controller: _commentController,
                  keyboardType: TextInputType.multiline,
                  maxLines: 5,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Comment',
                    alignLabelWithHint: true,
                    hintText: 'Comment',
                  ),
                  autofocus: false,
                ),
            ),
            Container(
              padding: EdgeInsets.all(16),
              margin: EdgeInsets.only(left: 8,right: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RaisedButton(
                    onPressed: (){
                      Navigator.of(context).pop();
                    },
                    child: Text("Cancel"),
                  ),
                  RaisedButton(
                    onPressed: (){
                      if(_commentController.text.isEmpty && rating == 0.0){
                        Fluttertoast.showToast(msg: "You don't fill any rating option. \n if don't give rating, click cancel to go back previous page.", backgroundColor: Colors.orange, textColor: Colors.white,toastLength: Toast.LENGTH_SHORT);
                      } else {
                        _showMyDialog();
                      }

                    },
                    child: Text('Send Feed Back'),
                  )
                ],
              ),
            )
          ],
        )
      ),
    );
  }
  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Send FeedBack!'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Would you like to approve of this message?',style: TextStyle(color: Colors.amber, fontSize: 15,fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                Text('You rated $rating star(s).'),
                Text('${_commentController.text}'),

              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text('Approve'),
              onPressed: () {
                Fluttertoast.showToast(msg: "Your rating successful", backgroundColor: Colors.green, textColor: Colors.white,toastLength: Toast.LENGTH_SHORT);
                Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomePage()));

              },
            ),
          ],
        );
      },
    );
  }
}