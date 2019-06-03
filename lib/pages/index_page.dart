import 'package:flutter/material.dart';
import './fourth_page.dart';
import './home_page.dart';
import './second_page.dart';
import './third_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RootScene extends StatefulWidget {
  @override
  _RootSceneState createState() => _RootSceneState();
}

class _RootSceneState extends State<RootScene> {

  int _currentIndex = 0;

  List<Widget> _pageList = [
          HomePage(),
          SecondPage(),
          ThirdPage(),
          FourthPage()
        ];

  List<BottomNavigationBarItem> _items = [
    BottomNavigationBarItem(
      icon:Icon(Icons.home),
      title: Text('首页') 
    ),
    BottomNavigationBarItem(
      icon:Icon(Icons.child_friendly),
      title: Text('二页') 
    ),
    BottomNavigationBarItem(
      icon:Icon(Icons.list),
      title: Text('三页') 
    ),
    BottomNavigationBarItem(
      icon:Stack(
        children: <Widget>[
          Icon(Icons.people),
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(50)),
                color: Colors.red
              ),
              child: Center(
                child: Text('10',style: TextStyle(
                  color: Colors.white,
                  fontSize: 10
                ),),
              ),
            ),
          )
        ],
      ),
      title: Text('四页') 
    ),
  ];

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: IndexedStack(
        children: _pageList,
        index: _currentIndex
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: _items,
        currentIndex: _currentIndex,
        onTap: (int index){
          setState(() {
           _currentIndex = index; 
          });
        },
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
