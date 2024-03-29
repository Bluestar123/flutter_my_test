import 'package:flutter/material.dart';
import './router/application.dart';
import 'package:flutter/cupertino.dart';
import './fourth_child/RightBackDemo.dart';


class TabTitle{
  String title;
  int id;
  TabTitle(this.title,this.id);
}

class FourthPage extends StatefulWidget {
  @override
  _FourthPageState createState() => _FourthPageState();
}

class _FourthPageState extends State<FourthPage> with SingleTickerProviderStateMixin {

  TabController  mTabController;
  PageController mPageController = PageController(initialPage: 0);

  var currentPage = 0;
  var isPageCanChanged = true;
  
  var tabs = [
    TabTitle("头条",0),
    TabTitle("社会",1),
    TabTitle("国内",2),
    TabTitle("国际",3),
    TabTitle("娱乐",4),
    TabTitle("体育",5),
    TabTitle("军事",6),
    TabTitle("财经",7),
    TabTitle('时尚',8),
  ];
  

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
    mTabController = TabController(
      length: tabs.length,
      vsync: this////动画效果的异步处理，默认格式，背下来即可
    );

    mTabController.addListener(() {//TabBar的监听
      if (mTabController.indexIsChanging) {//判断TabBar是否切换
        print(mTabController.index);
        
        onPageChange(mTabController.index, p: mPageController);
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('tab联动切换'),
        actions: <Widget>[
          Builder(
            builder: (context){
              return FlatButton.icon(
                icon: Icon(Icons.border_left),
                label: Text('有惊喜'),
                onPressed: (){
                  Scaffold.of(context).openEndDrawer();
                },
              );
            },
          )
        ],
        bottom: TabBar(
              isScrollable: true,
              controller: mTabController,
              labelColor: Colors.red,
              unselectedLabelColor: Color(0xff666666),
              labelStyle: TextStyle(
                fontSize: 16.0
              ),
              tabs: tabs.map((tab){
                return Tab(
                  text:tab.title
                );
              }).toList()),
      ),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              height: 300.0,
              color: Theme.of(context).primaryColor,
              child: Center(
                child: ClipOval(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50.0),
                        border: Border.all(width: 2,color: Colors.grey)
                      ),
                      width: 100,
                      height: 100,
                      child: Center(
                        child: Text('我来自偶然'),
                      ),
                    ),
                ),
              ),
            )
          ],
        ),
      ),
      
      body: Column(
        children: <Widget>[
          Container(
            color: Color(0xfff4f5f6),
            height: 38.0,
            alignment: Alignment.centerLeft,
            child: TabBar(
              isScrollable: true,
              controller: mTabController,
              labelColor: Colors.red,
              unselectedLabelColor: Color(0xff666666),
              labelStyle: TextStyle(
                fontSize: 16.0
              ),
              tabs: tabs.map((tab){
                return Tab(
                  text:tab.title
                );
              }).toList(),
            ),
          ),
          Expanded(
            child: PageView.builder(
              itemCount: tabs.length,
              onPageChanged: (index){
                if(isPageCanChanged){//由于pageview切换是会回调这个方法,又会触发切换tabbar的操作,所以定义一个flag,控制pageview的回调
                  onPageChange(index);
                }
              },
              controller: mPageController,
              itemBuilder: (BuildContext context,int index){
                return index!=5?ListItem():Text('未完待续');
              },
            ),
          )
        ],
      ),
    );
  }


  onPageChange(int index, {PageController p, TabController t}) async {
    if (p != null) {//判断是哪一个切换
      isPageCanChanged = false;
      await mPageController.animateToPage(index, duration: Duration(milliseconds: 500), curve: Curves.ease);//等待pageview切换完毕,再释放pageivew监听
      isPageCanChanged = true;
    } else {
      mTabController.animateTo(index);//切换Tabbar
    }
  }
  //当整个页面dispose时，记得把控制器也dispose掉，释放内存
  @override
  void dispose() {
    mTabController.dispose();
    super.dispose();
  }
}


class ListItem extends StatefulWidget {
  @override
  _ListItemState createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> with AutomaticKeepAliveClientMixin {
  // keep alive 保持页面状态
  @override
  bool get wantKeepAlive => true;

  ScrollController scrollController = ScrollController();
  bool isScrollTop;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isScrollTop=false;
    scrollController.addListener((){
      if(scrollController.offset>150.0){
        setState(() {
         isScrollTop=true; 
        });
      }else{
        setState(() {
         isScrollTop=false; 
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:isScrollTop? FloatingActionButton(
        onPressed: (){
          scrollController.animateTo(
            0.0,
            curve: Curves.easeOut,
            duration: const Duration(milliseconds: 300),
          );
        },
        child: Icon(Icons.vertical_align_top),
        backgroundColor: Color(0xffd43d3d),
        elevation: 2.0,
        highlightElevation: 2.0
      ):null,
      body: ListView.builder(
                  itemCount: 30,
                  controller: scrollController,
                  itemBuilder: (context,index){
                    return Container(
                      margin: EdgeInsets.symmetric(vertical: 20),
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(
                          width: 1,
                          color: Colors.grey
                        ))
                      ),
                      child: ListTile(
                        leading: Icon(Icons.title),
                        title: Text(
                          index==0?'Draggable实现可拖拽':
                            index==1?'高德地图':
                              index == 2?'右滑返回':
                                index==3?'个人简历':
                                  index ==4?'仿netflix界面':'tab--$index',
                          style:TextStyle(
                            fontSize: 18.0,
                          )
                        ),
                        trailing: Icon(Icons.chevron_right),
                        onTap: (){
                          if(index == 0){
                            //拖拽
                            Application.router.navigateTo(context, '/draggle_grid_view');
                          }else if(index ==1){
                            //高德
                            Application.router.navigateTo(context, '/amap');
                          }else if(index ==2){
                            //右滑返回
                            Navigator.of(context).push(CupertinoPageRoute(
                              builder: (context){
                                return RightBackDemo();
                              }
                            ));
                          }else if(index ==3){
                            //个人简历
                            Application.router.navigateTo(context, '/resume');
                          }else if(index ==4){
                            //仿Netflix
                            Application.router.navigateTo(context, '/netflix');
                          }
                          
                        },
                      ),
                    );
                  },
                ),
    );
  }
}


// class FourthPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title:Text('视频专区')
//       ),
//       body: TabBar(
              // controller: _controller,
              // isScrollable: true,
              // labelColor: Colors.black,
              // labelPadding: EdgeInsets.fromLTRB(20, 0, 10, 5),
              // indicator: UnderlineIndicator(
              //     strokeCap: StrokeCap.round,
              //     borderSide: BorderSide(
              //       color: Color(0xff2fcfbb),
              //       width: 3,
              //     ),
              //     insets: EdgeInsets.only(bottom: 10)),
              // tabs: tabs.map<Tab>((TravelTab tab) {
              //   return Tab(
              //     text: tab.labelName,
              //   );
              // }).toList()
//             ),
//     );
//   }
// }