import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import './index_page.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  String _username = '';
  String _password = '';
  List<Map> loginMethods = [
    {'icon':Icons.web,'title':'111'},
    {'icon':Icons.queue,'title':'222'},
    {'icon':Icons.warning,'title':'333'},
  ];

  bool isTap = false;
  bool _isObscure=true;
  var _eyeColor = Colors.grey;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    rememberPwd();

    return Scaffold(
      body: ListView(
        children: <Widget>[
          MyTitle(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 50,vertical: 20),
            margin: EdgeInsets.only(top:50),
            child: Form(
              key: _formKey,
              child:Column(
                children: <Widget>[
                  userInput(),
                  psdInput(),
                  loginBtn(),
                  anotherLogin()
                ],
              ) ,
            ),
          )
        ],
      )
    );
  }

  //title
  Widget MyTitle(){
    return Container(
      padding: EdgeInsets.all(28.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Login',style: TextStyle(
            fontSize: 62.0
          ),),
          Container(
            height: 4,
            width: 100,
            color:Colors.black,
          )
        ],
      )
    );
  }

 //用户名输入框
  Widget userInput(){
    return Container(
      margin: EdgeInsets.only(bottom: 30),
      child: TextFormField(
        onSaved: (String value){
          _username = value;
        },
        initialValue: _username,
        decoration: InputDecoration(
          prefixIcon: Icon(
            IconData(
              0xe677,
              fontFamily: 'iconfont'
            ),
            size: 40,
          ),
          labelText: '请输入您的邮箱',
          labelStyle: TextStyle(
            fontSize: 24
          ),
        ),
        validator: (String value){
          var emailReg = RegExp(
            r"[\w!#$%&'*+/=?^_`{|}~-]+(?:\.[\w!#$%&'*+/=?^_`{|}~-]+)*@(?:[\w](?:[\w-]*[\w])?\.)+[\w](?:[\w-]*[\w])?");
          if (!emailReg.hasMatch(value)) {
            return '请输入正确的邮箱地址';
          }
        },
      ),
    );
  }
 
 
 //密码输入框
  Widget psdInput(){
    
    return Container(
      child: TextFormField(
        onSaved: (String value){
          _password = value;
        },
        initialValue: _password,
        decoration: InputDecoration(
          prefixIcon: Icon(
            IconData(
              0xe615,
              fontFamily: 'iconfont'
            ),
            size: 40,
          ),
          labelText: '请输入密码',
          labelStyle: TextStyle(
            fontSize: 24
          ),
          suffixIcon: IconButton(
            icon: Icon(Icons.remove_red_eye),
            color: _eyeColor,
            onPressed: (){
              setState(() {

               _isObscure = !_isObscure;

              _eyeColor=_isObscure?Colors.grey:Colors.lightBlue; 
              });
            },
          )
        ),
        obscureText: _isObscure, // 判断 是隐藏显示
        validator: (String value){
          if(value.isEmpty){
            return '请输入密码';
          }else if(value.length<4){
            return '密码至少四位';
          }
        },
      ),
    );
  }

  //登录
  Widget loginBtn(){
    return Container(
      margin: EdgeInsets.only(top: 30),
      width: 500,
      height: 50,
      child: RaisedButton(
        onPressed: goinside,
        child: Text('登录',style: Theme.of(context).primaryTextTheme.headline),
        color: Colors.lightBlue,
        shape: StadiumBorder(
          side: BorderSide(color:Colors.white),
          
        ),
      ),
    );
  }

  //其他登录
  Widget anotherLogin(){
    return Container(
      height: 300,
      width: 500,
      child: ButtonBar(
        alignment: MainAxisAlignment.center,
        children: loginMethods.map((item)=>Builder(builder: (context){
          return IconButton(
            color: Colors.orange[200],
            icon: Icon(item['icon'],color: Colors.grey,size: 40,),
            onPressed: (){
              //TODO : 第三方登录方法
                Scaffold.of(context).showSnackBar(new SnackBar(
                  content: new Text("${item['title']}登录"),
                  action: new SnackBarAction(
                    label: "取消",
                    onPressed: () {},
                  ),
                ));
            },
          );
        },)).toList(),
      ),
    );
  }

  //路由登陆
  void goinside() async{
    var _form = _formKey.currentState;

    if (_form.validate()) {
      _form.save();
      //存用户名密码
      SharedPreferences prefs = await SharedPreferences.getInstance();

      prefs.setString('username', _username);
      prefs.setString('password', _password);

      showDialog(
        context: context,
        child: Loading()
      );
    }
    Future.delayed(Duration(seconds: 3)).then((val){
        // Navigator.pop(context);
        Navigator.pushAndRemoveUntil(context,new MaterialPageRoute(
          builder: (BuildContext context) {
            return RootScene();
          }), 
          (route) => route == null);

      });
  }

  //记住密码自动登录
  void rememberPwd() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(prefs.getString('username')!=null){
      setState(() {
       _username= prefs.getString('username');
      });
    }
    if(prefs.getString('password')!=null){
      setState(() {
       _password= prefs.getString('password');
      });
    }
    
    if(prefs.getString('password')!=null && prefs.getString('username')!=null){
      
      Navigator.pushAndRemoveUntil(context,new MaterialPageRoute(
        builder: (BuildContext context) {
          return RootScene();
        }), 
        (route) => route == null);

    }
    
  }
}


class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
                
                child: Center(
                  
                  child: Container(
                    padding: EdgeInsets.all(15.0),
                    width: 120,
                    height: 120,
                    decoration:BoxDecoration(
                      color:Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(8.0))
                    ),
                    child:Column(
                      children: <Widget>[
                        CircularProgressIndicator(),
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            child: Text('加载中...',style:TextStyle(
                              fontSize:12.0,
                              color: Colors.lightBlue,
                              decoration: TextDecoration.none
                            )),
                          ),
                        )
                      ],
                    ),
                  )
                ),
              );
  }
}

