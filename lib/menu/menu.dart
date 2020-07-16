
import 'package:flutter/material.dart';
import 'package:flutter_app/main.dart';
import 'package:flutter_app/menu/Home.dart';
import 'package:flutter_app/menu/profile.dart';
import 'package:flutter_app/network/webconstant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MenuScreen extends StatelessWidget {
  final appTitle = 'Home';

  @override
  Widget build(BuildContext context) {
    return MenuScreenPage();
  }
}

class MenuScreenPage extends StatelessWidget {
  final String title;
  var fullnname = "";
  var imageprofile = "";

  MenuScreenPage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
       Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: Container(
          color: Colors.green,
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding:
            EdgeInsets.only(
                left: 0.0,
                bottom: 0.0,
                right: 0.0,
                top: 0.0),
            children: <Widget>[
              Container(
                  height: 100,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        child: Padding(
                            padding: EdgeInsets.only(
                                left: 40.0,
                                bottom: 40.0,
                                right: 20.0,
                                top: 40.0),
                          child: Image.network(
                              WebConstant.USER_IMG,
                              width: 30, height: 30,fit: BoxFit.contain
                          )),
                      ),
                      Container(
                        child: Text(
                          WebConstant.USER_NAME,
                          style: TextStyle(
                              fontSize: 12, color: Colors.white), //red
                        ),
                      ),
                    ],
                  )),
              GestureDetector(
//                onTap: () => print("Container pressed"),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushReplacement(context,
                      new MaterialPageRoute(builder: (ctxt) => new HomeScreen()));
                },
                child: Container(
                    height: 60,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                child: Padding(
                                    padding: EdgeInsets.only(
                                        left: 20.0,
                                        bottom: 0.0,
                                        right: 20.0,
                                        top: 0.0),
                                    child: Image.asset(
                                        'assets/images/home.png',
                                        width: 15,
                                        height: 15)),
                              ),
                              Container(
                                child: Text(
                                  'Home',
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.white), //red
                                ),
                              ),
                            ]),
                        Container(
                          height: 1.0,
                          width: double.infinity,
                          color: Colors.white,
                          margin: const EdgeInsets.only(
                              left: 20.0, right: 40.0, bottom: 0.0, top: 20.0),
                        ),
                      ],
                    )),
              ),
              GestureDetector(
//                onTap: () => print("Container pressed"),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushReplacement(context,
                      new MaterialPageRoute(builder: (ctxt) => new CustomerProfile()));
                },
                child: Container(
                    height: 60,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                child: Padding(
                                    padding: EdgeInsets.only(
                                        left: 20.0,
                                        bottom: 0.0,
                                        right: 20.0,
                                        top: 0.0),
                                    child: Image.asset(
                                        'assets/images/user.png',
                                        width: 15,
                                        height: 15)),
                              ),
                              Container(
                                child: Text(
                                  'Profile',
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.white), //red
                                ),
                              ),
                            ]),
                        Container(
                          height: 1.0,
                          width: double.infinity,
                          color: Colors.white,
                          margin: const EdgeInsets.only(
                              left: 20.0, right: 40.0, bottom: 0.0, top: 20.0),
                        ),
                      ],
                    )),
              ),

              GestureDetector(
//                onTap: () => print("Container pressed"),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushReplacement(context,
                      new MaterialPageRoute(builder: (ctxt) => new MyApp()));
                },
                child: Container(
                    height: 60,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                child: Padding(
                                    padding: EdgeInsets.only(
                                        left: 20.0,
                                        bottom: 0.0,
                                        right: 20.0,
                                        top: 0.0),
                                    child: Image.asset(
                                        'assets/images/logoutblk.png',
                                        width: 15,
                                        height: 15)),
                              ),
                              Container(
                                child: Text(
                                  'Logout',
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.white), //red
                                ),
                              ),
                            ]),
                        Container(
                          height: 1.0,
                          width: double.infinity,
                          color: Colors.white,
                          margin: const EdgeInsets.only(
                              left: 20.0, right: 40.0, bottom: 0.0, top: 20.0),
                        ),
                      ],
                    )),
              ),
              /*ListTile(
                title: Text('Item 2'),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),*/
            ],
          ),
        ),
      );
  }
}
