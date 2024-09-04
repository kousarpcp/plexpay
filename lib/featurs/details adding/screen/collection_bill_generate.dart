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
import 'package:shimmer/shimmer.dart';

import '../../../Const/shared_preference.dart';
import '../../../api/collection_info_API.dart';
import '../../../api/recharge_info_API.dart';
import '../../../main.dart';
import '../../../Const/NetWork.dart';

class CollectionBill extends StatefulWidget {
  final id;

  const CollectionBill({super.key,required this.id});

  @override
  State<CollectionBill> createState() => _CollectionBillState();
}

class _CollectionBillState extends State<CollectionBill> {

  var trans_id ="";
  var user_id ="";
  var due_wallet ="";
  var entry_date ="";
  var collected_amount ="";
  var due_balance ="";
  var agent_name ="";
  var mode_of_payment ="";

  var point_name ="";
  var name;

  var isTap =false;
  var  isLoading = true;


  var start =DateTime.now().year.toString()+"-"+DateTime.now().month.toString()+"-"+DateTime.now().day.toString();
  var end =DateTime.now().year.toString()+"-"+DateTime.now().month.toString()+"-"+DateTime.now().day.toString();

  DateTime now = DateTime.now();

  Future<String> getHome() async {

    setState(() {
      isLoading = true;
    });

    name = await getSharedPrefrence("name");

    var rsp = await collectionInfoApi(widget.id.toString());
    print(rsp);
    if(rsp['status']==true){
      setState(() {
        trans_id =rsp['due_info'][0]['trans_id'].toString();
        user_id =rsp['due_info'][0]['user_id'].toString();
        due_wallet =rsp['due_info'][0]['due_wallet'].toString();
        mode_of_payment =rsp['due_info'][0]['mode_of_payment'].toString();
        entry_date =rsp['due_info'][0]['entry_date'].toString();
        collected_amount =rsp['due_info'][0]['collected_amount'].toString();
        due_balance =rsp['due_info'][0]['due_balance'].toString();
        agent_name =rsp['due_info'][0]['agent_name'].toString();
        point_name =rsp['due_info'][0]['point_name'].toString();
        isLoading=false;
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
    setState(() {
      isTap =true;
    });
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
      if(trans_id.toString()!="null"){
      MaxxSunmiPrinter.printText(
        "ID : "+trans_id,
        styles: SunmiStyles(alignment: SunmiAlign.center,isBold: true,size: SunmiSize.customSize(28),),
      );
    }
      MaxxSunmiPrinter.printTextLine(ch: "*");


      if( point_name.toString()!="null"){
        MaxxSunmiPrinter.printText(
          "POINT NAME       : "+point_name.toString(),
          styles: SunmiStyles(alignment: SunmiAlign.left,size: SunmiSize.customSize(22),font: SunmiFont.khmerOs),
        );
      }

      if( agent_name.toString()!="null"){
        MaxxSunmiPrinter.printText(
          "AGENT NAME       : "+agent_name.toString(),
          styles: SunmiStyles(alignment: SunmiAlign.left,size: SunmiSize.customSize(22),font: SunmiFont.khmerOs),
        );
      }

      if( due_wallet.toString()!="null"){
        MaxxSunmiPrinter.printText(
          "DUE WALLET       : "+due_wallet.toString()+" AED",
          styles: SunmiStyles(alignment: SunmiAlign.left,size: SunmiSize.customSize(22),font: SunmiFont.khmerOs),
        );
      }

      if( collected_amount.toString()!="null"){
        MaxxSunmiPrinter.printText(
          "COLLECTION AMOUNT: "+collected_amount.toString()+" AED",
          styles: SunmiStyles(alignment: SunmiAlign.left,size: SunmiSize.customSize(22),font: SunmiFont.khmerOs),
        );
      }

      if( mode_of_payment.toString()!="null"){
        MaxxSunmiPrinter.printText(
          "MODE OF PAYMENT  : "+mode_of_payment.toString(),
          styles: SunmiStyles(alignment: SunmiAlign.left,size: SunmiSize.customSize(22),font: SunmiFont.khmerOs),
        );
      }

      if( due_balance.toString()!="null"){
        MaxxSunmiPrinter.printText(
          "DUE BALANCE      : "+due_balance.toString()+" AED",
          styles: SunmiStyles(alignment: SunmiAlign.left,size: SunmiSize.customSize(22),font: SunmiFont.khmerOs),
        );
      }

      MaxxSunmiPrinter.printText(
        "STATUS           : "+"SUCCESS",
        styles: SunmiStyles(alignment: SunmiAlign.left,size: SunmiSize.customSize(22),font: SunmiFont.khmerOs),
      );

      MaxxSunmiPrinter.printTextLine(ch: "*");

      if( entry_date.toString()!="null"){
        MaxxSunmiPrinter.printText(
          "DATE & TIME",
          styles: SunmiStyles(alignment: SunmiAlign.center,isBold: true,size: SunmiSize.customSize(22),font: SunmiFont.khmerOs),
        );
        MaxxSunmiPrinter.printText(
          entry_date,
          styles: SunmiStyles(alignment: SunmiAlign.center,isBold: true,size: SunmiSize.customSize(22),font: SunmiFont.khmerOs),
        );
      }
      MaxxSunmiPrinter.printTextLine(ch: "*");

      // MaxxSunmiPrinter.paperFeed(number: 1);
      MaxxSunmiPrinter.paperFeed();
    }catch (e) {
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
    return SafeArea(
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
              SizedBox(
                height: width*0.15,
              ),
              Center(
                child: Screenshot(
                  controller: screenshotController,
                  child: Container(
                    height: width*1.3,
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
                                  Details("transaction id", trans_id),
                                  Details("point name", point_name),
                                  Details("agent name",agent_name),
                                  Details("due wallet", due_wallet+" AED"),
                                  Details("collection amount", collected_amount+" AED"),
                                  Details("mode of payment", mode_of_payment),
                                  Details("due balance", due_balance+" AED"),
                                  Details("date & time", entry_date),
                                  Details("STATUS", "success".toUpperCase()),

                                ],
                              )),
                          SizedBox(
                            height: width*0.05,
                          ),
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
        bottomNavigationBar: isLoading==true?SizedBox():Container(
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
    return Row(
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

