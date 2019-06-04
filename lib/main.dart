import 'package:flutter/material.dart';
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
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          debugShowCheckedModeBanner: false,
          onGenerateRoute: Application.router.generator,
          home: Login(),
      
        ),
    );
  }
}
