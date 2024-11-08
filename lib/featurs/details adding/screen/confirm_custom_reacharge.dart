import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:plexpay/Const/NetWork.dart';
import 'package:plexpay/featurs/details%20adding/screen/Recharge%20bill%20genarate.dart';
import 'package:plexpay/featurs/xpay/screen/xpay_page.dart';
import 'package:plexpay/Const/colorConst.dart';
import 'package:plexpay/featurs/details%20adding/screen/offer_details.dart';
import 'package:plexpay/featurs/details%20adding/screen/offer.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

import '../../../Const/widgets.dart';
import '../../../api/amount_convertion_API.dart';
import '../../../api/planinfoAPI.dart';
import '../../../api/rechargeAPI.dart';
import '../../../api/recharge_local_API.dart';
import '../../../api/voucher_int_recharge_API.dart';
import '../../../main.dart';

import '../../../Const/Snackbar_toast_helper.dart';

import '../../../Const/imageConst.dart';

class ConfirmRechargeCustom extends StatefulWidget {

  const ConfirmRechargeCustom({super.key,   this.number,  this.dash,  this.code, this.amount, this.inr, this.title, });
  final code;
  final number;
  final amount;
  final dash;
  final inr;
  final title;

  @override
  State<ConfirmRechargeCustom> createState() => _ConfirmRechargeCustomState();
}

class _ConfirmRechargeCustomState extends State<ConfirmRechargeCustom> {

  var arrProdList = [];
  var arrBannerList = [];
  var isLoading = false;
  var isTap = false;
  var SendValue ;


  TextEditingController accController = TextEditingController();
  var dash = "0";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    print("xoxoxo");
    print(widget.number);

