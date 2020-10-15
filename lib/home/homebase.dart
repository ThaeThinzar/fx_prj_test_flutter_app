import 'package:flutter/material.dart';
import 'package:fx_prj_test_flutter_app/home/home_page.dart';
import 'package:fx_prj_test_flutter_app/library/library_screen.dart';
import 'package:fx_prj_test_flutter_app/main.dart';
import 'package:fx_prj_test_flutter_app/mypage/my_page.dart';

class HomeBase extends StatefulWidget {
  _HomeBaseState createState() => _HomeBaseState();
}
class _HomeBaseState extends State<HomeBase> {
  int _currentTab = 0;
  final List<Widget> _childern = [
    HomePage(),
    LibraryScreen(),
    MyPageScreen()
  ];
  void onTabTapped(int index) {
    setState(() {
      _currentTab = index;
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("RTL option is : $isRTLlayout");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _childern[_currentTab],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black87,
        onTap:onTabTapped,
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home, color: _currentTab == 0 ? Colors.blue : Colors.grey,),
            title: new Text('トップ', style: TextStyle(color: _currentTab == 0 ? Colors.blue : Colors.grey),),
          ),
          BottomNavigationBarItem(
            icon: new ImageIcon(AssetImage("assets/images/library_ic.png"),
                  color: _currentTab == 1? Colors.blue : Colors.grey,
              ),
            title: new Text('ライブラリー', style: TextStyle(color: _currentTab == 1 ? Colors.blue : Colors.grey),),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person,color: _currentTab == 2 ? Colors.blue : Colors.grey,),
              title: Text('マイベージ',style: TextStyle(color: _currentTab == 2 ? Colors.blue : Colors.grey),)
          )
        ],
      ),
    );
  }

}