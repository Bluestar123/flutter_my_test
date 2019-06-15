import 'package:scoped_model/scoped_model.dart';
import '../models/home_detail.dart';
import 'dart:convert';
import '../request/service_method.dart';

class HomeDetailModel extends Model{

  DetailModel _homeDetail = null;

  get homeDetail => _homeDetail;
  
  getHomeDetailData(data) async{
    var d = data;
    
    // 解析对象
    await postForm('get_wine',formData:{'goodId':"35df1fdd5d8c468ca525cd7021bd32d8"}).then((val){
      // List<dynamic> ts = val.data;
      // var aa = json.decode(ts.toString());
      
      dynamic res = json.decode(val.toString());//转成 map   //后台数据的问题
      // _homeDetail = val['article']['article_content'];//转成 对象
      _homeDetail = DetailModel.fromJson(res); //转换成实体类

      notifyListeners();
    }).catchError((err){
      print('系统故障1111111  $err');
    });
    
    
  }

  //重写of方法
  // HomeDetailModel of(context) =>
  //     ScopedModel.of<HomeDetailModel>(context);
  //使用
  // HomeDetailModel().of(context)


}