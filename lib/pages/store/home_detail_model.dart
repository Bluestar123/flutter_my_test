import 'package:scoped_model/scoped_model.dart';
import '../models/home_detail.dart';
import 'dart:convert';
import '../request/service_method.dart';

class HomeDetailModel extends Model{

  HomeDetail _homeDetail = null;

  get homeDetail => _homeDetail;
  
  getHomeDetailData(data) async{
    var d = data;
    
    await get('home_detail',data: d).then((val){
      // var res = json.decode(val.toString());//转成 map

      _homeDetail = HomeDetail.fromJson(val);//转成 对象
      print(_homeDetail);
      notifyListeners();
    }).catchError((err){
      print('系统故障');
    });;
    
    
  }

  //重写of方法
  // HomeDetailModel of(context) =>
  //     ScopedModel.of<HomeDetailModel>(context);
  //使用
  // HomeDetailModel().of(context)
}