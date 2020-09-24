import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fx_prj_test_flutter_app/login_screen/login_screen.dart';
import 'package:fx_prj_test_flutter_app/profile/profile_user.dart';
import 'package:google_sign_in/google_sign_in.dart';

class OnboardScreen extends StatefulWidget{
  OnboardScreenState createState() => OnboardScreenState();
}
class OnboardScreenState extends State<OnboardScreen>{
  final int _numPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  GoogleSignIn googleSignIn = GoogleSignIn(clientId: "619033735551-plgl572jufnllvoh011e6cspl14sj8bf.apps.googleusercontent.com");
  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }
  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: 8.0,
      width: isActive ? 24.0 : 16.0,
      decoration: BoxDecoration(
        color: isActive ? Colors.white : Color(0xFF7001D3),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
  void checkSignInStatus() async{
    await Future.delayed(Duration(seconds: 2));

    bool isSignedIn = await googleSignIn.isSignedIn();
    if(isSignedIn){
      print('User already Signed In');
      Navigator.push(context, MaterialPageRoute(builder: (context) =>ProfileUser() ));
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );

    }
  }
  @override
  void initState() {
   // checkSignInStatus();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child:  Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.1, 0.4, 0.7, 0.9],
                colors: [
                  Color(0xFF3594DD),
                  Color(0xFF4563DB),
                  Color(0xFF5036D5),
                  Color(0xFF5B16D0),
                ],
              )
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  alignment: Alignment.centerRight,
                  child: FlatButton(
                    onPressed: (){
                      print('skipppp');
                    },
                    child: Text("Skip", style: TextStyle(color: Colors.white,fontSize: 20.0),),
                  ),
                ),
                Container(
                  height: 500,
                  child: PageView(
                    physics: ClampingScrollPhysics(),
                    controller: _pageController,
                    onPageChanged: (int page){
                      setState(() {
                        _currentPage = page;
                      });
                    },
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 20,right: 20),
                        child:   Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Image(
                                image: AssetImage(
                                  'assets/images/onboard1.png',
                                ),
                                height: 300,
                                width: 300,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text('hello this is testing for tutorial app how to use 1',style: TextStyle(fontSize: 20),),
                            SizedBox(height: 15,),
                            Text('hello this is testing for tutorial app how to use 1',style: TextStyle(fontSize: 12),),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20,right: 20),
                        child:   Column(
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
                      Padding(
                        padding: EdgeInsets.only(left: 20,right: 20),
                        child:   Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Image(
                                image: AssetImage(
                                  'assets/images/onboard3.png',
                                ),
                                height: 300,
                                width: 300,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text('hello this is testing for tutorial app how to use 3',style: TextStyle(fontSize: 20),),
                            SizedBox(height: 15,),
                            Text('hello this is testing for tutorial app how to use 3',style: TextStyle(fontSize: 12),),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _buildPageIndicator(),
                ),
                _currentPage != _numPages - 1 ? Expanded(child: Align(
                  alignment: FractionalOffset.bottomRight,
                child: FlatButton(
                  onPressed: (){
                    _pageController.nextPage(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.ease,
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                     mainAxisSize: MainAxisSize.min,
                     children: [
                       Text('Next', style: TextStyle(color: Colors.white, fontSize: 22),),
                       SizedBox(width: 10,),
                       Icon(Icons.navigate_next,color: Colors.white,size: 20.0,
                       )
                     ],
                  ),
                ),),)
                    : Text('')
              ],
            ),
          ),
        ),
      ),
      bottomSheet: _currentPage == _numPages - 1
          ? Container(
        height: 50.0,
        width: double.infinity,
        color: Colors.white,
        child: GestureDetector(
          onTap: (){
            /*Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginScreen()),
            );*/
            checkSignInStatus();
          },
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(bottom: 10.0),
              child: Text(
                'Get started',
                style: TextStyle(
                  color: Color(0xFF5B16D0),
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      )
          : Text(''),
    );
  }

}