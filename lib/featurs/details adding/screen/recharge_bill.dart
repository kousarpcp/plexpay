import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:flutter_sunmi_printer/flutter_sunmi_printer.dart';
import 'package:maxx_sunmi_printer/maxx_sunmi_printer.dart';


import '../../../main.dart';
import '../Api/RechargeReportApi.dart';
import '../Const/NetWork.dart';
import '../Const/SharedPref.dart';
import 'Resources.dart';

class ReportsTab extends StatefulWidget {
  @override
  _ReportsTabState createState() => _ReportsTabState();
}

class _ReportsTabState extends State<ReportsTab> {
  var purchaseDate = "0";

  var start = DateTime.now().year.toString() +
      "-" +
      DateTime.now().month.toString() +
      "-" +
      DateTime.now().day.toString();
  var end = DateTime.now().year.toString() +
      "-" +
      DateTime.now().month.toString() +
      "-" +
      DateTime.now().day.toString();

  var arrProdList = [];

  var isLoading = true;
  var isTap = false;



  var total_amount="AED 42.85" ;
  var name="";
  var total_commission="AED 2";
  var wallet_amount="AED 115";
  //List<dynamic> data = [];
  @override
  void initState() {
    super.initState();

    // this.getHome();


    setState(() {});
    print("timeee");
    print(DateTime.now());
  }

  // Future<String> getHome() async {
  //   name = await getSharedPrefrence("name");
  //   setState(() {
  //     isLoading = true;
  //     // total = 0.0;
  //     // totalprofit = 0.0;
  //   });
  //
  //   print("xoxoxo");
  //   // var rsp = await rechargeReportApi(start, end);
  //   // print("xoxoxo");
  //   // print(rsp);
  //
  //   // arrProdList = data;
  //   //
  //   // if (rsp['status'] == true && rsp['result'] != "Empty") {
  //   //   setState(() {
  //   //     arrProdList = rsp['result'];
  //   //     total_amount = rsp['total_amount']?.toString()??"0";
  //   //     total_commission = rsp['total_commission']?.toString()??"0";
  //   //     wallet_amount = rsp['Balance']?.toString()??"0";
  //   //
  //   //     // for (var i = 0; i < arrProdList.length; i++) {
  //   //     //   total = total +
  //   //     //       (double.parse(arrProdList[i]["MRP"]
  //   //     //           .toString()
  //   //     //           .split(" ")
  //   //     //           .last
  //   //     //           .toString()
  //   //     //           .trim()));
  //   //     //   totalprofit = totalprofit +
  //   //     //       (double.parse(arrProdList[i]["profit"]
  //   //     //           .toString()
  //   //     //           .split(" ")
  //   //     //           .last
  //   //     //           .toString()
  //   //     //           .trim()));
  //   //     // }
  //   //   });
  //   // }
  //
  //   print("arrLoistt");
  //   print(arrProdList);
  //   setState(() {
  //     isLoading = false;
  //   });
  //
  //   return "";
  // }



