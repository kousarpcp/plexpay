import 'dart:convert';
// import 'dart:nativewrappers/_internal/vm/lib/typed_data_patch.dart';
import 'dart:typed_data';
import 'package:esys_flutter_share_plus/esys_flutter_share_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bluetooth_basic/flutter_bluetooth_basic.dart';
import 'package:lottie/lottie.dart';
import 'package:maxx_sunmi_printer/maxx_sunmi_printer.dart';
import 'package:plexpay/Const/colorConst.dart';
import 'package:plexpay/Const/imageConst.dart';
import 'package:plexpay/Const/widgets.dart';
import 'package:screenshot/screenshot.dart';

import '../../../Const/shared_preference.dart';
import '../../../api/recharge_info_API.dart';
import '../../../main.dart';
import '../../../Const/NetWork.dart';

class bill extends StatefulWidget {
  final id;
  final type;
  const bill({super.key,required this.id, this.type});

  @override
  State<bill> createState() => _billState();
}

class _billState extends State<bill> {

  var  isLoading = false;
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

  var recharge_info ="";
  var voucher_info ="";
  var transactionCode ="";

  var RechargedTime ="";

  var shop_name ="";
  var location ="";
  var name;


  var start =DateTime.now().year.toString()+"-"+DateTime.now().month.toString()+"-"+DateTime.now().day.toString();
  var end =DateTime.now().year.toString()+"-"+DateTime.now().month.toString()+"-"+DateTime.now().day.toString();

  DateTime now = DateTime.now();

  Future<String> getHome() async {

    setState(() {
      isLoading = true;
    });

    name = await getSharedPrefrence("name");

    var rsp = await rechargeInfoApi(widget.id.toString());
    print("saleid");
    print(rsp);
    //0
    if(rsp['status']==true){


      setState(() {
        voucher_code =rsp['recharge_info']['voucher_code'].toString();
        TransactionID =rsp['recharge_info']['TransactionID'].toString();
        AccountNumber =rsp['recharge_info']['AccountNumber'].toString();
        recharge_amount =rsp['recharge_info']['recharge_amount'].toString();
        provider_name =rsp['recharge_info']['provider_name'].toString();
        CountryName =rsp['recharge_info']['CountryName'].toString();
        RechargedTime =rsp['recharge_info']['RechargedTime'].toString();
        shop_name =rsp['recharge_info']['shop_name'].toString();
        coupen_info =rsp['recharge_info']['coupen_title'].toString();
        location =rsp['recharge_info']['location'].toString();
        RechargeType = rsp['recharge_info']['recharge_type'].toString();
        RechargeID =rsp['recharge_info']['RechargeID'].toString();
        nowDate =rsp['recharge_info']['date_time'].toString();
        nowTime =now.hour.toString() + ":" + now.minute.toString() + ":" + now.second.toString();


        recharge_info =rsp['recharge_info']['pin_serial'].toString();
        instruction =rsp['recharge_info']['instruction'].toString();
        mobile =rsp['contact']['mobile'].toString();

        voucher_info =rsp['recharge_info']['voucher_code'].toString();
        transactionCode =rsp['recharge_info']['transactionCode'].toString();

      });
    }

    print("ingatuuuuu");
    print(rsp);
    setState(() {
      isLoading = false;
    });

    return "";
  }

