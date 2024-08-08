import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'dart:typed_data';
// import 'package:network_image_to_byte/network_image_to_byte.dart';
import 'package:esys_flutter_share_plus/esys_flutter_share_plus.dart';
import 'package:flutter/material.dart';
import 'package:maxx_sunmi_printer/maxx_sunmi_printer.dart';
import 'package:plexpay/featurs/details%20adding/screen/BottomNavigation.dart';
// import 'package:plexpay/Api/rechargeInfoApi.dart';
// import 'package:plexpay/Const/network.dart';
// import 'package:plexpay/Const/sharedPref.dart';
// import 'package:plexpay/Const/snackbar_toast_helper.dart';
// import 'package:plexpay/Screens/BottomNav.dart';


import 'package:screenshot/screenshot.dart';
import 'package:flutter/services.dart';

// import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:flutter_bluetooth_basic/flutter_bluetooth_basic.dart';

// import 'package:flutter_sunmi_printer/flutter_sunmi_printer.dart';

import '../../../main.dart';
import '../Api/RechargeInfoApi.dart';
import '../Const/NetWork.dart';
import '../Const/SharedPref.dart';
class Print1 extends StatefulWidget {

  final id;
  final cid;
  final type;

  Print1({this.id,this.cid,this.type});
  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Print1> {




  ScreenshotController screenshotController = ScreenshotController();
  Uint8List? _imageFile;
  BluetoothManager bluetoothManager = BluetoothManager.instance;

  String voucherCode = "VOUCHER123"; // Mock data
  String transactionID = "TRANSACTION456"; // Mock data
  String rechargeAmount = "100.00"; // Mock data
  Uint8List? imageBytes;

  var  isLoading = true;
  var RechargeID ="";
  var RechargeType ="";
  var TransactionID ="";
  var AccountNumber ="";
  var coupen_info ="";
  var recharge_amount ="";
  var provider_name ="";
  var CountryName ="";
  var voucher_code ="";
  var instruction ="";
  var mobile ="";

  var RechargedTime ="";

  var shop_name ="";
  var location ="";

  var start =DateTime.now().year.toString()+"-"+DateTime.now().month.toString()+"-"+DateTime.now().day.toString();
  var end =DateTime.now().year.toString()+"-"+DateTime.now().month.toString()+"-"+DateTime.now().day.toString();
  var name;
  var nowDate ="";
  var nowTime ="";

  var isTap =false;
  DateTime now = DateTime.now();


  var recharge_info ="";
  var voucher_info ="";
  var transactionCode ="";
  @override
  void initState() {
    // TODO: implement initState
    print("orderid");
    print(widget.id);
    this.getHome();
    //  this.bluetoothSearch();


  }

  Future<String> getHome() async {

    name = await getSharedPrefrence("name");

    // var rsp = await rechargeInfoApi(widget.id.toString());
    // print("saleid");
    // print(rsp);
    // //0
    // if(rsp['status']==true){
    //
    //
    //   setState(() {
    //     voucher_code =rsp['recharge_info']['voucher_code'].toString();
    //     TransactionID =rsp['recharge_info']['TransactionID'].toString();
    //     AccountNumber =rsp['recharge_info']['AccountNumber'].toString();
    //     recharge_amount =rsp['recharge_info']['recharge_amount'].toString();
    //     provider_name =rsp['recharge_info']['provider_name'].toString();
    //     CountryName =rsp['recharge_info']['CountryName'].toString();
    //     RechargedTime =rsp['recharge_info']['RechargedTime'].toString();
    //     shop_name =rsp['recharge_info']['shop_name'].toString();
    //     coupen_info =rsp['recharge_info']['coupen_title'].toString();
    //     location =rsp['recharge_info']['location'].toString();
    //     RechargeType = rsp['recharge_info']['recharge_type'].toString();
    //     RechargeID =rsp['recharge_info']['RechargeID'].toString();
    //     nowDate =rsp['recharge_info']['date_time'].toString();
    //     nowTime =now.hour.toString() + ":" + now.minute.toString() + ":" + now.second.toString();
    //
    //
    //     recharge_info =rsp['recharge_info']['pin_serial'].toString();
    //     instruction =rsp['recharge_info']['instruction'].toString();
    //     mobile =rsp['contact']['mobile'].toString();
    //
    //     voucher_info =rsp['recharge_info']['voucher_code'].toString();
    //     transactionCode =rsp['recharge_info']['transactionCode'].toString();
    //
    //   });
    // }

    // print("ingatuuuuu");
    // print(rsp);
    // setState(() {
    //   isLoading = false;
    // });

    return "";
  }

  void capture(){



    screenshotController
        .capture(delay: Duration(milliseconds: 10)).then(
            (Uint8List? image) async {
          if (image != null) {
            await Share.file('Plus Pay Recharge', 'card.jpg', image, 'image/jpg');
            setState(() {
              _imageFile = image;
            });
          }

        }
    )
        .catchError((onError) {
      print(onError);
    });
  }



  void printOut2()async {
    /// logo
    try {
      // await MaxxSunmiPrinter.initPrinter();

      Uint8List byteImage1 = await networkImageToByte(pluspayImgUrl);
      dynamic imgData1 = base64.encode(byteImage1);
      // var convrt = await imgConvert(byteImage1);

      MaxxSunmiPrinter.printImage( imgData1, align: SunmiAlign.center);

      // MaxxSunmiPrinter.paperFeed(number: 1);

      /// url

      MaxxSunmiPrinter.printText( "www.plexpay.in",
          styles: SunmiStyles(alignment: SunmiAlign.center, isBold: true));

      ///   barcode
      // Uint8List byteImage = await networkImageToByte(barcodImgUrl);

      MaxxSunmiPrinter.printBarcode("https://www.tolcocorp.com/wp-content/uploads/2013/01/160105M.png",);


      ///  now date
      MaxxSunmiPrinter.printText( nowDate,
          styles: SunmiStyles(alignment:SunmiAlign.center , isBold: true));

      MaxxSunmiPrinter.paperFeed(number: 1);

      ///datas ->



      if (voucher_code.toString() != "null") {
        MaxxSunmiPrinter.printText(
           voucher_code,
          styles: SunmiStyles(
              alignment: SunmiAlign.center, isBold: true, font: width * 0.5),
          // SunmiSize.xl
        );
      }



      MaxxSunmiPrinter.printText(
        "RECEIPT NO    :  " + DateTime
            .now()
            .millisecond
            .toString(),
        styles: SunmiStyles(alignment: SunmiAlign.left, isBold: true),
      );
      if (name.toString() != "null") {
        MaxxSunmiPrinter.printText(
          "POINT NAME    :  " + name.toString(),
          styles: SunmiStyles(alignment: SunmiAlign.left, isBold: true),
        );
      }
      if (TransactionID.toString() != "null") {
        MaxxSunmiPrinter.printText(
          "RECHARGE ID   :  " + TransactionID.toString(),
          styles: SunmiStyles(alignment: SunmiAlign.left, isBold: true),
        );
      }
      if (provider_name.toString() != "null") {
        MaxxSunmiPrinter.printText(
          "OPERATOR      :  " + provider_name.toString(),
          styles: SunmiStyles(alignment: SunmiAlign.left, isBold: true),
        );
      }
      if (AccountNumber.toString() != "null") {
        print("AccountNumber");
        print(AccountNumber);
        MaxxSunmiPrinter.printText(
           (RechargeType == "KSEB BILL"
              ? "CONSUMER NUMBER: "
              : "MOBILE NUMBER :  ") + AccountNumber.toString(),
          styles: SunmiStyles(alignment: SunmiAlign.left, isBold: true),
        );
      }
      if (coupen_info.toString() != "null") {
        MaxxSunmiPrinter.printText(
           "RECEIVED VALUE :  " + coupen_info.toString(),
          styles: SunmiStyles(alignment: SunmiAlign.left, isBold: true),
        );
      }
      if (RechargeType.toString() != "null") {
        MaxxSunmiPrinter.printText(
           "TYPE       :  " + RechargeType.toString(),
          styles: SunmiStyles(alignment: SunmiAlign.left, isBold: true),
        );
      }
      if (recharge_amount.toString() != "null") {
        MaxxSunmiPrinter.printText(
           "AMOUNT        :  " + recharge_amount.toString(),
          styles: SunmiStyles(alignment: SunmiAlign.left, isBold: true),
        );
      }
      if (RechargedTime.toString() != "null") {
        MaxxSunmiPrinter.printText(
           "DATE & TIME     :  " + RechargedTime.toString(),
          styles: SunmiStyles(alignment: SunmiAlign.left, isBold: true),
        );
      }

      if (instruction.toString() != "null") {
        MaxxSunmiPrinter.printText(
           "INSTRUCTIONS     :  " + instruction.toString(),
          styles: SunmiStyles(alignment: SunmiAlign.left, isBold: true),
        );
      }

      MaxxSunmiPrinter.printText(
         "STATUS        :  " + "SUCCESS",
        styles: SunmiStyles(alignment: SunmiAlign.left, isBold: true),
      );
      if (mobile.toString() != "null") {
        MaxxSunmiPrinter.printText(
           "WHATSAPP SUPPORT: " + mobile.toString(),
          styles: SunmiStyles(alignment: SunmiAlign.left, isBold: true),
        );
      }


      MaxxSunmiPrinter.paperFeed(number: 3);

      setState(() {
        isTap = false;
      });
    }catch (e) {
      print("Error during print: $e");
    }
  }
  Future<void> printCustomHorizontalRule() async {
    const int lineLength = 32;
    final String line = '-' * lineLength;
    await MaxxSunmiPrinter.printText(
       line,
      styles: SunmiStyles(alignment: SunmiAlign.center, isBold: true),
    );
  }
  Future<Uint8List> networkImageToByte(String imageUrl) async {
    final ByteData imageData = await NetworkAssetBundle(Uri.parse(imageUrl)).load("");
    final Uint8List bytes = imageData.buffer.asUint8List();
    return bytes;
  }
  Future<bool> _onBackPressed() async {
    if(widget.type=="HOME"){
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => BottomNavigation()),
      );
      return false;
    }else{
      Navigator.pop(context);
      return true;
    }
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        backgroundColor: Colors.blueGrey[50],