  Future selectDateRange(BuildContext context) async {
    DateTimeRange? pickedRange = (await showDateRangePicker(
        context: context,
        initialDateRange: DateTimeRange(
          start: DateTime.now(),
          end: DateTime.now(),
        ),
        firstDate: DateTime(DateTime.now().year + -5),
        lastDate: DateTime(DateTime.now().year + 2),
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

      // getHome();

      print(pickedRange.start.day);
      print(pickedRange.start.month);
      print(pickedRange.start.year);
    }
  }

  void printOut2() async {
    /// logo
    // ByteData bytes = await rootBundle.load('assets/images/logo.png');
    // final buffer = bytes.buffer;
    // final imgData = base64.encode(Uint8List.view(buffer));
    // MaxxSunmiPrinter.printImage(imgData, align: SunmiAlign.center);
    Uint8List byteImage1 = await networkImageToByte(pluspayImgUrl);
    dynamic imgData1 = base64.encode(byteImage1);
    // var convrt = await imgConvert(byteImage1);

    MaxxSunmiPrinter.printImage( imgData1, align: SunmiAlign.center);



    /// url

    MaxxSunmiPrinter.printText("www.plexpay.in",
        styles: SunmiStyles(alignment: SunmiAlign.center, isBold: true));
    SizedBox(
      height: width*0.02,
    );
    ///   barcode
    MaxxSunmiPrinter.printBarcode("https://www.tolcocorp.com/wp-content/uploads/2013/01/160105M.png",);
    // Uint8List byteImage = await networkImageToByte(barcodImgUrl);
    //
    // final imgData = base64.encode(byteImage);
    // MaxxSunmiPrinter.printImage(imgData);
    // MaxxSunmiPrinter.paperFeed(number: 1);
    //   SunmiPrinter.hr();

    ///  now date
    MaxxSunmiPrinter.printText(DateTime.now().toString(),
        styles: SunmiStyles(alignment: SunmiAlign.center, isBold: true));

    // MaxxSunmiPrinter.paperFeed(number: 1);

    ///datas ->

    MaxxSunmiPrinter.printText(
      "RECEIPT NO   :    " + DateTime.now().millisecond.toString(),
      styles: SunmiStyles(alignment: SunmiAlign.left, isBold: true),
    );

    MaxxSunmiPrinter.printText(
      "POINT NAME   :    " + name.toString(),
      styles: SunmiStyles(alignment: SunmiAlign.left, isBold: true),
    );

    MaxxSunmiPrinter.printText(
      "DURATION   :    " + start.toString() + " to " + end.toString(),
      styles: SunmiStyles(alignment: SunmiAlign.left, isBold: true),
    );

    MaxxSunmiPrinter.printText(
      "BALANCE   :    " + wallet_amount,
      styles: SunmiStyles(alignment: SunmiAlign.left, isBold: true),
    );

    // MaxxSunmiPrinter.paperFeed(number: 1);

    ///date servive amnt com (coulmo)-->

    MaxxSunmiPrinter.printTable(
      isBold: true,
      cols: [
        SunmiCol(text: 'DATE', width: 3),
        SunmiCol(text: 'SERVICE', width: 3, alignment: SunmiAlign.center),
        SunmiCol(text: 'AMNT', width: 3, alignment: SunmiAlign.right),
        SunmiCol(text: 'COM%', width: 3, alignment: SunmiAlign.right),
      ],
    );

    ///listtt-->
    print("xxxxxxxxxxxxxx");

    for (var i = 0; i < arrProdList.length; i++) {
      print("xxxxxxxxxxxxxx");
      print(arrProdList[i]['RechargedTime']);

      MaxxSunmiPrinter.printTable(
        isBold: true,
        cols: [
          SunmiCol(text: arrProdList[i]['Date'], width: 3),
          SunmiCol(
              text: arrProdList[i]['Service'], width: 3, alignment: SunmiAlign.center),
          SunmiCol(
              text: arrProdList[i]['Amount'], width: 3, alignment: SunmiAlign.right),
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
      "TOTAL AMOUNT   :    " + total_amount.toString(),
      styles: SunmiStyles(alignment: SunmiAlign.left, isBold: true),
    );
    MaxxSunmiPrinter.printText(
      "TOTAL PROFIT   :    " + total_commission.toString(),
      styles: SunmiStyles(alignment: SunmiAlign.left, isBold: true),
    );
    MaxxSunmiPrinter.paperFeed(number: 4);

    setState(() {
      isTap = false;
    });
  }
  Future<Uint8List> networkImageToByte(String imageUrl) async {
    final ByteData imageData = await NetworkAssetBundle(Uri.parse(imageUrl)).load("");
    final Uint8List bytes = imageData.buffer.asUint8List();
    return bytes;
  }
  @override
  Widget build(BuildContext context) {
    return
      // isLoading == true
      //   ? Container(child: Center(child: CircularProgressIndicator()))
      //   :
      SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.grey[200],
              child: Container(
                  margin:
                  EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Card(child: rec())),
            ),
            SizedBox(height: 5,),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                children: [
                  // Expanded(
                  //   child: Container(
                  //     child: Padding(
                  //       padding: const EdgeInsets.all(15.0),
                  //       child: Text(
                  //         "From Date",
                  //         textAlign: TextAlign.center,
                  //         style: TextStyle(
                  //           fontWeight: FontWeight.w500,
                  //           color: Colors.white,
                  //         ),
                  //       ),
                  //     ),
                  //     color: darkBlue,
                  //   ),
                  // ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        selectDateRange(context);
                      },
                      child: Container(
                        height: 50,
                        width: 10,
                        margin: EdgeInsets.symmetric(horizontal: 2),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text(
                            "Pick Date",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        color: darkBlue,
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: isTap == true
                          ? null
                          : () {
                        setState(() {
                          isTap = true;
                        });
                        printOut2();
                      },
                      child: Container(
                        height: 50,
                        width: 10,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text(
                            "Print",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        color: isTap == true ? Colors.grey : darkBlue,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );
  }

  rec() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: ConstrainedBox(
            constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.8),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Image.asset(
                    "assets/images/logo.png",
                    height: 40,
                  ),
                ),
                Text(
                  "www.plexpay.in",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      letterSpacing: 0.3),
                ),
                SizedBox(
                  height: 10,
                ),
                Image(
                  image: NetworkImage(
                      "https://www.tolcocorp.com/wp-content/uploads/2013/01/160105M.png"),
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  DateTime.now().toString(),
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      letterSpacing: 0.3),
                ),
                SizedBox(
                  height: 20,
                ),
                Wrap(
                  runSpacing: 10,
                  children: [
                    _items("receipt no.", "#12346567890"),
                    _items("point name", name),
                    _items(
                        "duration", start.toString() + " to " + end.toString()),
                    _items("balance", wallet_amount.toString()),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: Text(
                            "DATE",
                            style: receiptbold,
                          ),
                          flex: 2,
                        ),
                        Expanded(
                          child: Text("SERVICES", style: receiptbold),
                          flex: 2,
                        ),
                        Expanded(
                          child: Text("AMT", style: receiptbold),
                          flex: 1,
                        ),
                        Expanded(
                          child: Text("COM%", style: receiptbold),
                          flex: 1,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
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
                        return ReportList(item, index);
                      },
                    ),
                    MySeparator(),
                    _Bolditems("total amount", "AED " + total_amount.toString()),
                    _Bolditems(
                        "total commission", "AED " + total_commission.toString()),
                  ],
                ),

                // SizedBox(
                //   height: MediaQuery.of(context).size.height * 0.03,
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  ReportList(var item, int index) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: Text(
            item['Date'].toString(),
            style: receiptbold,
          ),
          flex: 2,
        ),
        Expanded(
          child: Text(
            item['Service'].toString(),
            style: receiptbold,
          ),
          flex: 2,
        ),
        Expanded(
          child: Text(
            item['Amount'].toString(),
            style: receiptbold,
          ),
          flex: 1,
        ),
        Expanded(
          child: Text(
            item['Commission'].toString(),
            style: receiptbold,
          ),
          flex: 1,
        )
      ],
    );
  }

  _items(String frst, String scnd) {
    return Row(
      children: [
        Expanded(
            flex: 2,
            child: Text(
              frst.toUpperCase(),
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
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

  _Bolditems(String frst, String scnd) {
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
