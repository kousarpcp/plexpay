import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../main.dart';
import 'imageConst.dart';

class refundHistory extends StatefulWidget {
  const refundHistory({super.key});

  @override
  State<refundHistory> createState() => _refundHistoryState();
}

class _refundHistoryState extends State<refundHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            height: width * 0.05,
            width: width * 0.08,
            child: Padding(
              padding: EdgeInsets.all(width * 0.03),
              child: SvgPicture.asset(
                ImageConst.back,
              ),
            ),
          ),
        ),
        title: Text(
          "Refund History",
          style: TextStyle(fontSize: width * 0.06, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
