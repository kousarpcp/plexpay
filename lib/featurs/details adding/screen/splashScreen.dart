import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plexpay/featurs/details%20adding/screen/BottomNavigation.dart';
import 'package:plexpay/Const/colorConst.dart';
import 'package:plexpay/Const/imageConst.dart';
import 'package:plexpay/featurs/details%20adding/screen/plexpay%20authentication/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Const/shared_preference.dart';
import '../../../main.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  bool login = false;

  getData() async {
    var prefs = await getSharedPrefrence('userId');
    var token = await getSharedPrefrence('token');
    var name = await sharedPrefrence("dash", "0");
    print(prefs);
    print("nnnnnnnnnnn");
    Future.delayed(Duration(
        seconds: 1
    )).then((value) => Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context) => prefs==null?Login():BottomNavigation(),)));
    setState(() {

    });
  }
  @override
  void initState() {
    // TODO: implement initState
    getData();
    super.initState();
  }
  Widget build(BuildContext context) {
    return MediaQuery.of(context).size.width > 650?SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Image.asset(ImageConst.plexpay,width: width*0.4,))
          ],
        ),
      ),
    ):SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Image.asset(ImageConst.plexpay,width: width*0.5,))
          ],
        ),
      ),
    );
  }
}