        body:
        // isLoading==true?Container(
        //
        //   child: Center(child: CircularProgressIndicator())
        //   ,
        // ):
        SingleChildScrollView(
          child: SafeArea(
            child: Center(
              child: Container(
                margin: EdgeInsets.only(top: width*0.09,bottom: width*0.09),
                color: Colors.white,
                child: Screenshot(
                  controller: screenshotController,
                  child: Container(

                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                            maxWidth: width * 0.8),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            FittedBox(
                              fit: BoxFit.fitWidth,
                              child: Image.asset(
                                "assets/images/logo.png",
                                height: width*0.05,
                              ),
                            ),
                            SizedBox(
                              height: width*0.025,
                            ),
                            Text(
                              "www.plexpay.in",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: width*0.023,
                                  letterSpacing: 0.3),
                            ),
                            SizedBox(
                              height: width*0.014,
                            ),
                            Image(
                              image: NetworkImage(
                                  "https://www.tolcocorp.com/wp-content/uploads/2013/01/160105M.png"),
                              height: width * 0.13,
                            ),
                            SizedBox(
                              height: width*0.01,
                            ),
                            Text(
                              nowDate,
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: width*0.03,
                                  letterSpacing: 0.3),
                            ),
                            SizedBox(
                              height: width*0.01,
                            ),
                            Container(
                                margin: EdgeInsets.symmetric(
                                  horizontal: width*0.038,
                                ),
                                child: Wrap(
                                  runSpacing: width*0.03,
                                  children: [

                                    voucher_code.toString()!="null"?DetailsB("VOUCHER CARD", voucher_code.toUpperCase()):SizedBox(),
                                    shop_name.toString()!="null"? Details("SHOP NAME", shop_name.toUpperCase()):SizedBox(),
                                    TransactionID.toString()!="null"? Details("TRANSACTION ID", TransactionID.toUpperCase()):SizedBox(),
                                    RechargeID.toString()!="null"? Details("RECHARGE ID", RechargeID.toUpperCase()):SizedBox(),

                                    coupen_info.toString()!="null"?Details("RECEIVED VALUE", coupen_info.toUpperCase()):SizedBox(),
                                    recharge_info.toString()!="null"? Details("PIN SERIAL", recharge_info.toUpperCase()):SizedBox(),
                                    transactionCode.toString()!="null"? Details("transaction Code".toUpperCase(), transactionCode.toUpperCase()):SizedBox(),


                                    provider_name.toString()!="null"? Details("OPERATOR", provider_name.toUpperCase()):SizedBox(),
                                    location.toString()!="null"? Details("LOCATION", location.toUpperCase()):SizedBox(),
                                    AccountNumber.toString()!="null"? Details(( RechargeType=="KSEB BILL"?"CONSUMER NUMBER":"MOBILE NUMBER"), AccountNumber.toUpperCase()):SizedBox(),
                                    RechargeType.toString()!="null"? Details("TYPE", RechargeType.toUpperCase()):SizedBox(),
                                    recharge_amount.toString()!="null"?  Details("AMOUNT", recharge_amount.toUpperCase()):SizedBox(),

                                    //  coupen_info.toString()!="null"? Details("OFFER INFO", coupen_info.toUpperCase()):SizedBox(),
                                    RechargedTime.toString()!="null"? Details("DATE & TIME", RechargedTime.toUpperCase()):SizedBox(),


                                    instruction.toString()!="null"? Details("INSTRUCTIONS", instruction.toUpperCase()):SizedBox(),
                                    mobile.toString()!="null"? Details("WHATSAPP SUPPORT", mobile.toUpperCase()):SizedBox(),
                                    Details("STATUS", "success".toUpperCase()),

                                  ],
                                )),
                            SizedBox(
                              height: width * 0.05,
                            ),
                            Text(
                              "WhatsApp Support: " + "0578914789",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: Container(
          height: width*0.18,
          child: Row(
            children: [
              Expanded(child: Button1("Print")),
              Container(
                height: width*0.14,
                width: width*0.01,
                color: Colors.white,
              ),

              Container(
                height: width*0.14,
                width: width*0.01,
                color: Colors.white,
              ),
              Expanded(child: Button2("Share"))
            ],
          ),
        ),
      ),
    );
  }

  Widget Details(String label1, String label2) {
    return Row(
      children: [
        Expanded(
            child: Text(
              label1.toUpperCase(),
            )),
        Text(":  "),
        Expanded(
            child: Text(
              label2.toUpperCase(),
              style: TextStyle(fontWeight: FontWeight.bold),
            ))
      ],
    );
  }
  Widget DetailsB(String label1, String label2) {
    return Row(
      children: [
        Expanded(
            child: Text(
              label1.toUpperCase(),
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
        Text(":  "),
        Expanded(
            child: Text(
              label2.toUpperCase(),
              style: TextStyle(fontWeight: FontWeight.bold),
            ))
      ],
    );
  }

  Widget Button1(String label) {
    return GestureDetector(
      onTap:isTap==true?null:(){
        setState(() {
          isTap=true;
        });
        printOut2();
      } ,
      child: Container(
        alignment: Alignment.center,
        height: width*0.14,
        child: Text(
          label,
          style: TextStyle(
              color: Colors.white, fontSize: width*0.052, fontWeight: FontWeight.w600),
        ),
        color:isTap==true?Colors.grey: Colors.indigo,
      ),
    );
  }
  Widget Button2(String label) {
    return GestureDetector(
      onTap:(){
        capture();
      } ,
      child: Container(
        alignment: Alignment.center,
        height: width*0.14,
        child: Text(
          label,
          style: TextStyle(
              color: Colors.white, fontSize:  width*0.052, fontWeight: FontWeight.w600),
        ),
        color: Colors.indigo,
      ),
    );
  }

// networkImageToByte(String pluspayImgUrl) {}

}

final HeadingTxt = TextStyle(fontSize: width*0.2, fontWeight: FontWeight.bold);
