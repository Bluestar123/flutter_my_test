import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scoped_model/scoped_model.dart';
import '../store/models.dart';

ValueChanged<Locale> localeChange;

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        header(),
        Material(
          color:Colors.lightGreen,
          child:InkWell(
            onTap: (){
              SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
                systemNavigationBarColor: Colors.lightGreen, // navigation bar color
                statusBarColor: Colors.lightGreen, // status bar color
              ));

            },
            child:ListTile(
              leading: Icon(Icons.search),
              title:Text('改变状态栏颜色'),
              trailing: Icon(Icons.chevron_right),
            )
          )
        ),
        Container(
          color:Colors.lightGreen,
          margin: EdgeInsets.symmetric(vertical: 10.0),
          child: ScopedModelDescendant<MainStateModel>(
            builder: (context,child,model){
              return ListTile(
                onTap: (){
                  model.changeTheme();
                },
                title: Text('改变主题色'),
                leading: Icon(Icons.change_history),
                trailing: Icon(Icons.chevron_right),
              );
            },
          ),
        ),
        Container(
          color: Colors.pink,
          child:ListTile(
            onTap: (){
              localeChange(Locale('en', ''));//zh为中文
            },
            title: Text('111'),
            leading: Icon(Icons.change_history),
            trailing: Icon(Icons.chevron_right),
          )
        )
      ],
    );
  }


  Widget header(){
    return DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.lightBlueAccent,
              ),
              child: Center(
                child: SizedBox(
                  width: 60.0,
                  height: 60.0,
                  child: CircleAvatar(
                    child: Text('W'),
                  ),
                ),
              ),
            );
  }
}