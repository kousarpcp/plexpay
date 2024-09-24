import 'dart:convert';

import 'package:esys_flutter_share_plus/esys_flutter_share_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bluetooth_basic/flutter_bluetooth_basic.dart';
import 'package:maxx_sunmi_printer/maxx_sunmi_printer.dart';
import 'package:screenshot/screenshot.dart';
import 'dart:typed_data';

import '../../../Const/NetWork.dart';
import '../../../Const/colorConst.dart';
import '../../../Const/imageConst.dart';
import '../../../Const/widgets.dart';
import '../../../main.dart';

class printout extends StatefulWidget {
  const printout({super.key});

  @override
  State<printout> createState() => _printoutState();
}

class _printoutState extends State<printout> {
  var start =DateTime.now().year.toString()+"-"+DateTime.now().month.toString()+"-"+DateTime.now().day.toString();
  var end =DateTime.now().year.toString()+"-"+DateTime.now().month.toString()+"-"+DateTime.now().day.toString();

  DateTime now = DateTime.now();
  Uint8List? _imageFile;
  BluetoothManager bluetoothManager = BluetoothManager.instance;
  ScreenshotController screenshotController = ScreenshotController();

  var isTap =false;
  var  isLoading = true;

  Future<void> printOut1 () async {
    setState(() {
      isTap =true;
    });
    try {
      Uint8List byteImage1 = await networkImageToByte(pluspayImgUrl);
      final imgData1 = base64.encode(byteImage1);
      MaxxSunmiPrinter.printImage(imgData1, align: SunmiAlign.center,);
      MaxxSunmiPrinter.printText("www.plexpay.ae",
          styles: SunmiStyles(alignment: SunmiAlign.center, isBold: true, font: SunmiFont.khmerOs));
      MaxxSunmiPrinter.printText("Netplex IT Infrastructure LLC, Dubai,United Arab Emirates",
          styles: SunmiStyles(alignment: SunmiAlign.center,  font: SunmiFont.khmerOs));
      MaxxSunmiPrinter.printText("",
          styles: SunmiStyles(alignment: SunmiAlign.center, ));
      MaxxSunmiPrinter.printText("PLEXBILL",
          styles: SunmiStyles(alignment: SunmiAlign.center, isBold: true,size:SunmiSize.md ));
      MaxxSunmiPrinter.printText("Customer ID : 6",
          styles: SunmiStyles(alignment: SunmiAlign.left, ));
      MaxxSunmiPrinter.printText("Invoice Date : ${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}",
          styles: SunmiStyles(alignment: SunmiAlign.left,  ));
      MaxxSunmiPrinter.printText("TRN Number : 6456",
          styles: SunmiStyles(alignment: SunmiAlign.left, ));
      MaxxSunmiPrinter.printText("Payment Type : CASH",
          styles: SunmiStyles(alignment: SunmiAlign.left,isBold: true, ));
      MaxxSunmiPrinter.printTextLine();
      MaxxSunmiPrinter.printText("Product          Price",
          styles: SunmiStyles(alignment: SunmiAlign.center,isBold: true ));
      MaxxSunmiPrinter.printTextLine();
      MaxxSunmiPrinter.printText("Tomato              AED 1.42",
          styles: SunmiStyles(alignment: SunmiAlign.left,));
      MaxxSunmiPrinter.printText("1 x 1.42",
          styles: SunmiStyles(alignment: SunmiAlign.left,));
      MaxxSunmiPrinter.printText("",
          styles: SunmiStyles(alignment: SunmiAlign.left,));
      MaxxSunmiPrinter.printText("Onion               AED 3.04",
          styles: SunmiStyles(alignment: SunmiAlign.left,));
      MaxxSunmiPrinter.printText("1 x 3.04",
          styles: SunmiStyles(alignment: SunmiAlign.left,));
      MaxxSunmiPrinter.printText("",
          styles: SunmiStyles(alignment: SunmiAlign.left,));
      MaxxSunmiPrinter.printText("Dragon Fruit        AED 5.08",
          styles: SunmiStyles(alignment: SunmiAlign.left,));
      MaxxSunmiPrinter.printText("1 x 5.08",
          styles: SunmiStyles(alignment: SunmiAlign.left,));
      MaxxSunmiPrinter.printText("",
          styles: SunmiStyles(alignment: SunmiAlign.left,));
      MaxxSunmiPrinter.printTextLine();
      MaxxSunmiPrinter.printText("Sub Total           AED 9.54",
          styles: SunmiStyles(alignment: SunmiAlign.left,));
      MaxxSunmiPrinter.printText("Vat                 AED 0.84",
          styles: SunmiStyles(alignment: SunmiAlign.left,));
      MaxxSunmiPrinter.printText("Amount              AED 10.38",
          styles: SunmiStyles(alignment: SunmiAlign.left,isBold: true));
      MaxxSunmiPrinter.printTextLine();
      MaxxSunmiPrinter.printText("We Love PlexPay!!",
          styles: SunmiStyles(alignment: SunmiAlign.center,));
      MaxxSunmiPrinter.printText("${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year} | ${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}",
          styles: SunmiStyles(alignment: SunmiAlign.center,));
      MaxxSunmiPrinter.paperFeed();



      // Uint8List byteImage = await networkImageToByte(barcodImgUrl);
      // MaxxSunmiPrinter.paperFeed();

      // MaxxSunmiPrinter.paperFeed(number: 1);
      // MaxxSunmiPrinter.paperFeed();
    }
    catch (e) {
      print("Error during print: $e");
    }
    setState(() {
      isTap =false;
    });
  }
  Future<Uint8List> networkImageToByte(String imageUrl) async {
    final ByteData imageData = await NetworkAssetBundle(Uri.parse(imageUrl)).load("");
    final Uint8List bytes = imageData.buffer.asUint8List();
    return bytes;
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Screenshot(
                controller: screenshotController,
                child: Container(
                  height: width*1.73,
                  width: width*0.85,
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
                        Image.asset(ImageConst.plexpay,width: width*0.3,),
                        Text(
                          "www.plexpay.ae",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: width*0.028,
                              letterSpacing: 0.3),
                        ),
                        SizedBox(
                          height: width*0.02,
                        ),
                        Center(child: Text("Netplex IT Infrastructure LLC, Dubai,United\nArab Emirates", style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: width*0.033,))),
                        SizedBox(
                          height: width*0.03,
                        ),
                        Center(child: Text("PLEXBILL", style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: width*0.06,))),
                        SizedBox(
                          height: width*0.03,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text("Customer ID :"),
                                Text(" 6"),
                              ],
                            ),
                            Row(
                              children: [
                                Text("Invoice Date :"),
                                Text(" ${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}"),
                              ],
                            ),
                            Row(
                              children: [
                                Text("TRN Number :"),
                                Text(" 6456"),
                              ],
                            ),
                            Row(
                              children: [
                                Text("Payment Type :",style: TextStyle(fontSize: width*0.046,fontWeight: FontWeight.w500),),
                                Text(" CASH",style: TextStyle(fontSize: width*0.046,fontWeight: FontWeight.w500)),
                              ],
                            ),
        
                          ],
                        ),
                        SizedBox(
                          height: width*0.02,
                        ),
                        Divider(
                          thickness: width*0.001,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("Product",style: TextStyle(fontWeight: FontWeight.w600,fontSize: width*0.05),),
                            Text("Price",style: TextStyle(fontWeight: FontWeight.w600,fontSize: width*0.05)),
                          ],
                        ),
                        Divider(
                          thickness: width*0.001,
                        ),
                        Container(
                          width: width*0.7,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Tomato"),
                                      Text("1 x 1.42"),
                                    ],
                                  ),
                                  Text("AED 1.42"),
                                ],
                              ),
                              SizedBox(
                                height: width*0.025,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Onion"),
                                      Text("1 x 3.04"),
                                    ],
                                  ),
                                  Text("AED 3.04"),
                                ],
                              ),
                              SizedBox(
                                height: width*0.025,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Dragon Fruit"),
                                      Text("1 x 5.08"),
                                    ],
                                  ),
                                  Text("AED 5.08"),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: width*0.03,
                        ),
                        Divider(
                          thickness: width*0.001,
                        ),
                        Container(
                          width: width*0.7,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Sub Total",style: TextStyle(fontSize: width*0.045,),),
                                  Text("AED 9.54",style: TextStyle(fontSize: width*0.045,)),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Vat",style: TextStyle(fontSize: width*0.045),),
                                  Text("AED 0.84",style: TextStyle(fontSize: width*0.045,)),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Amount",style: TextStyle(fontSize: width*0.053,fontWeight: FontWeight.w600),),
                                  Text("AED 10.38",style: TextStyle(fontSize: width*0.053,fontWeight: FontWeight.w600)),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          thickness: width*0.001,
                        ),
                        Text("We Love PlexPay!!",style: TextStyle(fontSize: width*0.05),),
                        SizedBox(
                          height: width*0.02,
                        ),
                        Text("${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year} | ${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}")
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar:
      InkWell(
        onTap: () {
          printOut1();
        //   isTap==true?null:(){
        //     setState(() {
        //       isTap=true;
        //     });
        //     printOut1();
        //   };
        },
        child: Container(
          // height: width*0.18,
          child: Row(
            children: [
              Container(
                height: width*0.12,
                width: width*0.49,
                color:isTap==true?Colors.grey: Colors.indigo,
                  child: Center(child: Text("Print",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700,fontSize: width*0.06),)),
              ),
              SizedBox(
                width: width*0.02,
              ),
              InkWell(
                onTap: () {
                  capture();
                },
                child: Container(
                  height: width*0.12,
                  width: width*0.49,
                    color: Colors.indigo,
                    child: Center(
                      child: Text("Share",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700,fontSize: width*0.06)
                                        ),
                    ),
                ),
              ),
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
        printOut1();
      } ,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(width*0.06),
            color: colorConst.blue
        ),
        margin: EdgeInsets.all(width*0.03),
        alignment: Alignment.center,
        height: width*0.14,
        child: Text(
          isTap==true?"Printing...":label,
          overflow: TextOverflow.ellipsis,
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
