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
import '../../../api/planinfoAPI.dart';
import '../../../api/rechargeAPI.dart';
import '../../../api/voucher_int_recharge_API.dart';
import '../../../main.dart';

import '../../../Const/Snackbar_toast_helper.dart';

import '../../../Const/imageConst.dart';

class reacharge extends StatefulWidget {

  const reacharge({super.key,   this.number,  this.dash,  this.code,  this.voucher, });
  final  number;
  final voucher;
  final  dash;
  final  code;

  @override
  State<reacharge> createState() => _reachargeState();
}

class _reachargeState extends State<reacharge> {

  var isTap = false;
  var isLoading = true;
  var ProviderLogo;
  var ProviderCode;
  var ProviderName;
  var DialInfo;
  var SkuCode;
  var CoupenTitle;
  var SendValue;
  var SendCurrencyIso;
  var OurCommission;
  var Our_SendValue;
  var ReceiveValue;
  var ReceiveCurrencyIso;
  var Country_Iso;

  Future<String> getData() async {


    var rsp = await planInfoApi(widget.code,widget.dash);
    print("rechaaaaarge");
    print(rsp);

    if (rsp != 0 && rsp['status'] == true) {
      setState(() {
        ProviderLogo = rsp['provider_info']['ProviderLogo'].toString();
        ProviderCode = rsp['provider_info']['ProviderCode'].toString();
        ProviderName = rsp['provider_info']['ProviderName'].toString();
        DialInfo = rsp['provider_info']['DialInfo'].toString();
        Country_Iso = rsp['provider_info']['Country_Iso'].toString();


        SkuCode = rsp['plan_info'][0]['SkuCode'].toString();
        CoupenTitle = rsp['plan_info'][0]['CoupenTitle'].toString();
        SendValue = rsp['plan_info'][0]['SendValue'].toString();
        SendCurrencyIso = rsp['plan_info'][0]['SendCurrencyIso'].toString();
        OurCommission = rsp['plan_info'][0]['OurCommission'].toString();
        Our_SendValue = rsp['plan_info'][0]['Our_SendValue'].toString();
        ReceiveValue = rsp['plan_info'][0]['ReceiveValue'].toString();
        ReceiveCurrencyIso =
            rsp['plan_info'][0]['ReceiveCurrencyIso'].toString();
      });
    }

    setState(() {
      isLoading = false;
    });

    return " ";
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
    print(widget.dash);
    print(widget.number);
    print("........");
    // widget.AED;
    // a=widget.AED;
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
          height: height*0.5,
          width: width*0.3,

          child: Center(child: Lottie.asset(ImageConst.loading1))
          ,
        ),
      ):Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: height * 0.4,
              width: width * 0.4,
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
            widget.dash=="1"?Text(
              SendCurrencyIso +" "+Our_SendValue ,
              style: TextStyle(
                  fontSize:width * 0.02,
                  color: colorConst.blue,
                  fontWeight: FontWeight.bold),
            ):Container(),
            FittedBox(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(width*0.03),

                ),
                child: Padding(
                  padding:  EdgeInsets.all(width*0.01),
                  child: Text(
                    CoupenTitle!=null?CoupenTitle:"" ,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: width * 0.017,

                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            ),
            widget.number!=null?Expanded(
              child: Container(
                width: width*0.8,
                child: Text(
                  widget.dash=="0"?"Please confirm your recharge of "+widget.number.toString() +" of "+ ReceiveCurrencyIso +" "+Our_SendValue+" by "+ ProviderName:  "Please confirm your recharge of number "+widget.number.toString() +" of "+ ReceiveCurrencyIso +" "+ReceiveValue+" by "+ ProviderName,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize:width * 0.02,
                    color: colorConst.blue,
                    fontWeight: FontWeight.bold,),
                ),
              ),
            ):Container(
              width: width*0.8,
              child: Text(
                widget.dash=="0"?"Please confirm your recharge " +" of "+ ReceiveCurrencyIso +" "+Our_SendValue+" by "+ ProviderName:  "Please confirm your recharge " +" of "+ ReceiveCurrencyIso +" "+ReceiveValue+" by "+ ProviderName,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize:width * 0.02,
                  color: colorConst.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: height*0.02,),
            InkWell(
              onTap: () async {
                setState(() {
                  isTap = true;
                });
                var rsp;

                if(widget.voucher=="1"){
                  print("itssss int vouchwer");
                  rsp = await  voucherIntRecharge(SkuCode,ProviderCode,SendValue,Our_SendValue,ReceiveValue,widget.dash);

                }else{
                  rsp = await RechargeApi(SkuCode,ProviderCode,widget.number.toString(),SendValue,ReceiveValue,Our_SendValue,Country_Iso,CoupenTitle,widget.dash);
                }

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
                            height: height * 0.7,
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
            SizedBox(height: height*0.01  ,),
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

            SizedBox(height: height*0.03,)
          ],
        ),
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
      ):Center(
        child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: width * 0.8,
              width: width * 0.8,
              child: Lottie.asset(
                "assets/images/Animation - 1721449650090.json",
              ),
              decoration: BoxDecoration(
                // color: Colors.black,
                borderRadius: BorderRadius.circular(width * 0.03),
              ),
            ),
            SizedBox(
              height: height*0.05,
            ),
            Text(
              "Confirm your Recharge?",
              style: TextStyle(
                  fontSize: width * 0.053,
                  fontWeight: FontWeight.w900,
                  color: colorConst.blue),
            ),
            widget.dash=="1"?Text(
              SendCurrencyIso +" "+Our_SendValue ,
              style: TextStyle(
                  fontSize:width * 0.04,
                  color: colorConst.blue,
                  fontWeight: FontWeight.bold),
            ):Container(),
            FittedBox(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(width*0.03),

                ),
                child: Padding(
                  padding:  EdgeInsets.all(width*0.02),
                  child: Text(
                    CoupenTitle!=null?CoupenTitle:"" ,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: width * 0.033,

                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            ),
            widget.number!=null?Expanded(
              child: Container(
                width: width*0.8,
                child: Text(
                  widget.dash=="0"?"Please confirm your recharge of "+widget.number.toString() +" of "+ ReceiveCurrencyIso +" "+Our_SendValue+" by "+ ProviderName:  "Please confirm your recharge of number "+widget.number.toString() +" of "+ ReceiveCurrencyIso +" "+ReceiveValue+" by "+ ProviderName,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize:width * 0.04,
                    color: colorConst.blue,
                    fontWeight: FontWeight.bold,),
                ),
              ),
            ):Container(
              width: width*0.8,
              child: Text(
                widget.dash=="0"?"Please confirm your recharge " +" of "+ ReceiveCurrencyIso +" "+Our_SendValue+" by "+ ProviderName:  "Please confirm your recharge " +" of "+ ReceiveCurrencyIso +" "+ReceiveValue+" by "+ ProviderName,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize:height * 0.023,
                  color: colorConst.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: height*0.02,),
            InkWell(
              onTap: () async {
                setState(() {
                  isTap = true;
                });
                var rsp;

                if(widget.voucher=="1"){
                  print("itssss int vouchwer");
                  rsp = await  voucherIntRecharge(SkuCode,ProviderCode,SendValue,Our_SendValue,ReceiveValue,widget.dash);

                }else{
                  rsp = await RechargeApi(SkuCode,ProviderCode,widget.number.toString(),SendValue,ReceiveValue,Our_SendValue,Country_Iso,CoupenTitle,widget.dash);
                }

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
            SizedBox(height: height*0.01  ,),
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

            SizedBox(height: height*0.03,)
          ],
        ),
      ),
    );
  }
}
