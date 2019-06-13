import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import '../home_child/home_detail.dart';
import '../third_child/third_detail.dart';

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