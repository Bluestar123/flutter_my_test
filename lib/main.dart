import 'package:flutter/material.dart';
import './generated/i18n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import './pages/login.dart';
import 'package:flutter/services.dart';
import 'package:fluro/fluro.dart';
import './pages/router/application.dart';
import './pages/router/routers.dart';
import 'package:scoped_model/scoped_model.dart';
import './pages/models/models.dart';

void main() {
  //竖屏
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final router = Router();//初始化
    Routes.configureRoutes(router);
    Application.router=router;//静态化

    MainStateModel mainStateModel = MainStateModel();

    return  ScopedModel<MainStateModel>(
      model: mainStateModel,
      child: ScopedModelDescendant<MainStateModel>(
        builder: (context,child,model){
          return MaterialApp(
              localizationsDelegates: [//列表中的元素是生成本地化值集合的工厂
                S.delegate,//根据你的arb文件自动生成对应的函数
                GlobalMaterialLocalizations.delegate, //为Material Components库提供了本地化的字符串和其他值
                GlobalWidgetsLocalizations.delegate//定义widget默认的文本方向，从左到右或从右到左。
              ],
              supportedLocales: S.delegate.supportedLocales,
              title: 'Flutter Demo',
              theme: ThemeData(
                primarySwatch: model.theme,
              ),
              debugShowCheckedModeBanner: false,
              onGenerateRoute: Application.router.generator,
              home: Login(),
          
            );
        },
      )
    );
  }
}