    if(widget.inr!=null){
      this.getConversion();
    }
    setState(() {


    });
  }
  Future<String> getConversion() async {
    var rsp = await fetchAmountConversionApi(widget.amount);

    setState(() {
      SendValue=rsp['SendValue'].toString();

    });
    return "";
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return MediaQuery.of(context).size.width > 650?
    Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: isLoading==true?Center(
        child: Container(
          width:width*0.2,
          height: height*0.2,
          child: Center(child: Lottie.asset(ImageConst.loading1))
          ,
        ),
      ):Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: height * 0.4,
            width: width * 0.8,
            child: Lottie.asset(
              "assets/images/Animation - 1721449650090.json",
            ),
            decoration: BoxDecoration(
              // color: Colors.black,
              borderRadius: BorderRadius.circular(width * 0.03),
            ),
          ),
          Text(
            "Confirm your Recharge?",
            style: TextStyle(
                fontSize: width * 0.025,
                fontWeight: FontWeight.w900,
                color: colorConst.blue),
          ),
          widget.title!=null?Text(
            "Receivable amount : "+widget.title.toString(),
            style: TextStyle(
                fontSize: height * 0.01,
                color: colorConst.blue,
                fontWeight: FontWeight.bold),
          ):Container(),
          SendValue!=null?Text(
            "Send amount : AED "+SendValue.toString(),
            style: TextStyle(
                fontSize: height * 0.01,
                color: colorConst.blue,
                fontWeight: FontWeight.bold),
          ):Container(),
          SizedBox(
            height: 7,
          ),
          Container(
            width: width*0.8,
            height: height*0.15,
            child:Text(
              "Please confirm your recharge of number "+widget.number.toString() +" of "+ widget.amount +(widget.inr!=null?" INR":" AED "),
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: width * 0.02,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5),
            ),
          ),
          InkWell(
            onTap: () async {
              setState(() {
                isTap = true;
              });
              var rsp;

              await RechargeLocalApi(widget.code,widget.number,widget.amount,widget.dash);

              if(rsp != 0 && rsp['status'] == true){
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        backgroundColor: Colors.white,
                        surfaceTintColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.circular(width * 0.05)),
                        content: Container(
                          height: height * 0.5,
                          width: width * 1,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                              BorderRadius.circular(width * 0.03)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Lottie.asset(ImageConst.lottie1),
                              Text(
                                "Recharge Successfull!!",
                                style:
                                TextStyle(fontSize: width * 0.045),
                              ),

                            ],
                          ),
                        ),
                      );
                    });
                Future.delayed(
                    const Duration(seconds: 1), () {
                }).then((value) {
                  Navigator.pushAndRemoveUntil(context, CupertinoPageRoute(builder: (context) => bill(
                    id: rsp['transaction_id'].toString(),type: "HOME",
                  ),),ModalRoute.withName("/"));
                },);

              }else{
                showToast("Recharge failed!!");
                Navigator.pop(context);
              }

            },
            child: isTap?CircularProgressIndicator():
            Container(
              height: height * 0.07,
              width: width * 0.9,
              decoration: BoxDecoration(
                  color: colorConst.blue,
                  borderRadius: BorderRadius.circular(
                      width * 0.06)),
              child: Center(
                  child: Text(
                    "Confirm",
                    style: TextStyle(
                        fontSize: width * 0.02,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  )),
            ),
          ),
          SizedBox(height: height*0.01),
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              height: height * 0.07,
              width: width * 0.9,
              decoration: BoxDecoration(
                  border:
                  Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(
                      width * 0.06)),
              child: Center(
                  child: Text(
                    "Cancel",
                    style: TextStyle(
                        fontSize: width * 0.02,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
                  )),
            ),
          ),
        ],
      ),
    ):
      Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          scrolledUnderElevation: 0,
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        body: isLoading==true?Container(
          margin: EdgeInsets.only(
              bottom: width*0.05,
              left: width*0.05,
              right: width*0.05
          ),
          child: Center(child: Lottie.asset(ImageConst.loading1))
          ,
        ):Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: height * 0.3,
              width: width * 0.8,
              child: Lottie.asset(
                "assets/images/Animation - 1721449650090.json",
              ),
              decoration: BoxDecoration(
                // color: Colors.black,
                borderRadius: BorderRadius.circular(width * 0.03),
              ),
            ),
        Text(
          "Confirm your Recharge?",
          style: TextStyle(
              fontSize: width * 0.05,
              fontWeight: FontWeight.w900,
              color: colorConst.blue),
        ),
        widget.title!=null?Text(
          "Receivable amount : "+widget.title.toString(),
          style: TextStyle(
              fontSize: height * 0.025,
              color: colorConst.blue,
              fontWeight: FontWeight.bold),
        ):Container(),
        SendValue!=null?Text(
          "Send amount : AED "+SendValue.toString(),
          style: TextStyle(
              fontSize: height * 0.025,
              color: colorConst.blue,
              fontWeight: FontWeight.bold),
        ):Container(),
        SizedBox(
          height: 7,
        ),
        Container(
          width: width*0.8,
          height: height*0.15,
          child:Text(
            "Please confirm your recharge of number "+widget.number.toString() +" of "+ widget.amount +(widget.inr!=null?" INR":" AED "),
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: width * 0.045,
                color: Colors.black,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5),
          ),
        ),
            InkWell(
              onTap: () async {
                setState(() {
                  isTap = true;
                });
                var rsp;



                if(rsp != 0 && rsp['status'] == true){
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          backgroundColor: Colors.white,
                          surfaceTintColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.circular(width * 0.05)),
                          content: Container(
                            height: height * 0.5,
                            width: width * 1,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                BorderRadius.circular(width * 0.03)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Lottie.asset(ImageConst.lottie1),
                                Text(
                                  "Recharge Successfull!!",
                                  style:
                                  TextStyle(fontSize: width * 0.045),
                                ),

                              ],
                            ),
                          ),
                        );
                      });
                  Future.delayed(
                      const Duration(seconds: 1), () {
                  }).then((value) {
                    Navigator.pushAndRemoveUntil(context, CupertinoPageRoute(builder: (context) => bill(
                      id: rsp['transaction_id'].toString(),type: "HOME",
                    ),),ModalRoute.withName("/"));
                  },);

                }else{
                  showToast("Recharge failed!!");
                  Navigator.pop(context);
                }

              },
              child: isTap?CircularProgressIndicator():
              Container(
                height: height * 0.05,
                width: width * 0.9,
                decoration: BoxDecoration(
                    color: colorConst.blue,
                    borderRadius: BorderRadius.circular(
                        width * 0.06)),
                child: Center(
                    child: Text(
                      "Confirm",
                      style: TextStyle(
                          fontSize: width * 0.045,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    )),
              ),
            ),
            SizedBox(height: height*0.01),
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                height: height * 0.05,
                width: width * 0.9,
                decoration: BoxDecoration(
                    border:
                    Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(
                        width * 0.06)),
                child: Center(
                    child: Text(
                      "Cancel",
                      style: TextStyle(
                          fontSize: width * 0.045,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                    )),
              ),
            ),
          ],
        ),
      );
  }
}