  Future<void> printOut () async {
    try {

      Uint8List byteImage1 = await networkImageToByte(pluspayImgUrl);
      final imgData1 = base64.encode(byteImage1);
      MaxxSunmiPrinter.printImage(imgData1, align: SunmiAlign.center,);
      MaxxSunmiPrinter.printText("www.plexpay.ae",
          styles: SunmiStyles(alignment: SunmiAlign.center, isBold: true, font: SunmiFont.khmerOs));

      // Uint8List byteImage = await networkImageToByte(barcodImgUrl);
      // MaxxSunmiPrinter.paperFeed();

      MaxxSunmiPrinter.printTextLine(ch: "*");
      MaxxSunmiPrinter.printText("${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year} | ${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}",
          styles: SunmiStyles(alignment: SunmiAlign.center, isBold: true,size: SunmiSize.customSize(21)));
      MaxxSunmiPrinter.printText(
        "RECEIPT NO  : "+DateTime.now().millisecond.toString(),
        styles: SunmiStyles(alignment: SunmiAlign.center,isBold: true,size: SunmiSize.customSize(28),),
      );

      MaxxSunmiPrinter.printTextLine(ch: "*");

      if( voucher_code.toString()!="null"){
        MaxxSunmiPrinter.printText(
          voucher_code,
          styles: SunmiStyles(alignment: SunmiAlign.center,isBold: true,size: SunmiSize.customSize(22),font: SunmiFont.khmerOs),
        );

      }
      // MaxxSunmiPrinter.printText(nowDate,
      //     styles: SunmiStyles(alignment: SunmiAlign.center, isBold: true));
      //
      // MaxxSunmiPrinter.paperFeed(number: 1);
      if( AccountNumber.toString()!="null"){
        print("AccountNumber");
        print(AccountNumber);
        MaxxSunmiPrinter.printText(
          (RechargeType=="KSEB BILL"?"CONSUMER NUMBER : ": "MOBILE NUMBER : ") +AccountNumber.toString(),
          styles: SunmiStyles(alignment: SunmiAlign.left,size: SunmiSize.customSize(22),font: SunmiFont.khmerOs,isBold: true),
        );
      }

      if( name.toString()!="null"){
        MaxxSunmiPrinter.printText(
          "POINT NAME    : "+name.toString(),
          styles: SunmiStyles(alignment: SunmiAlign.left,size: SunmiSize.customSize(22),font: SunmiFont.khmerOs),
        );
      }

      if( TransactionID.toString()!="null"){
        MaxxSunmiPrinter.printText(
          "RECHARGE ID   : "+TransactionID.toString(),
          styles: SunmiStyles(alignment: SunmiAlign.left,size: SunmiSize.customSize(22),font: SunmiFont.khmerOs),
        );
      }

      if( provider_name.toString()!="null"){
        MaxxSunmiPrinter.printText(
          "OPERATOR      : "+provider_name.toString(),
          styles: SunmiStyles(alignment: SunmiAlign.left,size: SunmiSize.customSize(22),font: SunmiFont.khmerOs),
        );
      }


      if( coupen_info.toString()!="null"){
        MaxxSunmiPrinter.printText(
          "RECEIVED VALUE: "+coupen_info.toString(),
          styles: SunmiStyles(alignment: SunmiAlign.left,size: SunmiSize.customSize(22),font: SunmiFont.khmerOs),
        );
      }

      if( RechargeType.toString()!="null"){
        MaxxSunmiPrinter.printText(
          "TYPE          : "+RechargeType.toString(),
          styles: SunmiStyles(alignment: SunmiAlign.left,size: SunmiSize.customSize(22),font: SunmiFont.khmerOs),
        );
      }

      if( recharge_amount.toString()!="null"){
        MaxxSunmiPrinter.printText(
          "AMOUNT        : "+recharge_amount.toString()+" AED",
          styles: SunmiStyles(alignment: SunmiAlign.left,size: SunmiSize.customSize(22),font: SunmiFont.khmerOs),
        );
      }

      if( RechargedTime.toString()!="null"){
        MaxxSunmiPrinter.printText(
          "DATE & TIME     : "+RechargedTime.toString(),
          styles: SunmiStyles(alignment: SunmiAlign.left,size: SunmiSize.customSize(22),font: SunmiFont.khmerOs),
        );
      }

      if( instruction.toString()!="null"){
        MaxxSunmiPrinter.printText(
          "INSTRUCTIONS     : "+instruction.toString(),
          styles: SunmiStyles(alignment: SunmiAlign.left,size: SunmiSize.customSize(22),font: SunmiFont.khmerOs),
        );
      }

      MaxxSunmiPrinter.printText(
        "STATUS        : "+"SUCCESS",
        styles: SunmiStyles(alignment: SunmiAlign.left,size: SunmiSize.customSize(22),font: SunmiFont.khmerOs),
      );

      MaxxSunmiPrinter.printTextLine(ch: "*");
      // MaxxSunmiPrinter.paperFeed(number: 1);
      MaxxSunmiPrinter.printText("Help & Support",styles: SunmiStyles(alignment: SunmiAlign.center,isBold: true,size: SunmiSize.lg));
      if( mobile.toString()!="null"){
        MaxxSunmiPrinter.printText(
          "WHATSAPP SUPPORT: "+mobile.toString(),
          styles: SunmiStyles(alignment: SunmiAlign.center,font: SunmiFont.khmerOs),
        );
      }

      MaxxSunmiPrinter.printTextLine(ch: "*");
      MaxxSunmiPrinter.paperFeed();
    }catch (e) {
      print("Error during print: $e");
    }

  }
  Future<Uint8List> networkImageToByte(String imageUrl) async {
    final ByteData imageData = await NetworkAssetBundle(Uri.parse(imageUrl)).load("");
    final Uint8List bytes = imageData.buffer.asUint8List();
    return bytes;
  }

