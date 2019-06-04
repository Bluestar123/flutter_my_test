import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scoped_model/scoped_model.dart';
import '../models/models.dart';

class HomeMidList extends StatefulWidget {
  @override
  _HomeMidListState createState() => _HomeMidListState();
}

class _HomeMidListState extends State<HomeMidList> {
  List<String> textList = ['最新','关注','惊恐','喜剧','浪漫','美剧','国产','日本','韩国'];
  int _currentIndex = 0;
  int times=0;

  List<String> imgList =[
    'http://img1.ph.126.net/ClKea_fjrAqAUv_WrSuSOQ==/3295227552451664803.jpg',
    // 'http://p0.so.qhmsg.com/t010097233acaf2f079.jpg',
    // 'http://p4.so.qhmsg.com/t01fba97e00c6a49a89.jpg',
    // 'http://p3.so.qhmsg.com/t01a0164508fcdd651b.jpg',
    // 'http://p3.so.qhmsg.com/t015112ce43bd4a1586.jpg',
    // 'http://img4.hao123.com/data/1_eb7c92a8221df778501d16f242f0beba_0',
    // 'http://p4.qhimg.com/t015f93bd3bd7f66e7d.jpg'
  ];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Future<bool> _onBackPressed() async {
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainStateModel>(
                builder: (context,child,model){
                  return Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(right: 50),
                              child: Text('${model.count}'),
                            ),

                            FloatingActionButton(
                              onPressed: (){
                                model.increment();
                              },
                              child: Text('点击我+1'),
                            )
                          ],
                        ),
                        Container(
                          height: 50,
                          color:Colors.white,
                          margin: EdgeInsets.only(top: 10.0),
                          width: MediaQuery.of(context).size.width,
                          child:ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: textList.length,
                            itemBuilder: (context,index){
                              return every(textList[index],index);
                            },
                          )
                        ),
                        wrapList()
                      ],
                    ),
                  );
                },
              
    );
                
  }

  Widget every(item,index){
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: InkWell(
        onTap: (){
          setState(() {
           _currentIndex=index; 

           if(times>6){
              times=0;
              imgList=[];
           }else{
             imgList.add('http://p4.qhimg.com/t015f93bd3bd7f66e7d.jpg');
           }
           times++;
          });
        },
        child:Text('${item}',style: TextStyle(
          color: index == _currentIndex?Colors.pink:Colors.lightBlueAccent,
          fontSize: ScreenUtil().setSp(30)
        ),)
      ),
    );
  }


  Widget wrapList(){
    return Wrap(
      spacing: 5.0,
      runSpacing: 15.0,
      children: imgList.map((val){
        return img(val);
      }).toList(),
    );
  }

  Widget img(String src){
    return Container(
      width: ScreenUtil().setWidth(370),
      height: ScreenUtil().setHeight(370),
      child: Image.network('${src}',fit:BoxFit.cover),
    );
  }
}


// class HomeMidList extends StatelessWidget {

//   List<String> textList = ['最新','关注','惊恐','喜剧','浪漫','美剧','国产','日本','韩国'];
//   int _currentIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 50,
//       color:Colors.white,
//       margin: EdgeInsets.only(top: 10.0),
//       width: MediaQuery.of(context).size.width,
//       child:ListView.builder(
//         scrollDirection: Axis.horizontal,
//         itemCount: textList.length,
//         itemBuilder: (context,index){
//           return every(textList[index],index);
//         },
//       )
//     );
//   }

//   Widget every(item,index){
//     return Container(
//       alignment: Alignment.center,
//       margin: EdgeInsets.symmetric(horizontal: 10),
//       child: InkWell(
//         onTap: (){
//           index = _currentIndex;
//         },
//         child:Text('${item}',style: TextStyle(
//           color: index == _currentIndex?Colors.pink:Colors.lightBlueAccent,
//           fontSize: ScreenUtil().setSp(30)
//         ),)
//       ),
//     );
//   }
// }