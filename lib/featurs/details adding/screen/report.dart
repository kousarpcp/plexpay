import 'dart:convert';
import 'dart:typed_data';

import 'package:esys_flutter_share_plus/esys_flutter_share_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:maxx_sunmi_printer/maxx_sunmi_printer.dart';


import 'package:plexpay/Const/colorConst.dart';
import 'package:plexpay/Const/network.dart';

import 'package:plexpay/main.dart';
import 'package:screenshot/screenshot.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Const/imageConst.dart';
import '../../../Const/shared_preference.dart';
import '../../../Const/widgets.dart';
import '../../../api/recharge_report_API.dart';

class ReportsTab extends StatefulWidget {
  @override
  _ReportsTabState createState() => _ReportsTabState();
}

class _ReportsTabState extends State<ReportsTab> {
  var purchaseDate = "0";
  int currentIndex = 0;

  var start = DateTime
      .now()
      .year
      .toString() +
      "-" +
      DateTime
          .now()
          .month
          .toString() +
      "-" +
      DateTime
          .now()
          .day
          .toString();
  var end = DateTime
      .now()
      .year
      .toString() +
      "-" +
      DateTime
          .now()
          .month
          .toString() +
      "-" +
      DateTime
          .now()
          .day
          .toString();

  var arrProdList = [];

  var isLoading = false;
  var isTap = false;


  var total_amount;

  var name;
  var total_commission;
  var wallet_amount;

  //List<dynamic> data = [];
  @override
  void initState() {
    super.initState();
    getName();
    getHome();


    setState(() {});
    print("timeee");
    print(DateTime.now());
  }

