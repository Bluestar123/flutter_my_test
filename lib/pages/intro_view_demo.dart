import 'package:flutter/material.dart';
import 'package:intro_views_flutter/Models/page_view_model.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';
import 'login.dart';

class IntroViewDemo extends StatelessWidget {

  final pages = [
    PageViewModel(
      pageColor: Color(0xFF03a9f4),
      iconImageAssetPath: 'images/taxi-driver.png',
      iconColor: null,
      // bubbleBackgroundColor: null,
      body: Text('我是一号'),
      title: Text('NO 1'),
      textStyle: TextStyle(
        fontFamily: 'MyFont',
        color: Colors.white
      ),
      mainImage: Image.network('http://imgq.duitang.com/uploads/item/201507/18/20150718205535_QMtXi.thumb.700_0.jpeg',
        width: 285.0,
        height: 285.0,
        alignment: Alignment.center,
      )
    ),
    PageViewModel(
      pageColor: Color(0xFF607D8B),
      iconImageAssetPath: 'images/air-hostess.png',
      iconColor: null,
      // bubbleBackgroundColor: null,
      body: Text('我是er号'),
      title: Text('NO 2'),
      textStyle: TextStyle(
        fontFamily: 'MyFont',
        color: Colors.white
      ),
      mainImage: Image.network('http://img5q.duitang.com/uploads/item/201502/15/20150215111819_WvVeB.thumb.700_0.png',
        width: 285.0,
        height: 285.0,
        alignment: Alignment.center,
      )
    ),
    PageViewModel(
      pageColor: Color(0xFF8BC34A),
      iconImageAssetPath: 'images/waiter.png',
      iconColor: null,
      // bubbleBackgroundColor: null,
      body: Text('我是san号'),
      title: Text('NO 3'),
      textStyle: TextStyle(
        fontFamily: 'MyFont',
        color: Colors.white
      ),
      mainImage: Image.network('http://p3.pstatp.com/origin/1f860000659beb4e28c9',
        width: 285.0,
        height: 285.0,
        alignment: Alignment.center,
      )
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        
        builder: (context)=>IntroViewsFlutter(
          pages,
          onTapDoneButton: (){
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => Login()),
                  (route) => route == null);
            // Navigator.push(context, MaterialPageRoute(
            //   builder: (context)=>Login()
            // ),);
          },
          showNextButton: true,
          skipText: Text('跳过'),
          pageButtonTextStyles: TextStyle(
            color: Colors.white,
            fontSize: 18.0
          ),
        ),
      ),
    );
  }
}