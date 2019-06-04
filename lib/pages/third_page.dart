import 'package:flutter/material.dart';

class ThirdPage extends StatelessWidget {

  final _tabs = <String>['taba','tabb'];
  final colors = <Color>[Colors.red,Colors.green,Colors.blue,Colors.pink,Colors.yellow,Colors.deepPurple];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: _tabs.length,
        child: NestedScrollView(
          //外部滚动显示
          headerSliverBuilder: (context,innerScrolled)=><Widget>[
            //这个上面是官方专门为了解决我们今天主角 NestedScrollView**中固定组件对身体里面Scroll状态影响的
            SliverOverlapAbsorber(
              //此小部件采用SliverAppBar的重叠行为，
//并将其重定向到下面的SliverOverlapInjector。如果是
//缺少，那么嵌套的“内部”滚动视图是可能的
//下面最终在SliverAppBar下面甚至在内部
//滚动视图认为它尚未滚动。
//如果只构建“headerSliv​​erBuilder”，则不需要这样做
//与下一个条子不重叠的小部件。
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              child: SliverAppBar(
                pinned: true,
                title:Text('在座的各位都是垃圾',style:TextStyle(
                  // color: Colors.red.withOpacity(.9)
                )),
                expandedHeight: 200.0,
                // appbar 背景
                flexibleSpace: FlexibleSpaceBar(
                  background:Image.network('http://pic133.nipic.com/file/20170621/25205625_194217137000_2.jpg',fit:BoxFit.cover),
                  
                ),
                bottom: TabBar(tabs:_tabs.map((tab)=>Text(tab,style:TextStyle(
                  fontSize: 18
                ))).toList()),
                // forceElevated：innerBoxIsScrolled,
                forceElevated: innerScrolled,//阴影   
                //“innerBoxIsScrolled”参数为true时为true 
                //内部滚动视图滚动超出其“零”点，即
                //当它似乎在SliverAppBar下方滚动时。
                //如果没有这个，就会出现阴影出现的情况
                //或者不恰当地出现，因为SliverAppBar是
                //实际上并没有意识到内在的准确位置
                //滚动视图。
              ),
            )
          ],
          body: TabBarView(
            // 这边需要通过 Builder 来创建 TabBarView 的内容，否则会报错
// NestedScrollView.sliverOverlapAbsorberHandleFor must be called with a context that contains a NestedScrollView.
            children:_tabs.map((tab)=>Builder(
              builder:(context)=>CustomScrollView(
                //保证唯一性
                key:PageStorageKey<String>(tab),
                slivers: <Widget>[
                  //将子部件通 sliverappbar 重叠部分顶出来 否则会遮挡
                  //跟上面对应
                  SliverOverlapInjector(
                    handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                  ),
                  SliverGrid(
                    delegate: SliverChildBuilderDelegate(
                      (_,index)=>Image.network('https://p0.ssl.qhimgs1.com/sdr/400__/t01e5701c63ea56a6aa.jpg',width: 50,height: 50),
                      childCount: 8
                    ),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      mainAxisSpacing: 10.0,
                      crossAxisSpacing: 10.0
                    ),
                    
                  ),
                  //在此示例中，内部滚动视图具有
                  //固定高度列表项，因此使用
                  // SliverFixedExtentList。但是，人们可以使用任何一个
                  //这里的sliver小部件，例如SliverList或SliverGrid。
                  SliverFixedExtentList(
                      delegate: SliverChildBuilderDelegate(
                        (_,index)=>Container(
                          child: Text('${tab} - ${index + 1}',style:TextStyle(
                            fontSize: 20.0,color: colors[index%6]
                          )),
                          alignment: Alignment.center,
                        ),
                      childCount: 15
                      ),
                      itemExtent: 50.0,//此示例中的项目固定gao为50像素
                    )
                ],
              )
            )).toList()
          ),
        ),
      ),
    );
  }
}