import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:plexpay/featurs/details%20adding/screen/BottomNavigation.dart';

import '../Const/SharedPref.dart';
import 'loginPage.dart';

class CloseScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<CloseScreen> {
  var currentLoc = "";

  @override
  void initState() {
    super.initState();
    SystemNavigator.pop();
    //_loadWidget();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Center(
          //   child: Image.asset(
          //     'assets/images/logo.png',
          //     // fit: BoxFit.cover,
          //     width: MediaQuery.of(context).size.width * 0.6,
          //   ),
          // ),
          // Positioned(
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       CircularProgressIndicator(),
          //     ],
          //   ),
          //   left: 100,
          //   right: 100,
          //   bottom: MediaQuery.of(context).size.height * 0.14,
          // )
        ],
      ),
    );
  }

  _loadWidget() async {
    var _duration = Duration(seconds: 4);

    var prefs = await getSharedPrefrence('userId');
    var token = await getSharedPrefrence('token');
    var name = await sharedPrefrence("dash", "0");
    print("strId");
    print(token);
    print(prefs);
    // if(strId != null){
    return Timer(
        Duration(seconds: 1), prefs == null ? navigationLogin : navigationHome);
    // }
    // else{
    //   return Timer(Duration(seconds: 4), navigationLogin);
    // }
    return Timer(_duration, navigationLogin);
  }

  void navigationLogin() {
    // Navigator.pushReplacement(context,
    //     MaterialPageRoute(builder: (BuildContext context) => NewLogin()));
  }

  void navigationHome() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => BottomNavigation()),
    );
  }
}
