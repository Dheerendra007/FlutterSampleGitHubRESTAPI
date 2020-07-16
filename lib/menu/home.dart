import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/bean/repores.dart';
import 'package:flutter_app/main.dart';
import 'package:flutter_app/menu/menu.dart';
import 'package:flutter_app/network/webconstant.dart';
import 'package:flutter_app/util/sizeconfig.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return HomeScreenPage();
  }
}

class HomeScreenPage extends StatefulWidget {
  HomeScreenPage() : super();

  @override
  _HomeScreenPageState createState() => _HomeScreenPageState();
}

Future navigateToSetting(context) async {
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => MyApp()));
}
/*
Future navigateToMapScreen(context, Datum datum) async {
  Navigator.push(context, MaterialPageRoute(builder: (context) => MapScreenPage(datumItem:datum)));
}
*/

class _HomeScreenPageState extends State<HomeScreenPage> {
  int _counter = 0;
  String dropdownValue = 'English';
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    setState(() {
      getRepoService();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Home"),
          actions: <Widget>[
            Padding(
                padding: EdgeInsets.only(
                    left:5,
                    bottom: 0.0,
                    right: 0.0,
                    top: 0.0),
                child: GestureDetector(
                  onTap: () {
                    navigateToSetting(context);
                  },
                  child: Image.asset(
                      'assets/images/logout.png',
                      height:
                      30,
                      width:
                      30),
                )),
          ],
    ),
        key: _scaffoldKey,
        drawer: MenuScreen(),
        body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/bg.png"),
                fit: BoxFit.cover,
              ),
            ),
            alignment: Alignment.center,
            child: PageView(
              children: <Widget>[
                Container(
                  color: Colors.pink,
              child: Text(WebConstant.REPO_SUMMARY,style: TextStyle(fontSize: 18,color: Colors.black))
                ),
                Container(
                  color: Colors.cyan,
                ),
                Container(
                  color: Colors.deepPurple,
                ),
              ],
            ),
        ));
  }

  Future<RepoResponse> getRepoService() async {
//    _onLoading();
    http.Response res = await http.get(WebConstant.REPO_API);

    debugPrint("SIGNIN:-------" + res.body);
//    popDialog();
    try {
      final jsonData = json.decode(res.body);
      var map = Map<String, dynamic>.from(jsonData);
      var reposRes = RepoResponse.fromJson(map);
      WebConstant.REPO_SUMMARY = reposRes.description;
      return reposRes;
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
}
