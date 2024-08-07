import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:plexpay/featurs/details%20adding/Const/NetWork.dart';
import 'package:plexpay/featurs/details%20adding/screen/blank1.dart';
import 'package:plexpay/featurs/details%20adding/Const/colorConst.dart';
import 'package:plexpay/featurs/details%20adding/screen/offer_details.dart';
import 'package:plexpay/featurs/details%20adding/screen/etisalat_offer.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

import '../../../main.dart';
import '../Api/RechargeApi.dart';
import '../Api/VoucherIntRecharge.dart';
import '../Const/Snackbar_toast_helper.dart';
import 'PrintPage.dart';
import 'imageConst.dart';

class reacharge extends StatefulWidget {

  const reacharge({super.key, required this.number, required this.text, required this.amount});
  final String number;
  final String text;
  final String amount;

  @override
  State<reacharge> createState() => _reachargeState();
}

class _reachargeState extends State<reacharge> {

  var isTap = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // widget.AED;
    // a=widget.AED;
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: isTap == true
            ? Container()
            : InkWell(
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
      ),
      body: Column(
        children: [
          Container(
            height: width * 0.9,
            width: width * 0.9,
            child: Lottie.asset(
              "assets/images/Animation - 1721449650090.json",
            ),
            decoration: BoxDecoration(
              // color: Colors.black,
              borderRadius: BorderRadius.circular(width * 0.03),
            ),
          ),
          ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                      height: width * 0.742,
                      width: width * 1,
                      decoration: BoxDecoration(
                          color: colorConst.lightgrey1,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(width * 0.06),
                              topLeft: Radius.circular(width * 0.06))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Confirm your Recharge?",
                            style: TextStyle(
                                fontSize: width * 0.063,
                                fontWeight: FontWeight.w900,
                                color: colorConst.blue),
                          ),
                          SizedBox(
                            height: width * 0.03,
                          ),

                          SizedBox(
                            height: width * 0.03,
                          ),
                          Text(
                            "Please Confirm your recharge of",
                            style: TextStyle(
                                fontSize: width * 0.042,
                                color: colorConst.grey,
                                fontWeight: FontWeight.w500),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("number",
                                  style: TextStyle(
                                      fontSize: width * 0.042,
                                      color: colorConst.grey,
                                      fontWeight: FontWeight.w500)),
                              Text(" +971${widget.number}",
                                  style: TextStyle(
                                      fontSize: width * 0.042,
                                      color: colorConst.grey,
                                      fontWeight: FontWeight.w500)),
                              Text(" of",
                                  style: TextStyle(
                                      fontSize: width * 0.042,
                                      color: colorConst.grey,
                                      fontWeight: FontWeight.w500)),
                              Text(" ${widget.text} ${widget.amount}",
                                  style: TextStyle(
                                      fontSize: width * 0.042,
                                      color: colorConst.grey,
                                      fontWeight: FontWeight.w500)),
                              Text(
                                " by",
                                style: TextStyle(
                                    fontSize: width * 0.042,
                                    color: colorConst.grey,
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                          Text(
                            "Etisalat UAE",
                            style: TextStyle(
                                fontSize: width * 0.042,
                                color: colorConst.grey,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: width * 0.08,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              isTap == true
                                  ? Container()
                                  : InkWell(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: Container(
                                        height: width * 0.12,
                                        width: width * 0.3,
                                        decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.grey),
                                            borderRadius: BorderRadius.circular(
                                                width * 0.035)),
                                        child: Center(
                                            child: Text(
                                          "Cancel",
                                          style: TextStyle(
                                              fontSize: width * 0.055,
                                              color: Colors.blue,
                                              fontWeight: FontWeight.w500),
                                        )),
                                      ),
                                    ),
                              isTap == true
                                  ? Container(
                                      height: width * 0.1,
                                      child: Center(
                                          child: CircularProgressIndicator(
                                        strokeWidth: width * 0.01,
                                      )),
                                    )
                                  : InkWell(
                                      onTap: () async {
                                        setState(() {
                                          isTap = true;
                                        });
                                        Future.delayed(
                                            const Duration(seconds: 1), () {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                              backgroundColor:
                                              Colors.black,
                                              content: Text(
                                                  "Recharge failed ")));

                                          // setState(() {
                                          setState(() {
                                            // });
                                          });
                                        });
                                      },
                                      child: Container(
                                        height: width * 0.12,
                                        width: width * 0.3,
                                        decoration: BoxDecoration(
                                            color: Colors.indigo,
                                            borderRadius: BorderRadius.circular(
                                                width * 0.035)),
                                        child: Center(
                                            child: Text(
                                          "Confirm",
                                          style: TextStyle(
                                              fontSize: width * 0.055,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500),
                                        )),
                                      ),
                                    ),
                            ],
                          ),
                          SizedBox(
                            height: width * 0.07,
                          ),
                        ],
                      ),
                    )
                  ],
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  width: width * 0.01,
                );
              },
              itemCount: 1)
        ],
      ),
    );
  }
}
