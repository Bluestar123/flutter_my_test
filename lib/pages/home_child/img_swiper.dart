import 'package:flutter/material.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
// import 'package:image_picker_saver/image_picker_saver.dart';
// import 'package:fluttertoast/fluttertoast.dart';

class ImgSwiper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Swiper(
        
        itemCount: 5,
        autoplay: false,
        pagination: SwiperPagination(
           builder: DotSwiperPaginationBuilder(
                color: Colors.white70,              // 其他点的颜色
                activeColor: Colors.redAccent,      // 当前点的颜色
                space: 2,                           // 点与点之间的距离
                activeSize: 20                      // 当前点的大小
            ),
            // alignment: Alignment.bottomRight
        ),
        itemBuilder: (context,index){
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 20.0),
            child:GestureDetector(
              onTapUp: (a){
                Navigator.pop(context);
              },
              onLongPress: (){
                // saveNetworkImageToPhoto('https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1561049651045&di=fefc2383a9a91dd26486fea7681af779&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fblog%2F201307%2F03%2F20130703202453_cHZu3.jpeg',useCache:false);
              },
              child: ExtendedImage.network(
                  'http://p4.qhimg.com/t015f93bd3bd7f66e7d.jpg',
                  fit: BoxFit.contain,
                  cache: true,
                  border: Border.all(color: Colors.red, width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  mode: ExtendedImageMode.Gesture,
                  initGestureConfigHandler: (state){
                    return GestureConfig(
                      minScale: 0.9,
                      animationMinScale: 0.7,
                      maxScale: 3.0,
                      animationMaxScale: 3.5,
                      speed: 1.0,
                      inertialSpeed: 100.0,
                      initialScale: 1.0,
                      inPageView: true
                    );
                  }
                ),
            ) 

          );
        },
      )
    );
  }


  // Future<bool> saveNetworkImageToPhoto(String url, {bool useCache: true}) async {
    // var data = await getNetworkImageData(url, useCache: useCache);
    // var filePath = await ImagePickerSaver.saveFile(fileData: data);

    // var msg;
    // if(filePath != null && filePath != ""){
    //   msg = '保存成功';
    // }else{
    //   msg = '保存失败';
    // }
    // Fluttertoast.showToast(
    //     msg: msg,
    //     toastLength: Toast.LENGTH_SHORT,
    //     gravity: ToastGravity.CENTER,
    //     timeInSecForIos: 1,
    //     backgroundColor: Colors.pink,
    //     textColor: Colors.white
    // );
    // return filePath != null && filePath != "";
  // }
}