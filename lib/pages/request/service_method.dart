
import 'package:dio/dio.dart';
import 'dart:io';
import './service_url.dart';


const errorMsg = '数据故障请稍后重试';
//{ } 可选参数

//formdata 传参
Future postForm(url,{formData}) async {
  try{
    Response response;
    Dio dio = new Dio();
    dio.options.contentType =ContentType.parse('application/x-www-form-urlencoded'); //来自于io库

    if(formData!=null){
      response = await dio.post(servicePath[url],data:formData);
    }else{
      response = await dio.post(servicePath[url]);
    }

    if(response.statusCode==200){
      return response.data;
    }else{
      throw Exception('后端接口出现异常');
    }

  }catch(e){
    return print('${errorMsg}');
  }
}

Future get1(url,{data}) async {
  try{
    Response response;
    Dio dio = new Dio();
    dio.options.contentType =ContentType.parse('application/json'); //


    if(data!=null){
      response = await dio.get(servicePath[url],queryParameters:data);
    }else{
      response = await dio.get(servicePath[url]);
    }
    
    if(response.statusCode==200){
      
      return response.data;
    }else{
      
      throw Exception('后端接口出现异常');
    }

  }catch(e){
    
    return print('${errorMsg}');
  }
}