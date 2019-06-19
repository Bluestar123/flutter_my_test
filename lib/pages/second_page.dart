import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import '../generated/i18n.dart';
import 'package:test_flutter_demo/pages/store/models.dart';
import './store/models.dart';

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  double checkHeight=0;
  
  ScrollController _controller;
  double topPos=0;

  CountModel countModel = new CountModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainStateModel>(
      
              builder: (context,child,model){
                return Scaffold(
                    body: CustomScrollView(
                      controller: _controller,
                      slivers: <Widget>[
                        SliverAppBar(
                          leading: GestureDetector(
                            child: Icon(Icons.arrow_back),
                            onTap: null//() => Navigator.pop(context),
                          ),
                          title: Text('我是 sliver ${model.count}'),
                          centerTitle: true,
                          expandedHeight: 200,//展开高度
                          forceElevated: true,//显示阴影
                          floating: true,//当有下滑收拾的时候显示 appbar
                          snap: true,//只有 floating 为true使用，上划一定比例收缩，下滑一定比例 展开 ,zidong 
                          pinned: true,//折叠后不消失
                          flexibleSpace:FlexibleSpaceBar(//设置 appbar背景
                            // title: Text('我是 sliver'),
                            // centerTitle: true,
                            //动画
                            collapseMode: CollapseMode.pin,
                            background: Image.network('http://p0.so.qhmsg.com/t010097233acaf2f079.jpg',fit: BoxFit.cover,),
                          ),
                          actions: <Widget>[
                            IconButton(
                              onPressed: (){
                                model.decrement();
                              },
                              icon: Icon(Icons.router),
                            ),
                            IconButton(
                              icon: Icon(Icons.cached),
                              onPressed: (){
                                // localeChange(Locale('zh', ''));//zh为中文
                                ScopedModel.of<MainStateModel>(context).setLang();
                              },
                            )
                          ],
                        ),
                        SliverFillRemaining(
                          child: Center(
                            child: Text(S.of(context).appName ,style:TextStyle(fontSize: 30.0)),
                          ),
                        )
                      ],
                    )
                  );
              },
            
      
    );
  }
}