  ScreenshotController screenshotController = ScreenshotController();
  Uint8List? _imageFile;
  BluetoothManager bluetoothManager = BluetoothManager.instance;

  void capture(){
    screenshotController
        .capture(delay: Duration(milliseconds: 10)).then(
            (Uint8List? image) async {
          if (image != null) {
            await Share.file('Plex Pay Recharge', 'card.jpg', image, 'image/jpg');
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

  var isTap =false;
  var nowDate ="";
  var nowTime ="";
  @override
  void initState() {
    print(widget.id);
    getHome();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(context).size.width > 650?
      SafeArea(
      child: Scaffold(
      body: isLoading==true?Container(
        margin: EdgeInsets.only(
            bottom: width*0.05,
            left: width*0.05,
            right: width*0.05
        ),
        child: Center(child: Lottie.asset(ImageConst.loading1))
        ,
      ):SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Screenshot(
                controller: screenshotController,
                child: Container(
                  height: height*1,
                  width: width*0.45,
                  margin: EdgeInsets.only(top: width*0.03),
                  decoration: BoxDecoration(
                      color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          blurStyle: BlurStyle.normal,
                          color: Colors.black.withOpacity(0.09),
                          offset: Offset(0, 2),
                          spreadRadius: 1,
                          blurRadius: 9
                      )
                    ],
                    borderRadius: BorderRadius.circular(width*0.02)
                  ),
                  child: Padding(
                    padding:  EdgeInsets.all(width*0.02),
                    child: Column(
                      children: [
                        gap,
                        Image.asset(ImageConst.plexpay,width: width*0.17,),
                        Text(
                          "www.plexpay.ae",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: width*0.014,
                              letterSpacing: 0.3),
                        ),
                        // SizedBox(
                        //   height: width*0.01,
                        // ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(

                              children: [
                                Text("${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}",style: TextStyle(fontSize: width*0.014)),
                                SizedBox(
                                  width: width*0.02,
                                ),
                                Container(
                                  height: height*0.035,
                                  width: width*0.0012,color: Colors.black,
                                ),
                                SizedBox(
                                  width: width*0.02,
                                ),
                                Text("${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}".toString(),style: TextStyle(fontSize: width*0.014),),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: height*0.04,
                        ),
                        Container(
                            margin: EdgeInsets.symmetric(
                              horizontal: 20,
                            ),
                            child: Wrap(
                              runSpacing: width*0.01,
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
                                recharge_amount.toString()!="null"?  Details("AMOUNT", recharge_amount.toUpperCase()+" AED"):SizedBox(),

                                //  coupen_info.toString()!="null"? Details("OFFER INFO", coupen_info.toUpperCase()):SizedBox(),
                                RechargedTime.toString()!="null"? Details("DATE & TIME", RechargedTime.toUpperCase()):SizedBox(),
                                instruction.toString()!="null"? Details("INSTRUCTIONS", instruction.toUpperCase()):SizedBox(),
                                mobile.toString()!="null"? Details("WHATSAPP SUPPORT", mobile.toUpperCase()):SizedBox(),
                                Details("STATUS", "success".toUpperCase()),

                              ],
                            )),
                        SizedBox(
                          height: height*0.05,
                        ),
                        Text("Help & Support",style: TextStyle(fontSize: width*0.033,fontWeight: FontWeight.w800),),
                        SizedBox(
                          height: height*0.02,
                        ),
                        Expanded(child: Text("WHATSAPP SUPPORT: ${mobile}",style: TextStyle(fontSize: width*0.012),)),
                        SizedBox(
                          height: height*0.03,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height*0.02,
            )
          ],
        ),
      ),
        // bottomNavigationBar:
        // InkWell(
        //   onTap: () {
        //     isTap==true?null:(){
        //       setState(() {
        //         isTap=true;
        //       });
        //       printOut();
        //     };
        //   },
        //   child: Container(
        //     // height: width*0.18,
        //     child: Row(
        //       children: [
        //         Container(
        //           height: width*0.12,
        //           width: width*0.49,
        //           color:isTap==true?Colors.grey: Colors.indigo,
        //             child: Center(child: Text("Print",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700,fontSize: width*0.06),)),
        //         ),
        //         SizedBox(
        //           width: width*0.02,
        //         ),
        //         InkWell(
        //           onTap: () {
        //
        //           },
        //           child: Container(
        //             height: width*0.12,
        //             width: width*0.49,
        //               color: Colors.indigo,
        //               child: Center(
        //                 child: Text("Share",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700,fontSize: width*0.06)
        //                                   ),
        //               ),
        //           ),
        //         )
        //       ],
        //     ),
        //   ),
        // ),
        bottomNavigationBar:  isLoading==true?SizedBox():Container(
          height: height*0.2,
          child: Row(
            children: [
              Expanded(child: Button1("Print")),
              Expanded(child: Button2("Share"))
            ],
          ),
        ),

      ),
    ):
      SafeArea(
      child: Scaffold(
      body: isLoading==true?Container(
        margin: EdgeInsets.only(
            bottom: width*0.05,
            left: width*0.05,
            right: width*0.05
        ),
        child: Center(child: Lottie.asset(ImageConst.loading1))
        ,
      ):SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Screenshot(
                controller: screenshotController,
                child: Container(
                  height: width*1.36,
                  width: width*0.75,
                  margin: EdgeInsets.only(top: width*0.03),
                  decoration: BoxDecoration(
                      color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: colorConst.lightgrey,
                        spreadRadius: 0.01,
                        blurRadius: 2,
                        offset: Offset(0,01)
                      )
                    ],
                    borderRadius: BorderRadius.circular(width*0.02)
                  ),
                  child: Padding(
                    padding:  EdgeInsets.all(width*0.02),
                    child: Column(
                      children: [
                        gap,
                        Image.asset(ImageConst.plexpay,width: width*0.47,),
                        Text(
                          "www.plexpay.ae",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: width*0.028,
                              letterSpacing: 0.3),
                        ),
                        // SizedBox(
                        //   height: width*0.01,
                        // ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(

                              children: [
                                Text("${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}",style: TextStyle(fontSize: width*0.03)),
                                SizedBox(
                                  width: width*0.02,
                                ),
                                Container(
                                  height: width*0.04,
                                  width: width*0.004,color: Colors.black,
                                ),
                                SizedBox(
                                  width: width*0.02,
                                ),
                                Text("${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}".toString(),style: TextStyle(fontSize: width*0.03),),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: width*0.04,
                        ),
                        Container(
                            margin: EdgeInsets.symmetric(
                              horizontal: 20,
                            ),
                            child: Wrap(
                              runSpacing: width*0.01,
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
                                recharge_amount.toString()!="null"?  Details("AMOUNT", recharge_amount.toUpperCase()+" AED"):SizedBox(),

                                //  coupen_info.toString()!="null"? Details("OFFER INFO", coupen_info.toUpperCase()):SizedBox(),
                                RechargedTime.toString()!="null"? Details("DATE & TIME", RechargedTime.toUpperCase()):SizedBox(),
                                instruction.toString()!="null"? Details("INSTRUCTIONS", instruction.toUpperCase()):SizedBox(),
                                mobile.toString()!="null"? Details("WHATSAPP SUPPORT", mobile.toUpperCase()):SizedBox(),
                                Details("STATUS", "success".toUpperCase()),

                              ],
                            )),
                        SizedBox(
                          height: width*0.05,
                        ),
                        Text("Help & Support",style: TextStyle(fontSize: width*0.06,fontWeight: FontWeight.w800),),
                        SizedBox(
                          height: width*0.04,
                        ),
                        Expanded(child: Text("WHATSAPP SUPPORT: ${mobile}")),
                        SizedBox(
                          height: width*0.06,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
        // bottomNavigationBar:
        // InkWell(
        //   onTap: () {
        //     isTap==true?null:(){
        //       setState(() {
        //         isTap=true;
        //       });
        //       printOut();
        //     };
        //   },
        //   child: Container(
        //     // height: width*0.18,
        //     child: Row(
        //       children: [
        //         Container(
        //           height: width*0.12,
        //           width: width*0.49,
        //           color:isTap==true?Colors.grey: Colors.indigo,
        //             child: Center(child: Text("Print",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700,fontSize: width*0.06),)),
        //         ),
        //         SizedBox(
        //           width: width*0.02,
        //         ),
        //         InkWell(
        //           onTap: () {
        //
        //           },
        //           child: Container(
        //             height: width*0.12,
        //             width: width*0.49,
        //               color: Colors.indigo,
        //               child: Center(
        //                 child: Text("Share",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700,fontSize: width*0.06)
        //                                   ),
        //               ),
        //           ),
        //         )
        //       ],
        //     ),
        //   ),
        // ),
        bottomNavigationBar:  isLoading==true?SizedBox():Container(
          height: width*0.18,
          child: Row(
            children: [
              Expanded(child: Button1("Print")),
              Expanded(child: Button2("Share"))
            ],
          ),
        ),

      ),
    );
  }

  Widget Details(String label1, String label2) {
    return MediaQuery.of(context).size.width > 650?
      Row(
      children: [
        Expanded(
            child: Text(
              label1.toUpperCase(),
              style: TextStyle(
                fontSize: width*0.015
              ),
            )),
        Text(":  "),
        Expanded(
            child: Text(
              label2.toUpperCase(),
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: width*0.015
              ),
            ))
      ],
    ):
      Row(
      children: [
        Expanded(
            child: Text(
              label1.toUpperCase(),
              style: TextStyle(
                fontSize: width*0.04
              ),
            )),
        Text(":  "),
        Expanded(
            child: Text(
              label2.toUpperCase(),
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: width*0.04
              ),
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
        printOut();
      } ,
      child:Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(width*0.06),
            color:isTap==true?Colors.grey: colorConst.blue
        ),
        margin: EdgeInsets.all(width*0.03),
        alignment: Alignment.center,
        height: height*0.12,
        child: Text(
          label,
          style: TextStyle(
              color: Colors.white, fontSize: width*0.035, fontWeight: FontWeight.w600),
        ),

      )

    );
  }
  Widget Button2(String label) {
    return GestureDetector(
      onTap:(){
        capture();
      } ,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(width*0.06),
          color: colorConst.blue,

        ),
        alignment: Alignment.center,
        margin: EdgeInsets.all(width*0.03),
        height:height*0.12,
        child: Text(
          label,
          style: TextStyle(
              color: Colors.white, fontSize:  width*0.035, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
