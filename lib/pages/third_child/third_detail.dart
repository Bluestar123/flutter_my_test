import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import '../store/models.dart';
import '../common/loading.dart';

class ThirdDetail extends StatelessWidget {

  final String id;
  final String name;
  ThirdDetail({this.id,this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('图片列表'),
      ),
      body: FutureBuilder(
        future: _getImg(context),
        builder: (context,snapshot){
          if(snapshot.hasData){
            return ScopedModelDescendant<MainStateModel>(
              builder: (context,child,model){
                return ListView.builder(
                  itemCount: model.picList.length,
                  itemBuilder: (context,index){
                    return Container(
                      margin: EdgeInsets.all(20),
                      child: Image.network(model.picList[index]['image_url']),
                    );
                  },
                );
              },
            );
            
          }else{
            return LoadingDialog();
          }
        },
      ),
    );
  }

  Future _getImg(context) async {

      await ScopedModel.of<MainStateModel>(context,rebuildOnChange: true).getPic();
    
      return '获取成功';
    
  }
}