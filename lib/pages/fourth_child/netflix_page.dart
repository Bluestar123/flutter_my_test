import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts_arabic/fonts.dart';
import '../common/customicon.dart';

class NetflixPage extends StatefulWidget {
  @override
  _NetflixPageState createState() => _NetflixPageState();
}

class _NetflixPageState extends State<NetflixPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('仿Netflix页面'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[HomeScreeTopPart(),HomeScreenBottomPart()],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home,color:Color(0xffe52020)),
            title: Text('Home',style:TextStyle(
              color: Color(0xffe52020)
            ))
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text('Search')
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            title: Text('Bookmard')
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            title: Text('Profile')
          ),
        ],
      ),
    );
  }
}

class HomeScreeTopPart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 420.0,
        child: Stack(
          children: <Widget>[
            ClipPath(
              clipper: Mclipper(),
              child: Container(
                height: 370.0,
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                      color: Colors.black12,
                      offset: Offset(0.0, 10.0),
                      blurRadius: 10.0)
                ]),
                child: Stack(
                  children: <Widget>[
                    Image.asset('images/netflix/banner.png',
                        fit: BoxFit.cover, width: double.infinity),
                    Container(
                      height: double.infinity,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0x00000000), Color(0xD9333333)],
                          stops: [0.0, 0.9], // 透明度
                          begin: FractionalOffset(0.0, 0.0),
                          end: FractionalOffset(0.0, 1.0),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(top: 120.0, left: 95.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text('Watch before everone',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15.0,
                                  fontFamily: 'SF-Pro-Display-Bold',
                                )),
                            Text('the Punisher : Season 2',
                                style: TextStyle(
                                    fontSize: 50.0,
                                    color: Colors.white,
                                    fontFamily: ArabicFonts.Cairo,
                                    package: 'google_fonts_arabic'))
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
                top: 370,
                right: -20,
                child: FractionalTranslation(
                  translation: Offset(0.0, -0.5),
                  child: Row(
                    children: <Widget>[
                      FloatingActionButton(
                        backgroundColor: Colors.white,
                        onPressed: () {},
                        child: Icon(
                          Icons.add,
                          color: Color(0xFFE52020),
                        ),
                      ),
                      SizedBox(
                        width: 12.0,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: RaisedButton(
                          color: Color(0xffe52020),
                          padding: EdgeInsets.symmetric(
                              vertical: 15.0, horizontal: 80.0),
                          onPressed: () {},
                          child: Row(
                            children: <Widget>[
                              Text('Watch Now',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.0,
                                      fontFamily: 'kai')),
                              SizedBox(
                                width: 5.0,
                              ),
                              // RotatedBox(
                              //   quarterTurns: 2,
                              //   child: Icon(CustomIcons.back_icon),
                              // )
                              Icon(
                                Icons.chevron_right,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )),
          ],
        ));
  }
}

class HomeScreenBottomPart extends StatelessWidget {
  List<String> images = [
    'images/netflix/blackpanther.jpg',
    'images/netflix/avengers.jpg',
    'images/netflix/blackpanther.jpg'
  ];

  List titles = <String>['Runaways', 'Avengers: infinity war', 'Black Panther'];

  List<Widget> movies() {
    List<Widget> movieList = new List();

    for (int i = 0; i < 3; i++) {
      var movieitem = Padding(
        padding: EdgeInsets.symmetric(vertical: 25.0, horizontal: 12.0),
        child: Container(
          height: 220,
          width: 135.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10.0,
                offset: Offset(0.0, 10.0))
          ]),
          child: Column(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0),topRight: Radius.circular(20.0)),
                child: Image.asset(
                  images[i],
                  width: double.infinity,
                  height: 130.0,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(top:4,left: 8,right: 8),
                  child: Text(titles[i],
                  textAlign: TextAlign.center,
                  style:TextStyle(
                    fontSize: 16.0
                )),
              ),
              Padding(
                padding: EdgeInsets.only(top: 3.0),
                child: Text(i==0?"Season 2":''),
              )
            ],
          ),
        ),
      );

      movieList.add(movieitem);
    }
    return movieList;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 360.0,
        margin: EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal:20 ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Watch now',
                      style: TextStyle(
                        fontSize: 22.0,
                      )),
                  FlatButton(
                    child: Text('View more'),
                    onPressed: (){},
                  )
                ],
              )
            ),
            Container(
              height: 250.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: movies(),
              ),
            )
          ],
        ));
  }
}

//自定義剪裁器
class Mclipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();

    //path 是 逆时针 画点
    path.lineTo(0.0, size.height - 100.0);

    var controlpoint = Offset(35.0, size.height);
    var endpoint = Offset(size.width / 2, size.height);

    path.quadraticBezierTo(
        controlpoint.dx, controlpoint.dy, endpoint.dx, endpoint.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
