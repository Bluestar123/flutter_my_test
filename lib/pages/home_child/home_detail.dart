import 'package:flutter/material.dart';

class HomeDetail extends StatelessWidget {

  final String homeId;

  HomeDetail(this.homeId);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('我是 -- ${homeId}'),
      ),
    );
  }
}