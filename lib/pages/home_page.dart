import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './router/application.dart';
import './home_child/swiper.dart';
import './home_child/middle_listview.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import './home_child/drawer.dart';


class HomePage extends StatelessWidget {
  GlobalKey<RefreshHeaderState> _headerKey = new GlobalKey<RefreshHeaderState>();
  GlobalKey<RefreshFooterState> _footerKey = new GlobalKey<RefreshFooterState>();

  List<String> imgList = [
    'http://img1.ph.126.net/ClKea_fjrAqAUv_WrSuSOQ==/3295227552451664803.jpg',
    'http://p0.so.qhmsg.com/t010097233acaf2f079.jpg',
    'http://p4.so.qhmsg.com/t01fba97e00c6a49a89.jpg',
    'http://p3.so.qhmsg.com/t01a0164508fcdd651b.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    statusBar();
    return Scaffold(
      body: EasyRefresh(
        refreshHeader: ClassicsHeader(
          key: _headerKey,
          refreshText:'下拉刷新',
          refreshReadyText:'松开立即刷新',
          refreshingText:'正在刷新...',
          refreshedText:'刷新完成'
        ),
        refreshFooter: ClassicsFooter(
            key: _footerKey,
        ),
        child:ListView(
          children: <Widget>[
            // HomeTopSearch(),
            HomeSwiper(imgList),
            HomeMidList()
          ],
        ),
        onRefresh: () async{
          await Future.delayed(Duration(seconds: 3)).then((val){
            print('下拉刷新');
          });
        },
        loadMore: () async{
          print('加载1111111111');
          
        },
      ),
      appBar: AppBar(
        title:Row(
          children: <Widget>[
            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 16, right: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),  // 圆弧的大小
                  color: Colors.grey[100],   //  圆弧的颜色
                ),
                height: 32,
                child: FlatButton(
                  onPressed: (){
                    //跳转
                    Application.router.navigateTo(context,'/home_search');
                  },
                  child: Text(
                    '搜索"街拍"关键字',
                    style: TextStyle(fontSize: 12, color: Colors.black26),
                  ),
                ),
              ),
            )
          ],
        ),
        leading: Builder(
          builder: (context){
            return lead(context);
          },
        ),
        actions: <Widget>[
          IconButton(
            icon:Icon( Icons.date_range),
            onPressed: (){
              _showTimeDialog(context);
            },
          )
        ],
        
      ),
      drawer: Drawer(
        child:MyDrawer()
      ),
    );
  }

  //弹出时间框
  void _showTimeDialog(context){
    //DatePacker 是flutter自带的日期组件
    showDatePicker(
        context: context,//上下文
        initialDate: new DateTime.now(),//初始今天
        firstDate: new DateTime.now().subtract(new Duration(days: 30)),//日期范围，什么时候开始(距离今天前30天)
        lastDate: new DateTime.now().add(new Duration(days: 30)),//日期范围 结束时间，什么时候结束(距离今天后30天)
    ).then((DateTime val){
          print(val);
    }).catchError((e){
          print(e);
    });
  }

  //状态栏 样式
  statusBar() {
    SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
      // 设置状态栏背景色透明
      statusBarColor: Colors.transparent,
      // 设置状态栏图标是黑的
      statusBarIconBrightness: Brightness.dark,
    );
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }

  Widget lead(context){
    return Container(
              width: ScreenUtil().setWidth(80.0),
              height: ScreenUtil().setHeight(80.0),
              padding: EdgeInsets.all(5.0),
              child: InkWell(
                onTap: (){
                  Scaffold.of(context).openDrawer();
                },
                child:CircleAvatar(
                  backgroundImage: NetworkImage(
                      'http://img.pconline.com.cn/images/upload/upc/tx/itbbs/1506/21/c31/8713620_1434872160020_mthumb.jpg',
                      
                    )
                ),
              )
            );
  }
}