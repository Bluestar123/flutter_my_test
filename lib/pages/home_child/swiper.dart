import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../router/application.dart';

class HomeSwiper extends StatelessWidget {

  final List _items;

  HomeSwiper(this._items);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: ScreenUtil().setHeight(400),
      margin: EdgeInsets.only(top:10.0),
      child: Swiper(
        // onTap: (index){
        //   print('点击了第${index}');
        // },
        itemCount: _items.length,
        pagination: SwiperPagination(
           builder: DotSwiperPaginationBuilder(
                color: Colors.white70,              // 其他点的颜色
                activeColor: Colors.redAccent,      // 当前点的颜色
                space: 2,                           // 点与点之间的距离
                activeSize: 20                      // 当前点的大小
            ),
            alignment: Alignment.bottomRight
        ),
        autoplay: true,
        itemBuilder: (context,index){
          return InkWell(
            onTap: (){
               print('点击了第${index}');

               Application.router.navigateTo(context, '/home_detail?id=${index}');
            },
            child:Image.network('${_items[index]}',fit:BoxFit.cover)
          );
        },
      ),
    );
  }
}