import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/main.dart';
import 'package:flutter_app/menu/Home.dart';
import 'package:flutter_app/menu/menu.dart';

import 'package:flutter_app/network/webconstant.dart';
import 'package:flutter_app/util/sizeconfig.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CustomerProfile extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CustomerProfilePage();
  }
}

class CustomerProfilePage extends StatefulWidget {
  CustomerProfilePage() : super();

  @override
  _CustomerProfilePageState createState() => _CustomerProfilePageState();
}



/*Future navigateToSetting(context) async {
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => HomeScreen()));
}*/

Future navigateToLogin(context) async {
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => MyApp()));
}

class _CustomerProfilePageState extends State<CustomerProfilePage> {

  var fullnname = TextEditingController();
  var imageprofile = "";
  var user_id = TextEditingController();
  var htmlUrl = TextEditingController();
  var location = TextEditingController();
  var publicRepos = TextEditingController();
  var followers = TextEditingController();
  var following = TextEditingController();


  @override
  void initState() {
    super.initState();
    _getSession();
  }

  @override
  Widget build(BuildContext context) {
//    debugPrint("Screen Sixe ${SizeConfig.blockSizeVertical}");
//    debugPrint("Screen Sixe ${SizeConfig.safeBlockVertical}");
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text("Profile"),
          actions: <Widget>[
            Padding(
                padding: EdgeInsets.only(
                    left:5,
                    bottom: 0.0,
                    right: 0.0,
                    top: 0.0),
                child: GestureDetector(
                  onTap: () {
                    navigateToLogin(context);
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
        drawer: MenuScreen(),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/bg.png"),
              fit: BoxFit.cover,

            ),
          ),
          alignment: Alignment.center,
          child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: <
              Widget>[
            Expanded(
              flex: 90,
              child: Container(
                height: double.infinity,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              height: 1.0,
                              width: double.infinity,
                              color: Colors.grey,
                              margin: const EdgeInsets.only(
                                  left: 40.0, right: 40.0, bottom: 20.0),
                            ),
                            Text(
                              'PROFILE',
                              style: TextStyle(
                                  fontSize: 18, color: Colors.black), //red
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  left: 0.0, bottom: 20.0, right: 0.0, top: 20.0),
                              width: 320,
                              child: Image.network(
                                  imageprofile,
                                  width: 30, height: 30,fit: BoxFit.contain
                              ),
                            ),


                            Container(
                              margin: EdgeInsets.only(
                                  left: 0.0,
                                  bottom: 0.0,
                                  right: 0.0,
                                  top: 10.0),
                              width: 320,
                              child: Text(
                                'Full name',
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black), //red
                              ),
                            ),
                            Container(
                              width: 320,
                              child:TextField(
                                controller: fullnname,
                                obscureText: false,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),

//                                  labelText: 'Password',
                                ),
                              ),

                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  left: 0.0,
                                  bottom: 0.0,
                                  right: 0.0,
                                  top: 10.0),
                              width: 320,
                              child: Text(
                                'Html URL',
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black), //red
                              ),
                            ),
                            Container(
                              width: 320,
                              child:TextField(
                                enabled: false,
                                controller: htmlUrl,
                                obscureText: false,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),

//                                  labelText: 'Password',
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  left: 0.0,
                                  bottom: 0.0,
                                  right: 0.0,
                                  top: 10.0),
                              width: 320,
                              child: Text(
                                'Public Repo',
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black), //red
                              ),
                            ),
                            Container(
                              width: 320,
                              child:TextField(
                                controller: publicRepos,
                                obscureText: false,
                                keyboardType: TextInputType.phone,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),

//                                  labelText: 'Password',
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  left: 0.0,
                                  bottom: 0.0,
                                  right: 0.0,
                                  top: 10.0),
                              width: 320,
                              child: Text(
                                'Followers',
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black), //red
                              ),
                            ),
                            Container(
                              width: 320,
                              child:TextField(
                                controller: followers,
                                obscureText: false,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),

//                                  labelText: 'Password',
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  left: 0.0,
                                  bottom: 0.0,
                                  right: 0.0,
                                  top: 10.0),
                              width: 320,
                              child: Text(
                                'Following',
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black), //red
                              ),
                            ),
                            Container(
                              width: 320,
                              child:TextField(
                                controller: following,
                                obscureText: false,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),

//                                  labelText: 'Password',
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  left: 0.0,
                                  bottom: 0.0,
                                  right: 0.0,
                                  top: 10.0),
                              width: 320,
                            ),

                          ]),
                    ],
                  ),
                ),
              ),
            ),

          ]),
        ));
  }

  Future _getSession() async {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    fullnname.text = await prefs.getString('fullnname');
    imageprofile = await prefs.getString('image');
    user_id.text = await prefs.getInt('user_id').toString();
    htmlUrl.text = await prefs.getString('htmlUrl');
    location.text = await prefs.getString('location');
    publicRepos.text =await prefs.getInt('publicRepos').toString();
    followers.text = await prefs.getInt('followers').toString();
    following.text = await prefs.getInt('following').toString();

    setState(() {
      fullnname;
      imageprofile;
      user_id;
      htmlUrl;
      location;
      publicRepos;
      followers;
      following;
    });

  }
}
