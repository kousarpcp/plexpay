import 'package:flutter/material.dart';

import '../../../main.dart';
import '../Const/colorConst.dart';

class topUp extends StatefulWidget {
  const topUp({super.key});

  @override
  State<topUp> createState() => _topUpState();
}

class _topUpState extends State<topUp> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Column(
              children: [
                SizedBox(
                  height: width * 0.04,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: width * 0.082,
                    ),
                    Text(
                      "TOP-UP",
                      style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: width * 0.07,
                          color: colorConst.blue),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: width * 0.05,
            ),
          ],
        ),
      ),
    );
  }
}
