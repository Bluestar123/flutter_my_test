import 'package:scoped_model/scoped_model.dart';
import '../request/service_method.dart';
import 'dart:convert';

class ThirdDetail extends Model {

  var _picList = null;

  get picList => _picList;

  getPic() async {

    await get1('get_pic').then((val){
      
      _picList = json.decode(val.toString())['data'];
      // List<Map> list = (res['data'] as List).cast();
      // _picList = PicData.fromJson(list) ;
// print(_picList);
      notifyListeners();

    }).catchError((err){
      print('请求数据出错  $err');
    });

  }

}