  getName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    name = await getSharedPrefrence(shopname);
    setState(() {
      currentIndex = prefs.getInt('selectedLanguageIndex') ??
          0; // Default to first language if not set
    });
  }

  Future<Uint8List> networkImageToByte(String imageUrl) async {
    final ByteData imageData = await NetworkAssetBundle(Uri.parse(imageUrl))
        .load("");
    final Uint8List bytes = imageData.buffer.asUint8List();
    return bytes;
  }

  Future<String> getHome() async {
    // name = await getSharedPrefrence("name");
    setState(() {
      isLoading = true;
      // total = 0.0;
      // totalprofit = 0.0;
    });

    print("xoxoxo");
    var rsp = await rechargeReportApi(start, end);
    print("xoxoxo");
    print(rsp);

    // arrProdList = data;
    //
    if (rsp['status'] == true && rsp['result'] != "Empty") {
      setState(() {
        arrProdList = rsp['result'];
        total_amount = rsp['total_amount'] != null ? rsp['total_amount'] : "0";
        total_commission =
        rsp['total_commission'] != null ? rsp['total_commission'] : "0";
        wallet_amount = rsp['Balance'] != null ? rsp['Balance'] : "0";

        // for (var i = 0; i < arrProdList.length; i++) {
        //   total = total +
        //       (double.parse(arrProdList[i]["MRP"]
        //           .toString()
        //           .split(" ")
        //           .last
        //           .toString()
        //           .trim()));
        //   totalprofit = totalprofit +
        //       (double.parse(arrProdList[i]["profit"]
        //           .toString()
        //           .split(" ")
        //           .last
        //           .toString()
        //           .trim()));
        // }
      });
    }

    print("arrLoistt");
    print(arrProdList);
    setState(() {
      isLoading = false;
    });

    return "";
  }


  Future selectDateRange(BuildContext context) async {
    DateTimeRange? pickedRange = (await showDateRangePicker(
        context: context,
        initialDateRange: DateTimeRange(
          start: DateTime.now(),
          end: DateTime.now(),
        ),
        firstDate: DateTime(DateTime
            .now()
            .year + -5),
        lastDate: DateTime(DateTime
            .now()
            .year + 2),
        helpText: 'Select Date Range',
        cancelText: 'CANCEL',
        confirmText: 'OK',
        saveText: 'SAVE',
        errorFormatText: 'Invalid format.',
        errorInvalidText: 'Out of range.',
        errorInvalidRangeText: 'Invalid range.',
        fieldStartHintText: 'Start Date',
        fieldEndLabelText: 'End Date'));

    if (pickedRange != null) {
      setState(() {
        start = pickedRange.start.year.toString() +
            "-" +
            pickedRange.start.month.toString() +
            "-" +
            pickedRange.start.day.toString();
        end = pickedRange.end.year.toString() +
            "-" +
            pickedRange.end.month.toString() +
            "-" +
            pickedRange.end.day.toString();
      });
    }
    getHome();
  }


  void printOut2() async {
    try {
      /// logo
      Uint8List byteImage1 = await networkImageToByte(pluspayImgUrl);
      final imgData1 = base64.encode(byteImage1);
      // var convrt = await imgConvert(byteImage1);

      MaxxSunmiPrinter.printImage(imgData1);

      //SunmiPrinter.emptyLines(1);
      /// url

      MaxxSunmiPrinter.printText("www.plexpay.ae",
          styles: SunmiStyles(alignment: SunmiAlign.center, isBold: true));


      ///  now date
      MaxxSunmiPrinter.printText("${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year} | ${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}",
          styles: SunmiStyles(alignment: SunmiAlign.center, isBold: true,size: SunmiSize.customSize(21)));

      MaxxSunmiPrinter.printTextLine(ch: "*");

      ///datas ->

      MaxxSunmiPrinter.printText(
        "RECEIPT NO    :    " + DateTime
            .now()
            .millisecond
            .toString(),
        styles: SunmiStyles(alignment: SunmiAlign.left, isBold: true),
      );

      MaxxSunmiPrinter.printText(
        "POINT NAME    :    " + name.toString(),
        styles: SunmiStyles(alignment: SunmiAlign.left, isBold: true),
      );

      MaxxSunmiPrinter.printText(
        "DURATION      :    " + start.toString() + " to " + end.toString(),
        styles: SunmiStyles(alignment: SunmiAlign.left, isBold: true),
      );

      MaxxSunmiPrinter.printText(
        "BALANCE       :    " + wallet_amount,
        styles: SunmiStyles(alignment: SunmiAlign.left, isBold: true),
      );

      MaxxSunmiPrinter.printTextLine();

      ///date servive amnt com (coulmo)-->

      MaxxSunmiPrinter.printTable(
        cols: [
          SunmiCol(text: 'DATE', width: 3),
          SunmiCol(text: 'SERVICE', width: 3, alignment: SunmiAlign.center),
          SunmiCol(text: 'AMNT', width: 3, alignment: SunmiAlign.center),
          SunmiCol(text: 'COM%', width: 3, alignment: SunmiAlign.center),
        ],
        isBold: true
      );

      ///listtt-->
      print("xxxxxxxxxxxxxx");

      for (var i = 0; i < arrProdList.length; i++) {
        print("xxxxxxxxxxxxxx");
        print(arrProdList[i]['RechargedTime']);

        MaxxSunmiPrinter.printTable(
          size: SunmiSize.customSize(24),
          cols: [
            SunmiCol(text: arrProdList[i]['Date'], width: 3),
            SunmiCol(
                text: arrProdList[i]['Service'],
                width: 3,
                alignment: SunmiAlign.center),
            SunmiCol(
                text: arrProdList[i]['Amount'],
                width: 3,
                alignment: SunmiAlign.right),
            SunmiCol(
                text: arrProdList[i]['Commission'],
                width: 3,
                alignment: SunmiAlign.right),
          ],
        );
      }

      /// dotter hr line
      MaxxSunmiPrinter.printTextLine();

      ///totals
      MaxxSunmiPrinter.printText(
        "TOTAL AMOUNT  :    " + total_amount.toString(),
        styles: SunmiStyles(alignment: SunmiAlign.left, isBold: true),
      );
      MaxxSunmiPrinter.printText(
        "TOTAL PROFIT  :    " + total_commission.toString(),
        styles: SunmiStyles(alignment: SunmiAlign.left, isBold: true),
      );
      MaxxSunmiPrinter.printTextLine(ch: "*");
      MaxxSunmiPrinter.printText("Help & Support",styles: SunmiStyles(alignment: SunmiAlign.center,isBold: true,size: SunmiSize.lg));

        MaxxSunmiPrinter.printText(
          "WHATSAPP SUPPORT: +971589692115",
          styles: SunmiStyles(alignment: SunmiAlign.center,font: SunmiFont.khmerOs),
        );

      MaxxSunmiPrinter.printTextLine(ch: "*");
      MaxxSunmiPrinter.paperFeed();

      setState(() {
        isTap = false;
      });
    } catch (e) {
      print("Error during print: $e");
    }
  }
  ScreenshotController screenshotController = ScreenshotController();
  Uint8List? _imageFile;
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


  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(context).size.width > 650 ?
      Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
        elevation: 0,
        title: Text("Report", style: TextStyle(
            fontSize: width * 0.027, fontWeight: FontWeight.w700),),
      ),
      body: isLoading==true?Container(
        margin: EdgeInsets.only(
            bottom: width*0.05,
            left: width*0.05,
            right: width*0.05
        ),
        child: Center(child: Lottie.asset(ImageConst.loading1))
        ,
      ):Padding(
        padding:  EdgeInsets.all(width*0.03),
        child: SingleChildScrollView(
          child: Container(
            child: Column(

              children: [
                InkWell(
                  onTap: () {
                    selectDateRange(context);
                    setState(() {

                    });
                  },
                  child: Container(
                    height: height*0.1,
                    decoration: BoxDecoration(
                      color: colorConst.blue,
                      borderRadius: BorderRadius.circular(width*0.016),
                    ),
                    child: Center(
                      child: Text("Pick Date",style: TextStyle(
                        fontSize: width*0.025,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),),
                    ),
                  ),
                ),
                Screenshot(
                  controller: screenshotController,
                  child: Container(
                    height: MediaQuery.of(context).size.height>520?height*0.97 + (arrProdList.length * 0.07 * height):height*1.3 + (arrProdList.length * 0.14 * height),
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
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Image.asset(ImageConst.plexpay,width: width*0.17,),
                          Text(
                            "www.plexpay.ae",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: width*0.018,
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
                                  Text("${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}",style: TextStyle(fontSize: width*0.018)),
                                  SizedBox(
                                    width: width*0.02,
                                  ),
                                  Container(
                                    height: height*0.029,
                                    width: width*0.002 ,color: Colors.black,
                                  ),
                                  SizedBox(
                                    width: width*0.02,
                                  ),
                                  Text("${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}".toString(),style: TextStyle(fontSize: width*0.018),),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: height*0.043,
                          ),
                          Container(
                              margin: EdgeInsets.symmetric(
                                horizontal: 20,
                              ),
                              child: Wrap(
                                runSpacing: width*0.01,
                                children: [
                                  _items("receipt no.", "#12346567890"),
                                  _items("point name", name),
                                  _items(
                                      "duration", start.toString() + " to " + end.toString()),
                                  _items("balance", wallet_amount.toString()),
                                  SizedBox(
                                    height: height*0.08,
                                  ),
                                  Divider(),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          "DATE",
                                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                                        ),
                                        flex: 2,
                                      ),
                                      Expanded(
                                        child: Text("SERVICES", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                                        flex: 2,
                                      ),
                                      Expanded(
                                        child: Text("AMT", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                                        flex: 1,
                                      ),
                                      Expanded(
                                        child: Text("COM%", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                                        flex: 1,
                                      ),
                                    ],
                                  ),
                                  ListView.separated(
                                    scrollDirection: Axis.vertical,
                                    physics: NeverScrollableScrollPhysics(),
                                    separatorBuilder: (context, index) => SizedBox(
                                      height: 10,
                                    ),
                                    shrinkWrap: true,
                                    itemCount: arrProdList != null ? arrProdList.length : 0,
                                    itemBuilder: (context, index) {
                                      final item =
                                      arrProdList != null ? arrProdList[index] : null;
                                      return Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              item['Date'].toString(),
                                              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
                                            ),
                                            flex: 2,
                                          ),
                                          Expanded(
                                            child: Text(
                                              item['Service'].toString(),
                                              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
                                            ),
                                            flex: 2,
                                          ),
                                          Expanded(
                                            child: Text(
                                              item['Amount'].toString(),
                                              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
                                            ),
                                            flex: 1,
                                          ),
                                          Expanded(
                                            child: Text(
                                              item['Commission'].toString(),
                                              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
                                            ),
                                            flex: 1,
                                          )
                                        ],
                                      );
                                    },
                                  ),
                                  MySeparator(),

                                  _total("total amount",   total_amount.toString()),
                                  _total(
                                      "total commission",  total_commission.toString()),

                                ],
                              )),
                          SizedBox(
                            height: height*0.047,
                          ),
                          Text("Help & Support",style: TextStyle(fontSize: width*0.028,fontWeight: FontWeight.w800),),
                          SizedBox(
                            height: height*0.03,
                          ),
                          Expanded(child: Text("WHATSAPP SUPPORT: +971589692115")),
                          SizedBox(
                            height: height*0.02,
                          ),
                        ],
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
        ),
      ),
      bottomNavigationBar:  isLoading==true?SizedBox():Container(
        height: height*0.1,
        child: Row(
          children: [
            Expanded(child: Button1("Print")),
            Expanded(child: Button2("Share"))
          ],
        ),
      ),
    ):
      Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
        elevation: 0,
        title: Text("Report", style: TextStyle(
            fontSize: width * 0.06, fontWeight: FontWeight.w700),),
      ),
      body: isLoading==true?Container(
        margin: EdgeInsets.only(
            bottom: width*0.05,
            left: width*0.05,
            right: width*0.05
        ),
        child: Center(child: Lottie.asset(ImageConst.loading1))
        ,
      ):Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Container(
            child: Column(

              children: [
                InkWell(
                  onTap: () {
                    selectDateRange(context);
                    setState(() {

                    });
                  },
                  child: Container(
                    height: width*0.13,
                    decoration: BoxDecoration(
                      color: colorConst.blue,
                      borderRadius: BorderRadius.circular(width*0.03),
                    ),
                    child: Center(
                      child: Text("Pick Date",style: TextStyle(
                        fontSize: width*0.045,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),),
                    ),
                  ),
                ),
                Screenshot(
                  controller: screenshotController,
                  child: Container(
                    height: height*0.7+ (arrProdList.length * 0.07 * height),
                    width: width*0.9,
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
                        mainAxisSize: MainAxisSize.max,
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
                                  _items("receipt no.", "#12346567890"),
                                  _items("point name", name),
                                  _items(
                                      "duration", start.toString() + " to " + end.toString()),
                                  _items("balance", wallet_amount.toString()),
                                  SizedBox(
                                    height: width*0.08,
                                  ),
                                  Divider(),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          "DATE",
                                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                                        ),
                                        flex: 2,
                                      ),
                                      Expanded(
                                        child: Text("SERVICES", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                                        flex: 2,
                                      ),
                                      Expanded(
                                        child: Text("AMT", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                                        flex: 1,
                                      ),
                                      Expanded(
                                        child: Text("COM%", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                                        flex: 1,
                                      ),
                                    ],
                                  ),
                                  ListView.separated(
                                    scrollDirection: Axis.vertical,
                                    physics: NeverScrollableScrollPhysics(),
                                    separatorBuilder: (context, index) => SizedBox(
                                      height: 10,
                                    ),
                                    shrinkWrap: true,
                                    itemCount: arrProdList != null ? arrProdList.length : 0,
                                    itemBuilder: (context, index) {
                                      final item =
                                      arrProdList != null ? arrProdList[index] : null;
                                      return Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              item['Date'].toString(),
                                              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
                                            ),
                                            flex: 2,
                                          ),
                                          Expanded(
                                            child: Text(
                                              item['Service'].toString(),
                                              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
                                            ),
                                            flex: 2,
                                          ),
                                          Expanded(
                                            child: Text(
                                              item['Amount'].toString(),
                                              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
                                            ),
                                            flex: 1,
                                          ),
                                          Expanded(
                                            child: Text(
                                              item['Commission'].toString(),
                                              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
                                            ),
                                            flex: 1,
                                          )
                                        ],
                                      );
                                    },
                                  ),
                                  MySeparator(),

                                  _total("total amount",   total_amount.toString()),
                                  _total(
                                      "total commission",  total_commission.toString()),

                                ],
                              )),
                          SizedBox(
                            height: width*0.05,
                          ),
                          Text("Help & Support",style: TextStyle(fontSize: width*0.06,fontWeight: FontWeight.w800),),
                          SizedBox(
                            height: width*0.04,
                          ),
                          Expanded(child: Text("WHATSAPP SUPPORT: +971589692115")),
                          SizedBox(
                            height: width*0.06,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar:  isLoading==true?SizedBox():Container(
        height: width*0.18,
        child: Row(
          children: [
            Expanded(child: Button1("Print")),
            Expanded(child: Button2("Share"))
          ],
        ),
      ),
    );
  }
  _items(String frst, String scnd) {
    return Row(
      children: [
        Expanded(
            flex: 2,
            child: Text(
              frst.toUpperCase(),
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            )),
        Text(":   "),
        Expanded(
            flex: 2,
            child: Text(
              scnd.toUpperCase(),
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ))
      ],
    );
  }
  _total(String frst, String scnd) {
    return Row(
      children: [
        Expanded(
            flex: 2,
            child: Text(
              frst.toUpperCase(),
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            )),
        Text(":   "),
        Expanded(
            flex: 2,
            child: Text(
              scnd.toUpperCase(),
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ))
      ],
    );
  }

  Widget Button1(String label) {
    return MediaQuery.of(context).size.width > 650 ?
    GestureDetector(
        onTap:isTap==true?null:(){
          setState(() {
            isTap=true;
          });
          printOut2();
        } ,
        child:Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(width*0.01),
              color:isTap==true?Colors.grey: colorConst.blue
          ),
          margin: EdgeInsets.only(left: width*0.03,right: width*0.03,bottom: width*0.01),
          alignment: Alignment.center,
          height: height*0.14,
          child: Text(
            label,
            style: TextStyle(
                color: Colors.white, fontSize: width*0.02, fontWeight: FontWeight.w600),
          ),

        )

    ):
    GestureDetector(
        onTap:isTap==true?null:(){
          setState(() {
            isTap=true;
          });
          printOut2();
        } ,
        child:Container(
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

        )

    );
  }
  Widget Button2(String label) {
    return MediaQuery.of(context).size.width > 650 ?
      GestureDetector(
      onTap:(){
        capture();
      } ,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(width*0.01),
          color: colorConst.blue,

        ),
        alignment: Alignment.center,
        margin: EdgeInsets.only(left: width*0.03,right: width*0.03,bottom: width*0.01),
        // height: height*0.14,
        child: Text(
          label,
          style: TextStyle(
              color: Colors.white, fontSize:  width*0.02, fontWeight: FontWeight.w600),
        ),
      ),
    ):
      GestureDetector(
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
class MySeparator extends StatelessWidget {
  final double height;
  final Color color;

  const MySeparator({this.height = 2, this.color = Colors.black});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        final dashWidth = 3.0;
        final dashHeight = height;
        final dashCount = (boxWidth / (2 * dashWidth)).floor();
        return Flex(
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: dashWidth,
              height: dashHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(color: color),
              ),
            );
          }),
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
        );
      },
    );
  }
}

