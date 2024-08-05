import 'package:flutter/material.dart';

import '../../../main.dart';

class page1 extends StatefulWidget {
  const page1({super.key});

  @override
  State<page1> createState() => _page1State();
}

class _page1State extends State<page1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text("page1",style: TextStyle(fontSize: width*0.15,fontWeight: FontWeight.w600),))
        ],
      ),
    );
  }
}
