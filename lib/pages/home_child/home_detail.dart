import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import '../store/models.dart';
import 'package:flutter_html/flutter_html.dart';
import '../common/loading.dart';
import 'package:fluttertoast/fluttertoast.dart';


class HomeDetail extends StatefulWidget {
  final String homeId;

  HomeDetail(this.homeId);
  @override
  _HomeDetailState createState() => _HomeDetailState();
}

class _HomeDetailState extends State<HomeDetail> {

  @override
  Widget build(BuildContext context) {

    var para = {
				'userId':'1500896',
				'articleId':'104791',
				'page':1,
				'limit':10,
				'pushId':''
			};
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          title: Text('我是 -- ${widget.homeId}  详情'),
          actions: <Widget>[
            FlatButton(
              child: Text('关闭'),
              onPressed: (){
                Fluttertoast.showToast(
                  msg: "瞎点什么玩意",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIos:3,
                  backgroundColor: Theme.of(context).primaryColor,
                  textColor: Colors.white
              );
              },
            )
          ],
        ),
        body: FutureBuilder(
          future: _getData(para,context),
          builder: (context,snapshot){
            if(snapshot.hasData){
              return Center(
                child:ScopedModelDescendant<MainStateModel>(
                  builder: (context,child,model){
                    var goodDetail = ScopedModel.of<MainStateModel>(context).homeDetail.data.goodInfo.goodsDetail;
                    return ListView(
                      children: <Widget>[
                        Html(data: goodDetail)
                      ],
                    );
                  },
                )
              );
            }else{
              return LoadingDialog();
            }
          },
        ),
      ),
    );
  }

  Future _getData(data,context)async {
    await ScopedModel.of<MainStateModel>(context,rebuildOnChange:true).getHomeDetailData(data);
    return '加载完成';/////****************** */
  }


  //返回时 弹框提示
  Future<bool> _onWillPop() {
    return showDialog(
      context: context,// stateFul  时候 直接context
      builder: (context) => new AlertDialog(
        title: new Text('Are you sure?'),
        content: new Text('Do you want to exit an App'),
        actions: <Widget>[
          new FlatButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: new Text('No'),
          ),
          new FlatButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: new Text('Yes'),
          ),
        ],
      ),
    ) ?? false;
  }

  int last = 0;
  // 安卓 点击两次 返回
  Future<bool> doubleClickBack(){
    int now = DateTime.now().millisecond;
    if(now-last>800){
      last = DateTime.now().millisecond;
      return Future.value(false);//表示不退出.
    }else{
      return Future.value(true);//表示退出.
    }
  }
  
}

// class HomeDetail extends StatelessWidget {

  
// }