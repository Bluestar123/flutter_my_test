import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import '../home_child/home_detail.dart';
import '../fourth_child/draggable_gridview.dart';
import '../third_child/third_detail.dart';
import '../fourth_child/amap.dart';
import '../fourth_child/resume.dart';
import '../home_child/search_page.dart';
import '../fourth_child/netflix_page.dart';

//首页详情
Handler homeHandler = Handler(
  handlerFunc: (BuildContext context,Map<String,List<String>> params){
    String id = params['id'].first;
    return HomeDetail(id);
  }
);

//首页详情
Handler thirdHandler = Handler(
  handlerFunc: (BuildContext context,Map<String,List<String>> params){
    String id = params['id'].first;
    String name = params['name'].first;
    return ThirdDetail(id: id,name: name);
  }
);

//首页搜索
Handler searchHandler = Handler(
  handlerFunc: (BuildContext context,Map<String,List<String>> params){

    return SearchPage();
  }
);


//draggable  gridview
Handler draggableHandler = Handler(
  handlerFunc: (BuildContext context,Map<String,List<String>> params){

    return DraggableGridViewDemo();
  }
);

//高德地图
Handler amapHandler = Handler(
  handlerFunc: (BuildContext context,Map<String,List<String>> params){

    return AmapDemo();
  }
);

//个人简历
Handler resumeHandler = Handler(
  handlerFunc: (BuildContext context,Map<String,List<String>> params){

    return ResumeDemo();
  }
);

//仿 netflix页面
Handler netflixHandler = Handler(
  handlerFunc: (BuildContext context,Map<String,List<String>> params){

    return NetflixPage();
  }
);