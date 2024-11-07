import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../Const/imageConst.dart';
import '../../../main.dart';

class XpayComingsoon extends StatelessWidget {
  const XpayComingsoon({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                height: height*0.4,
                width: width*0.7,
                child: Center(
                  child:Lottie.asset(ImageConst.loading),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
