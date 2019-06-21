import 'package:flutter/material.dart';

class MeiTuan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ClipPath(
        clipper: ArcClipper(),
        child: Container(
          height: 300,
          color: Colors.teal,
        ),
      ),
    );
  }
}

class ArcClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(0.0, 0.0);
    path.lineTo(0.0, size.height-100);

    var leftControlPoint = Offset(size.width/4,size.height);
    var leftPoint = Offset(size.width/2,size.height);  //  endPoint
    path.quadraticBezierTo(leftControlPoint.dx, leftControlPoint.dy,leftPoint.dx, leftPoint.dy);

    var rightControlPoint = Offset(size.width - size.width/4,size.height);
    var rightPoint = Offset(size.width,size.height-100);  //  endPoint
    path.quadraticBezierTo(rightControlPoint.dx, rightControlPoint.dy,rightPoint.dx, rightPoint.dy);

    path.lineTo(size.width, 0);
    // path.lineTo(0.0, size.height);
    // var firstControlPoint = Offset(size.width / 4, size.height - 30);
    // var firstPoint = Offset(size.width / 2, size.height - 30);
    // path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
    //     firstPoint.dx, firstPoint.dy);

    // var secondControlPoint =
    //     Offset(size.width - (size.width / 4), size.height - 30);
    // var secondPoint = Offset(size.width, size.height);
    // path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
    //     secondPoint.dx, secondPoint.dy);

    // path.lineTo(size.width, 0.0);
    // path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}