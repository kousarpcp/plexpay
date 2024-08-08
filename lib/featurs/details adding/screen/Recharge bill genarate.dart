import 'dart:convert';
// import 'dart:nativewrappers/_internal/vm/lib/typed_data_patch.dart';
import 'dart:typed_data';


import 'package:esys_flutter_share_plus/esys_flutter_share_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bluetooth_basic/flutter_bluetooth_basic.dart';
import 'package:maxx_sunmi_printer/maxx_sunmi_printer.dart';
import 'package:plexpay/Const/colorConst.dart';
import 'package:plexpay/Const/imageConst.dart';
import 'package:screenshot/screenshot.dart';

import '../../../main.dart';
import '../../../Const/NetWork.dart';

class bill extends StatefulWidget {
  const bill({super.key});

  @override
  State<bill> createState() => _billState();
}

class _billState extends State<bill> {

  var start =DateTime.now().year.toString()+"-"+DateTime.now().month.toString()+"-"+DateTime.now().day.toString();
  var end =DateTime.now().year.toString()+"-"+DateTime.now().month.toString()+"-"+DateTime.now().day.toString();

  DateTime now = DateTime.now();

  Future<void> printOut () async {
    try {
      Uint8List byteImage1 = await networkImageToByte(pluspayImgUrl);
      final imgData1 = base64.encode(byteImage1);
      MaxxSunmiPrinter.printImage(imgData1, align: SunmiAlign.center);

      MaxxSunmiPrinter.printText("www.plexpay.in",
          styles: SunmiStyles(alignment: SunmiAlign.center, isBold: true));

      MaxxSunmiPrinter.printBarcode(
        "https://cdn.pixabay.com/photo/2014/04/02/16/19/barcode-306926_960_720.png",);

      MaxxSunmiPrinter.printText("17-Jul-2024  ",
          styles: SunmiStyles(alignment: SunmiAlign.center, isBold: true));
      MaxxSunmiPrinter.printText("  11:22 AM",
          styles: SunmiStyles(alignment: SunmiAlign.center, isBold: true));


      // MaxxSunmiPrinter.printText(nowDate,
      //     styles: SunmiStyles(alignment: SunmiAlign.center, isBold: true));
      //
      // MaxxSunmiPrinter.paperFeed(number: 1);

      for (var item in a) {
        MaxxSunmiPrinter.printText(
          "${item['Text1']}: ${item['Text2']}",
          styles: SunmiStyles(alignment: SunmiAlign.left),
        );
      }
      MaxxSunmiPrinter.paperFeed(number: 1);
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

  List a=[
    {
      "Text1":"Receipt No",
      "Text2":"807"
    },
    {
      "Text1":"Point Name",
      "Text2":"TEST4"
    },
    {
      "Text1":"Recharge ID",
      "Text2":"PLXPYKT396113512"
    },
    {
      "Text1":"Operator",
      "Text2":"DU UAE"
    },
    {
      "Text1":"Mobile Number",
      "Text2":"971529253405"
    },
    {
      "Text1":"Received Value",
      "Text2":"AED 42.85"
    },
    {
      "Text1":"Type",
      "Text2":"MOBILE RECHARGE"
    },
    {
      "Text1":"Receipt No",
      "Text2":"807"
    },
    {
      "Text1":"Amount",
      "Text2":"42.85"
    },
    {
      "Text1":"Status",
      "Text2":"SUCCESS"
    },
  ];
  var isTap =false;
  var nowDate ="";
  var nowTime ="";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Screenshot(
              controller: screenshotController,
              child: Container(
                height: width*1.6,
                width: width*0.75,
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
                  borderRadius: BorderRadius.circular(width*0.015)
                ),
                child: Padding(
                  padding:  EdgeInsets.all(width*0.02),
                  child: Column(
                    children: [
                      Image.asset(ImageConst.plexpay,width: width*0.47,),
                      SizedBox(
                        height: width*0.025,
                      ),
                      Text(
                        "www.plexpay.in",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: width*0.028,
                            letterSpacing: 0.3),
                      ),
                      // SizedBox(
                      //   height: width*0.01,
                      // ),
                      Image(
                        image: NetworkImage(
                            "https://cdn.pixabay.com/photo/2014/04/02/16/19/barcode-306926_960_720.png"),
                        height: width * 0.13,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Text("17-Jul-2024  ",style: TextStyle(fontSize: width*0.03)),
                              Container(
                                height: width*0.04,
                                width: width*0.004,color: Colors.black,
                              ),
                              Text("  11:22 AM",style: TextStyle(fontSize: width*0.03),),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: width*0.04,
                      ),
                      Expanded(
                        child: ListView.separated(
                          shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        height: width*0.055,
                                        width: width*0.33,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(a[index]["Text1"]),
                                            Text(" :  "),
                                          ],
                                        ),
                                      ),
                                      Text(a[index]["Text2"]),
                                    ],
                                  ),
                                  SizedBox(
                                    height: width*0.03,
                                  ),
                                ],
                              );
                            },
                            separatorBuilder: (context, index) {
                              return SizedBox(
                                width: width*0.02,
                              );
                            },
                            itemCount: a.length
                        ),
                      ),
                      SizedBox(
                        height: width*0.05,
                      ),
                      Text("Help & Support",style: TextStyle(fontSize: width*0.06,fontWeight: FontWeight.w800),),
                      SizedBox(
                        height: width*0.04,
                      ),
                      Text("WhatsApp Support: +971589692115"),
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
        bottomNavigationBar: Container(
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


  Widget Button1(String label) {
    return GestureDetector(
      onTap:isTap==true?null:(){
        setState(() {
          isTap=true;
        });
        printOut();
      } ,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(width*0.06),
            color:isTap==true?Colors.grey: colorConst.blue
        ),
        margin: EdgeInsets.all(width*0.03),
        alignment: Alignment.center,
        height: width*0.14,
        child: Text(
          label,
          style: TextStyle(
              color: Colors.white, fontSize: width*0.052, fontWeight: FontWeight.w600),
        ),

      ),
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
        height: width*0.14,
        child: Text(
          label,
          style: TextStyle(
              color: Colors.white, fontSize:  width*0.052, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
