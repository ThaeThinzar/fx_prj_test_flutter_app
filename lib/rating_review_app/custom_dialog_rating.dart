import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fx_prj_test_flutter_app/data/Constants.dart';
import 'package:fx_prj_test_flutter_app/data/common_widget.dart';
import 'package:fx_prj_test_flutter_app/rating_review_app/rating_page_screen.dart';

class CustomDialogRating extends StatelessWidget {
  final String title, description, buttonText;
  final Image image;

  CustomDialogRating({
    @required this.title,
    @required this.description,
    @required this.buttonText,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }
  dialogContent(BuildContext context) {
    return Stack(
      children: <Widget>[
        Card(
            child: Container(
              margin: EdgeInsets.all(8),
              child: Column(
                mainAxisSize: MainAxisSize.min, // To make the card compact
                children: <Widget>[
                  Image(image: AssetImage("assets/images/review.png"),
                  width: 50,
                  height: 50,),
                  Container(
                    margin: EdgeInsets.all(8),
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    description,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(height: 24.0),
                  Align(
                    alignment: Alignment.center,
                    child: FlatButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => RatingPageScreen()));
                      },
                      child: Text("Yes,Please Rate for it"),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop(); // To close the dialog
                      },
                      child: Text(buttonText),
                    ),
                  ),
                ],
              ),
            ),
          ),
        
      ],
    );
  }
}
class Consts {
  Consts._();

  static const double padding = 16.0;
  static const double avatarRadius = 66.0;
}