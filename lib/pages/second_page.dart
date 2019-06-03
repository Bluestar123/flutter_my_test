import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {

  double checkHeight=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            leading: GestureDetector(
              child: Icon(Icons.arrow_back),
              onTap: () => Navigator.pop(context),
            ),
            title: Text('我是 sliver'),
            centerTitle: true,
            expandedHeight: 200,//展开高度
            forceElevated: true,//显示阴影
            floating: true,//当有下滑收拾的时候显示 appbar
            snap: true,//只有 floating 为true使用，上划一定比例收缩，下滑一定比例 展开 ,zidong 
            pinned: true,//折叠后不消失
            flexibleSpace:FlexibleSpaceBar(//设置 appbar背景
              // title: Text('我是 sliver'),
              // centerTitle: true,
              //动画
              collapseMode: CollapseMode.pin,
              background: Image.network('http://p0.so.qhmsg.com/t010097233acaf2f079.jpg',fit: BoxFit.cover,),
            ),
            actions: <Widget>[

            ],
          ),
          SliverFillRemaining(
            child: Center(
              child: Text('我是填充的',style:TextStyle(fontSize: 30.0)),
            ),
          )
        ],
      )
    );
  }
}