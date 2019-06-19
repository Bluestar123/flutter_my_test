import 'package:flutter/material.dart';
import '../../generated/i18n.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ResumeDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(S.of(context).resume),
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
            icon: Icon(FontAwesomeIcons.commentDots,color: Colors.black54,),
            onPressed: (){

            },
          ),
          IconButton(icon: Icon(Icons.more_vert),color: Colors.black54,onPressed: (){

          },)
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 15.0,),
            _builderHeader(),
            Container(
              margin: EdgeInsets.all(16.0),
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.grey.shade200
              ),
              child: Text('两年前端开发经验，vue技术栈,uni-app开发移动端，PC+APP+H5+微信公众号;了解express框架'),
            ),
            _builderTitle('Skills'),
            SizedBox(height: 10.0,),
            _builderSkillRow('vue',0.8),
            SizedBox(height: 10.0,),
            _builderSkillRow('javascript',0.75),
            SizedBox(height: 10.0,),
            _builderSkillRow('uni-app',0.75),
            SizedBox(height: 10.0,),
            _builderSkillRow('html, css',0.7),
            SizedBox(height: 10.0,),
            _builderSkillRow('Flutter',0.5),
            SizedBox(height: 10.0,),
            _builderSkillRow('nodejs',0.4),
            SizedBox(height: 40.0,),
            _builderTitle('Experience'),
            _buildExperienceRow(company:'北京蓝海华腾科技有限公司',position:'前端开发工程师',duration:'2017-current'),
            SizedBox(height: 20.0,),
            _builderTitle('Education'),
            SizedBox(height: 5.0,),
            _buildExperienceRow(company:'YAN SHAN UNIVERCITY',position:'Mechanical design and manufacturing and automation',duration:'2013-2017'),

            SizedBox(height: 5.0,),
            _builderTitle('Contact'),
            ListTile(
              leading: Padding(
                padding: EdgeInsets.only(top: 3.0,left:20.0),
                child: Icon(Icons.email),
              ),
              title: Text('m18712722321@163.com'),
            ),
            ListTile(
              leading: Padding(
                padding: EdgeInsets.only(top: 3.0,left:20.0),
                child: Icon(Icons.phone),
              ),
              title: Text('12345678910'),
            ),
            _buildSocials(),
            SizedBox(width: 20,),
          ],
        ),
      ),
    );
  }

  //顶部信息
  Widget _builderHeader(){
    return Row(
              children: <Widget>[
                Container(
                  width: 80.0,
                  height: 80.0,
                  margin: EdgeInsets.symmetric(horizontal: 20.0),
                  child: CircleAvatar(
                    radius: 40.0,
                    backgroundColor: Colors.grey,
                    child: CircleAvatar(
                      radius: 35.0,
                      backgroundImage: AssetImage('images/resume/7.jpg'),
                    ),
                  ),
                ),
                
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Aaron',style:TextStyle(
                      fontSize:18.0,
                      fontWeight:FontWeight.bold
                    )),
                    Text('前端开发工程师'),
                    Row(children: <Widget>[
                      Icon(FontAwesomeIcons.map,size: 12.0,color: Colors.grey,),
                      SizedBox(width: 10.0,),
                      Text('黑龙江省哈尔滨市',style:TextStyle(
                        color: Colors.black54
                      ))
                    ],)
                  ],
                ),
              ],
            );
  }

  //title 信息
  Widget _builderTitle(String title){
    return Container(
              padding: EdgeInsets.only(left: 16.0,bottom: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(title.toUpperCase(),style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold
                  )),
                  Divider(color: Colors.black54)
                ],
              ),
            );
  }

  //详细说明
  Widget _builderSkillRow(String skill,double level){
    return Row(
              children: <Widget>[
                SizedBox(width: 16.0,),
                Expanded(
                  flex: 2,
                  child: Text(skill,textAlign: TextAlign.right,),
                ),
                SizedBox(width: 10.0,),
                Expanded(
                  flex: 5,
                  child: LinearProgressIndicator(
                    value: level,
                  ),
                ),
                SizedBox(width: 16.0,),
              ],
            );
  }

  //experience
  Widget _buildExperienceRow({company,position,duration}){
    return ListTile(
              leading: Padding(
                padding: EdgeInsets.only(top: 8.0,left: 20.0),
                child: Icon(FontAwesomeIcons.solidCircle,size: 12.0,color: Colors.black54,),
              ),
              title: Text(company,style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold
              ),),
              subtitle: Text('$position ($duration)')
    );
  }

  //socials
  Widget _buildSocials(){
    return Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(width: 20,),
                IconButton(
                  iconSize: 20.0,
                  color: Colors.indigo,
                  icon: Icon(FontAwesomeIcons.facebookF),
                  onPressed: (){
                    _launchURL('https://www.bilibili.com/video/av55251444');
                  },
                ),
                SizedBox(width: 5,),
                IconButton(
                  iconSize: 20.0,
                  color: Colors.indigo,
                  icon: Icon(FontAwesomeIcons.github),
                  onPressed: (){
                    _launchURL('https://github.com/2');
                  },
                ),
                SizedBox(width: 5,),
                IconButton(
                  iconSize: 20.0,
                  color: Colors.indigo,
                  icon: Icon(FontAwesomeIcons.youtube),
                  onPressed: (){
                    _launchURL('https://github.com/3');
                  },
                ),
              ],
            );
  }
  
  
  _launchURL(String url) async {

    if(await canLaunch(url)){
      await launch(url);
    }else{
      throw '无法连接 $url';
    }
  }
}