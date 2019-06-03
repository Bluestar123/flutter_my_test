import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeTopSearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child:Row(
        children: <Widget>[
          circleAvator(),
          Expanded(
            child: searchView(),
          ),
        ],
      )
    );
  }

  Widget circleAvator(){
    return Container(
      width: ScreenUtil().setWidth(80.0),
      height: ScreenUtil().setHeight(80.0),
      
      child: InkWell(
        onTap: (){
          print('11111111');
        },
        child:CircleAvatar(
          backgroundImage: NetworkImage(
              'http://img.pconline.com.cn/images/upload/upc/tx/itbbs/1506/21/c31/8713620_1434872160020_mthumb.jpg',
              
            )
        ),
      )
    );
  }


  Widget searchView() {
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),  // 圆弧的大小
        color: Colors.grey[100],   //  圆弧的颜色
      ),
      height: 32,
      child: FlatButton(
        onPressed: (){
          //跳转
        },
        child: Text(
          '搜索"街拍"关键字',
          style: TextStyle(fontSize: 12, color: Colors.black26),
        ),
      ),
    );
  }
}