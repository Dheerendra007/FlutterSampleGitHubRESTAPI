import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'bean/loginresponse.dart';
import 'menu/home.dart';
import 'network/webconstant.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

Future navigateToHomePage(context) async{
   Navigator.push(context,MaterialPageRoute(builder: (context)=>HomeScreen()));
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
var _userNameController = TextEditingController();

/*  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }*/

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(flex: 10,
            child: Container(height: double.infinity,
            child: SingleChildScrollView(
              child: Column(crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(padding: EdgeInsets.only(left:0.0,right: 0.0,bottom:0.0,top: 50.0),
                  child: Text("Login user",style: TextStyle(fontSize: 18,color: Colors.black)),),

                Container(
                  margin: EdgeInsets.only(left:0.0,right: 0.0,bottom:0.0,top: 50.0),
                  width: 320,
                  height: 70,
                  child: TextField(controller: _userNameController,
                  obscureText: false,
                  decoration: InputDecoration(border: OutlineInputBorder()),),
                ),
              ]),
            ))
            ),
            Expanded(
                flex: 20,
                child: Container(
                    margin: EdgeInsets.only(left:0.0,right: 0.0,bottom:350.0,top: 0.0),
                    width: 320,
                    height: 70,
                    color: Colors.green,
                    child: FlatButton(
                      onPressed: () {
                        if (_onValidate()) {
                          loginService().then((user) {
                            navigateToHomePage(context);
                          });
                        }
//                  navigateToSubPage(context);
                      },
                      child: Text(
                        "LOGIN",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "bold"),
                      ),
                    )
                )),

              ]
            )
           /* Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),*/

    // This trailing comma makes auto-formatting nicer for build methods.
    ));
  }
  bool _onValidate() {
    if (_userNameController.text == "") {
      Fluttertoast.showToast(
          msg: "Please enter email id",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIos: 1,
          backgroundColor: Colors.grey,
          textColor: Colors.black,
          fontSize: 16.0);
      return false;
    } else {
      return true;
    }
  }

  Future<LoginResponse> loginService() async {
    _onLoading();
    http.Response res = await http.get(WebConstant.LOGIN_API+ _userNameController.text);

    debugPrint("SIGNIN:-------" + res.body);
    popDialog();
    try {
        final jsonData = json.decode(res.body);
        var map = Map<String, dynamic>.from(jsonData);
          var loginRes = LoginResponse.fromJson(map);
          WebConstant.USER_ID = loginRes.id;
          WebConstant.USER_NAME= loginRes.name;
          WebConstant.USER_IMG= loginRes.avatarUrl;
          _incrementCounter(loginRes);
          return loginRes;
    } catch (e) {
      debugPrint("Exceptioin:---" + e);
    }
  }

  void _onLoading() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => SpinKitCircle(
        itemBuilder: (_, int index) {
          return DecoratedBox(
            decoration: BoxDecoration(
              color: index.isEven ? Colors.white : Colors.amberAccent,
              // color: Colors.white,
            ),
          );
        },
      ),
    );
  }

  void popDialog() {
    Navigator.of(context, rootNavigator: true).pop('dialog');
  }
  _incrementCounter(LoginResponse loginRes) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('fullnname', loginRes.name);
    await prefs.setString('image', loginRes.avatarUrl);
    await prefs.setString('htmlUrl', loginRes.htmlUrl);
    await prefs.setInt('user_id', loginRes.id);
    await prefs.setString('location', loginRes.location);
    await prefs.setInt('publicRepos', loginRes.publicRepos);
    await prefs.setInt('followers', loginRes.followers);
    await prefs.setInt('following', loginRes.following);

  }
}
