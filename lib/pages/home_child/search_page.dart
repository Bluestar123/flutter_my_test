import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String searchKey = "";
  TextEditingController ctl;

  List<String> data = [
    "AABB",
    "aABB",
    "aBaBBB"
    "Baaa",
    "BBaaa",
    "AAACCC"
  ];


  @override
  void initState() {
    super.initState();
    ctl = TextEditingController();
  }

  List<String> get filtedData {
    return data.where((v) => v.toLowerCase().startsWith(searchKey.toLowerCase())).toList();
  }
  searchBar() {
    return Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
        decoration: BoxDecoration(
            border: Border.all(
                width: 1, color: Colors.deepOrange, style: BorderStyle.solid),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Row(
          children: <Widget>[
            SvgPicture.asset(
              "images/search.svg",
              height: 18,
              color: Colors.black87,
            ),
            Expanded(
              child: TextField(
                maxLines: 1,
                autofocus: true ,
                controller: ctl,
                style: TextStyle(fontSize: 18),
                cursorColor: Colors.deepOrange,
                decoration: InputDecoration(
                    hintText: "请输入搜索内容",
                    contentPadding: EdgeInsets.symmetric(horizontal: 5),
                    border: OutlineInputBorder(
                        gapPadding: 0,
                        borderSide:
                            BorderSide(width: 0, style: BorderStyle.none))),
                onChanged: (value) {
                  setState(() {
                    print(value);
                    searchKey = value;
                  });
                },
              ),
            ),
            Offstage(
              offstage: searchKey.length == 0,
              child: GestureDetector(
                  onTap: (){
                    setState(() {
                      searchKey = "";
                      if(ctl != null) ctl.clear();
                    });
                  },
                  child: Icon(Icons.close, size: 16)
              ),
            )
          ],
        ));
  }


  void dispose() {
    super.dispose();
    ctl.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget ListResult = ListView.builder(itemCount: filtedData.length, itemBuilder: (ctx, i){
      String data = filtedData[i];
      return Container(
        padding: EdgeInsets.all(10),
        child: Text(data),
      );
    });
    if (filtedData.length == 0) ListResult = Center(child: Text("no data"));
    return Scaffold(
      appBar: AppBar(
        title: Text('搜索筛选'),
      ),
      body: SafeArea( //column  使用 expanded 时候使用
        child: Column(
          children: <Widget>[
            searchBar(),
            Expanded(
              child: ListResult
            ),
          ],
        ),
      ),
    );  
  }
}