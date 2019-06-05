import 'package:scoped_model/scoped_model.dart';
import 'dart:math';
import 'package:flutter/material.dart';

class ThemeStateModel extends Model{

  final List<Color> themeList = [
      // Colors.black,
      Colors.red,
      Colors.teal,
      Colors.pink,
      Colors.amber,
      Colors.orange,
      Colors.green,
      Colors.blue,
      Colors.lightBlue,
      Colors.purple,
      Colors.deepPurple,
      Colors.indigo,
      Colors.cyan,
      Colors.brown,
      Colors.grey,
      Colors.blueGrey
    ];

  var _theme = Colors.blue;

  get theme => _theme;

  void changeTheme() async {
    // var randomIndex = Random().nextInt(15);
    // print(randomIndex);
    _theme = themeList[Random().nextInt(themeList.length)];

    notifyListeners();
  }
}