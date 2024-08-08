import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:plexpay/main.dart';

import '../../../Const/colorConst.dart';

class custom extends StatefulWidget {
  const custom({super.key});

  @override
  State<custom> createState() => _customState();
}

class _customState extends State<custom> {
  TextEditingController numController = TextEditingController();
  TextEditingController numController1 = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            SizedBox(
              height: width * 0.12,
            ),
            Center(
              child: Container(
                height: width * 0.12,
                width: width * 0.8,
                child: Stack(children: [
                  Padding(
                    padding: EdgeInsets.only(left: width * 0.66),
                    child: Container(
                      height: width * 0.12,
                      width: width * 0.14,
                      child: Icon(
                        Icons.phone_android,
                        color: Colors.white,
                      ),
                      decoration: BoxDecoration(
                          color: colorConst.blue,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(width * 0.05),
                              bottomRight: Radius.circular(width * 0.05))),
                    ),
                  ),
                  TextFormField(
                    controller: numController,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(9)
                    ],
                    style: TextStyle(
                        fontSize: width * 0.05, fontWeight: FontWeight.w600),
                    decoration: InputDecoration(
                      // labelText: "Number",
                      // label: Text(""),
                      labelStyle: TextStyle(
                          fontSize: width * 0.05,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                      hintText: "    Number Without Country Code",
                      hintStyle: TextStyle(
                        fontSize: width * 0.043,
                        fontWeight: FontWeight.w600,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red,
                        ),
                        borderRadius: BorderRadius.circular(width * 0.05),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                        borderRadius: BorderRadius.circular(width * 0.05),
                      ),
                    ),
                  ),
                ]),
              ),
            ),
            SizedBox(
              height: width * 0.09,
            ),
            Center(
              child: Container(
                height: width * 0.12,
                width: width * 0.8,
                child: Stack(children: [
                  Padding(
                    padding: EdgeInsets.only(left: width * 0.38),
                    child: Container(
                      height: width * 0.12,
                      width: width * 0.42,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                              child: Text(
                            "Recharge Now",
                            style: TextStyle(
                                fontSize: width * 0.05,
                                color: Colors.white,
                                fontWeight: FontWeight.w700),
                          )),
                          Icon(Icons.navigate_next,color: Colors.white,)
                        ],
                      ),
                      decoration: BoxDecoration(
                          color: colorConst.blue,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(width * 0.05),
                              bottomRight: Radius.circular(width * 0.05))),
                    ),
                  ),
                  TextFormField(
                    controller: numController1,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    textAlign: TextAlign.justify,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(5)
                    ],
                    style: TextStyle(
                        fontSize: width * 0.05,
                        fontWeight: FontWeight.w600),
                    decoration: InputDecoration(
                      // labelText: "Number",
                      // label: Text(""),
                      hintText: "   Recharge Amount",
                      hintStyle: TextStyle(
                        fontSize: width * 0.038,
                        fontWeight: FontWeight.w600,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red,
                        ),
                        borderRadius: BorderRadius.circular(width * 0.05),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                        borderRadius: BorderRadius.circular(width * 0.05),
                      ),
                    ),
                  ),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
