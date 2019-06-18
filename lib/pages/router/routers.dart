import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import './router_handler.dart';

class Routes{
  static String root='/';

  static String homeDetail = '/home_detail';

  static String thirdDetail = '/third_detail';

  static String dragDetail = '/draggle_grid_view';

  static String amapDetail = '/amap';

  static void configureRoutes(Router router){
    router.notFoundHandler = new Handler(
      handlerFunc: (BuildContext context,Map<String,List<String>> params){
        print('没有这个路径');
      }
    );

    //路由配置
    router.define(homeDetail,handler:homeHandler,transitionType:TransitionType.inFromRight);
    // 图片列表
    router.define(thirdDetail,handler:thirdHandler,transitionType:TransitionType.inFromRight);

    // 长按拖动
    router.define(dragDetail,handler:draggableHandler,transitionType:TransitionType.inFromRight);

    //高德地图
    router.define(amapDetail,handler:amapHandler,transitionType:TransitionType.inFromRight);
  }
}