import 'package:flutter/material.dart';

class RightBackDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('我是右滑返回谢谢'),),
      body: Center(
        child:Text('老铁把手指从最左侧往右滑动，谢谢配合')
      ),
    );
  }
}