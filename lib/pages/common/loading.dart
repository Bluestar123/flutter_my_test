import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LoadingDialog extends Dialog {
  String loadingText;
  bool outsideDismiss;
  Function dismissCallback;

  LoadingDialog(
      {Key key,
      this.loadingText = "努力加载中...",
      this.outsideDismiss = true,
      this.dismissCallback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    _dismissDialog() {
      // if (dismissCallback != null) {
      //   dismissCallback();
      // }
      // Navigator.of(context).pop();
    }

    return new GestureDetector(
      onTap: outsideDismiss ? _dismissDialog : null,
      child: Material(
        type: MaterialType.transparency,
        child: new Center(
          child: new SizedBox(
            width: 120.0,
            height: 120.0,
            child: new Container(
              decoration: ShapeDecoration(
                color: Color(0xffffffff),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8.0),
                  ),
                ),
              ),
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  new CircularProgressIndicator(),
                  new Padding(
                    padding: const EdgeInsets.only(
                      top: 20.0,
                    ),
                    child: new Text(
                      loadingText,
                      style: new TextStyle(fontSize: 12.0),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}