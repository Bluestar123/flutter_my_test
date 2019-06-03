import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
              title:Text('你好啊'),
              trailing: Icon(Icons.chevron_right),
            )
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