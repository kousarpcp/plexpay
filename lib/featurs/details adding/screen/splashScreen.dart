import 'package:flutter/material.dart';
import 'package:plexpay/featurs/details%20adding/screen/BottomNavigation.dart';
import 'package:plexpay/featurs/details%20adding/screen/colorConst.dart';
import 'package:plexpay/featurs/details%20adding/screen/imageConst.dart';

import '../../../main.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration(
        seconds: 3
    )).then((value) =>
        Navigator.push(context, MaterialPageRoute(builder: (context) => BottomNavigation(),)));
    super.initState();
  }
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: colorConst.darkblue,
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
