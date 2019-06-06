import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import '../store/models.dart';

import '../common/loading.dart';

class HomeDetail extends StatelessWidget {

  final String homeId;

  

  HomeDetail(this.homeId);

  @override
  Widget build(BuildContext context) {

    var para = {
				'userId':'1500896',
				'articleId':'104791',
				'page':1,
				'limit':10,
				'pushId':''
			};

    return Scaffold(
      appBar: AppBar(
        title: Text('我是 -- ${homeId}  详情'),
      ),
      body: FutureBuilder(
        future: _getData(para,context),
        builder: (context,snapshot){
          if(snapshot.hasData){
            return Center(
              child:ScopedModelDescendant<MainStateModel>(
                builder: (context,child,model){
                  return Text(model.homeDetail['msg']);
                },
              )
            );
          }else{
            return LoadingDialog();
          }
        },
      ),
    );
  }

  Future _getData(data,context)async {
    await ScopedModel.of<MainStateModel>(context,rebuildOnChange:true).getHomeDetailData(data);
  }
}