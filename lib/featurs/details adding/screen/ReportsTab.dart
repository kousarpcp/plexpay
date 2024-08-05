// import 'dart:convert';
// import 'dart:typed_data';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// import '../Api/RechargeReportApi.dart';
// import '../Const/SharedPref.dart';
// import '../Helper/Resources.dart';
// // import 'package:flutter_sunmi_printer/flutter_sunmi_printer.dart';
// // import 'package:network_image_to_byte/network_image_to_byte.dart';
// // import 'package:plexpay/Api/profitApi.dart';
// // import 'package:plexpay/Api/rechargeReportApi.dart';
// // import 'package:plexpay/Api/walletAmnt.dart';
// // import 'package:plexpay/Const/network.dart';
// // import 'package:plexpay/Const/sharedPref.dart';
// // import 'package:plexpay/Helper/resources.dart';
//
// class ReportsTab extends StatefulWidget {
//   @override
//   _ReportsTabState createState() => _ReportsTabState();
// }
//
// class _ReportsTabState extends State<ReportsTab> {
//   var purchaseDate = "0";
//
//   var start = DateTime.now().year.toString() +
//       "-" +
//       DateTime.now().month.toString() +
//       "-" +
//       DateTime.now().day.toString();
//   var end = DateTime.now().year.toString() +
//       "-" +
//       DateTime.now().month.toString() +
//       "-" +
//       DateTime.now().day.toString();
//
//   var arrProdList = [];
//
//   var isLoading = true;
//   var isTap = false;
//
//
//
//   var total_amount ;
//   var name;
//   var total_commission;
//   var wallet_amount;
//   //List<dynamic> data = [];
//   @override
//   void initState() {
//     super.initState();
//
//     this.getHome();
//
//
//     setState(() {});
//     print("timeee");
//     print(DateTime.now());
//   }
//
//   Future<String> getHome() async {
//     name = await getSharedPrefrence("name");
//     setState(() {
//       isLoading = true;
//       // total = 0.0;
//       // totalprofit = 0.0;
//     });
//
//     print("xoxoxo");
//     var rsp = await rechargeReportApi(start, end);
//     print("xoxoxo");
//     print(rsp);
//
//     // arrProdList = data;
//     //
//     if (rsp['status'] == true && rsp['result'] != "Empty") {
//       setState(() {
//         arrProdList = rsp['result'];
//         total_amount = rsp['total_amount']!=null?rsp['total_amount']:"0";
//         total_commission = rsp['total_commission']!=null?rsp['total_commission']:"0";
//         wallet_amount = rsp['Balance']!=null?rsp['Balance']:"0";
//
//         // for (var i = 0; i < arrProdList.length; i++) {
//         //   total = total +
//         //       (double.parse(arrProdList[i]["MRP"]
//         //           .toString()
//         //           .split(" ")
//         //           .last
//         //           .toString()
//         //           .trim()));
//         //   totalprofit = totalprofit +
//         //       (double.parse(arrProdList[i]["profit"]
//         //           .toString()
//         //           .split(" ")
//         //           .last
//         //           .toString()
//         //           .trim()));
//         // }
//       });
//     }
//
//     print("arrLoistt");
//     print(arrProdList);
//     setState(() {
//       isLoading = false;
//     });
//
//     return "";
//   }
//
//
//
//   // Future selectDateRange(BuildContext context) async {
//   //   DateTimeRange pickedRange = (await showDateRangePicker(
//   //       context: context,
//   //       initialDateRange: DateTimeRange(
//   //         start: DateTime.now(),
//   //         end: DateTime.now(),
//   //       ),
//   //       firstDate: DateTime(DateTime.now().year + -5),
//   //       lastDate: DateTime(DateTime.now().year + 2),
//   //       helpText: 'Select Date Range',
//   //       cancelText: 'CANCEL',
//   //       confirmText: 'OK',
//   //       saveText: 'SAVE',
//   //       errorFormatText: 'Invalid format.',
//   //       errorInvalidText: 'Out of range.',
//   //       errorInvalidRangeText: 'Invalid range.',
//   //       fieldStartHintText: 'Start Date',
//   //       fieldEndLabelText: 'End Date'));
//   //
//   //   if (pickedRange != null) {
//   //     setState(() {
//   //       start = pickedRange.start.year.toString() +
//   //           "-" +
//   //           pickedRange.start.month.toString() +
//   //           "-" +
//   //           pickedRange.start.day.toString();
//   //       end = pickedRange.end.year.toString() +
//   //           "-" +
//   //           pickedRange.end.month.toString() +
//   //           "-" +
//   //           pickedRange.end.day.toString();
//   //     });
//   //
//   //     getHome();
//   //
//   //     print(pickedRange.start.day);
//   //     print(pickedRange.start.month);
//   //     print(pickedRange.start.year);
//   //   }
//   // }
//
//   // void printOut2() async {
//   //   /// logo
//   //
//   //   Uint8List byteImage1 = await networkImageToByte(pluspayImgUrl);
//   //   final imgData1 = base64.encode(byteImage1);
//   //   // var convrt = await imgConvert(byteImage1);
//   //
//   //   SunmiPrinter.image(imgData1);
//   //
//   //   //SunmiPrinter.emptyLines(1);
//   //   /// url
//   //
//   //   SunmiPrinter.text("www.plexpay.in",
//   //       styles: SunmiStyles(align: SunmiAlign.center, bold: true));
//   //
//   //   ///   barcode
//   //   Uint8List byteImage = await networkImageToByte(barcodImgUrl);
//   //
//   //   final imgData = base64.encode(byteImage);
//   //   SunmiPrinter.image(imgData);
//   //   SunmiPrinter.emptyLines(1);
//   //   //   SunmiPrinter.hr();
//   //
//   //   ///  now date
//   //   SunmiPrinter.text(DateTime.now().toString(),
//   //       styles: SunmiStyles(align: SunmiAlign.center, bold: true));
//   //
//   //   SunmiPrinter.emptyLines(1);
//   //
//   //   ///datas ->
//   //
//   //   SunmiPrinter.text(
//   //     "RECEIPT NO   :    " + DateTime.now().millisecond.toString(),
//   //     styles: SunmiStyles(align: SunmiAlign.left, bold: true),
//   //   );
//   //
//   //   SunmiPrinter.text(
//   //     "POINT NAME   :    " + name.toString(),
//   //     styles: SunmiStyles(align: SunmiAlign.left, bold: true),
//   //   );
//   //
//   //   SunmiPrinter.text(
//   //     "DURATION   :    " + start.toString() + " to " + end.toString(),
//   //     styles: SunmiStyles(align: SunmiAlign.left, bold: true),
//   //   );
//   //
//   //   SunmiPrinter.text(
//   //     "BALANCE   :    " + wallet_amount,
//   //     styles: SunmiStyles(align: SunmiAlign.left, bold: true),
//   //   );
//   //
//   //   SunmiPrinter.emptyLines(1);
//   //
//   //   ///date servive amnt com (coulmo)-->
//   //
//   //   SunmiPrinter.row(
//   //     cols: [
//   //       SunmiCol(text: 'DATE', width: 3),
//   //       SunmiCol(text: 'SERVICE', width: 3, align: SunmiAlign.center),
//   //       SunmiCol(text: 'AMNT', width: 3, align: SunmiAlign.right),
//   //       SunmiCol(text: 'COM%', width: 3, align: SunmiAlign.right),
//   //     ],
//   //   );
//   //
//   //   ///listtt-->
//   //   print("xxxxxxxxxxxxxx");
//   //
//   //   for (var i = 0; i < arrProdList.length; i++) {
//   //     print("xxxxxxxxxxxxxx");
//   //     print(arrProdList[i]['RechargedTime']);
//   //
//   //     SunmiPrinter.row(
//   //       cols: [
//   //         SunmiCol(text: arrProdList[i]['Date'], width: 3),
//   //         SunmiCol(
//   //             text: arrProdList[i]['Service'], width: 3, align: SunmiAlign.center),
//   //         SunmiCol(
//   //             text: arrProdList[i]['Amount'], width: 3, align: SunmiAlign.right),
//   //         SunmiCol(
//   //             text: arrProdList[i]['Commission'],
//   //             width: 3,
//   //             align: SunmiAlign.right),
//   //       ],
//   //     );
//   //   }
//   //
//   //   /// dotter hr line
//   //
//   //   SunmiPrinter.hr();
//   //
//   //   ///totals
//   //   SunmiPrinter.text(
//   //     "TOTAL AMOUNT   :    " + total_amount.toString(),
//   //     styles: SunmiStyles(align: SunmiAlign.left, bold: true),
//   //   );
//   //   SunmiPrinter.text(
//   //     "TOTAL PROFIT   :    " + total_commission.toString(),
//   //     styles: SunmiStyles(align: SunmiAlign.left, bold: true),
//   //   );
//   //   SunmiPrinter.emptyLines(4);
//   //
//   //   setState(() {
//   //     isTap = false;
//   //   });
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//     return isLoading == true
//         ? Container(child: Center(child: CircularProgressIndicator()))
//         : SingleChildScrollView(
//       child: Column(
//         children: [
//           Container(
//             color: Colors.grey[200],
//             child: Container(
//                 margin:
//                 EdgeInsets.symmetric(horizontal: 15, vertical: 10),
//                 child: Card(child: rec())),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(bottom: 10),
//             child: Row(
//               children: [
//                 // Expanded(
//                 //   child: Container(
//                 //     child: Padding(
//                 //       padding: const EdgeInsets.all(15.0),
//                 //       child: Text(
//                 //         "From Date",
//                 //         textAlign: TextAlign.center,
//                 //         style: TextStyle(
//                 //           fontWeight: FontWeight.w500,
//                 //           color: Colors.white,
//                 //         ),
//                 //       ),
//                 //     ),
//                 //     color: darkBlue,
//                 //   ),
//                 // ),
//                 Expanded(
//                   child: GestureDetector(
//                     onTap: () {
//                       // selectDateRange(context);
//                     },
//                     child: Container(
//                       margin: EdgeInsets.symmetric(horizontal: 2),
//                       child: Padding(
//                         padding: const EdgeInsets.all(15.0),
//                         child: Text(
//                           "Pick Date",
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                             fontWeight: FontWeight.w500,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                       color: darkBlue,
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   child: GestureDetector(
//                     onTap: isTap == true
//                         ? null
//                         : () {
//                       setState(() {
//                         isTap = true;
//                       });
//                       // printOut2();
//                     },
//                     child: Container(
//                       child: Padding(
//                         padding: const EdgeInsets.all(15.0),
//                         child: Text(
//                           "Print",
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                             fontWeight: FontWeight.w500,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                       color: isTap == true ? Colors.grey : darkBlue,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
//
//   rec() {
//     return Padding(
//       padding: const EdgeInsets.all(15.0),
//       child: Container(
//         color: Colors.white,
//         child: Padding(
//           padding: const EdgeInsets.symmetric(vertical: 10),
//           child: ConstrainedBox(
//             constraints: BoxConstraints(
//                 maxWidth: MediaQuery.of(context).size.width * 0.8),
//             child: Column(
//               mainAxisSize: MainAxisSize.max,
//               children: [
//                 FittedBox(
//                   fit: BoxFit.fitWidth,
//                   child: Image.asset(
//                     "assets/images/logo.png",
//                     height: 40,
//                   ),
//                 ),
//                 Text(
//                   "www.plexpay.in",
//                   style: TextStyle(
//                       fontWeight: FontWeight.w400,
//                       fontSize: 14,
//                       letterSpacing: 0.3),
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Image(
//                   image: NetworkImage(
//                       "https://www.incimages.com/uploaded_files/image/1920x1080/*Barcode_32896.jpg"),
//                   height: MediaQuery.of(context).size.height * 0.1,
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Text(
//                   DateTime.now().toString(),
//                   style: TextStyle(
//                       fontWeight: FontWeight.w400,
//                       fontSize: 14,
//                       letterSpacing: 0.3),
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Wrap(
//                   runSpacing: 10,
//                   children: [
//                     _items("receipt no.", "#12346567890"),
//                     _items("point name", name),
//                     _items(
//                         "duration", start.toString() + " to " + end.toString()),
//                     _items("balance", wallet_amount.toString()),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         Expanded(
//                           child: Text(
//                             "DATE",
//                             style: receiptbold,
//                           ),
//                           flex: 2,
//                         ),
//                         Expanded(
//                           child: Text("SERVICES", style: receiptbold),
//                           flex: 2,
//                         ),
//                         Expanded(
//                           child: Text("AMT", style: receiptbold),
//                           flex: 1,
//                         ),
//                         Expanded(
//                           child: Text("COM%", style: receiptbold),
//                           flex: 1,
//                         ),
//                       ],
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     ListView.separated(
//                       scrollDirection: Axis.vertical,
//                       physics: NeverScrollableScrollPhysics(),
//                       separatorBuilder: (context, index) => SizedBox(
//                         height: 10,
//                       ),
//                       shrinkWrap: true,
//                       itemCount: arrProdList != null ? arrProdList.length : 0,
//                       itemBuilder: (context, index) {
//                         final item =
//                         arrProdList != null ? arrProdList[index] : null;
//                         return ReportList(item, index);
//                       },
//                     ),
//                     MySeparator(),
//                     _Bolditems("total amount", "AED " + total_amount.toString()),
//                     _Bolditems(
//                         "total commission", "AED " + total_commission.toString()),
//                   ],
//                 ),
//
//                 // SizedBox(
//                 //   height: MediaQuery.of(context).size.height * 0.03,
//                 // ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   ReportList(var item, int index) {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       mainAxisSize: MainAxisSize.max,
//       children: [
//         Expanded(
//           child: Text(
//             item['Date'].toString(),
//             style: receiptbold,
//           ),
//           flex: 2,
//         ),
//         Expanded(
//           child: Text(
//             item['Service'].toString(),
//             style: receiptbold,
//           ),
//           flex: 2,
//         ),
//         Expanded(
//           child: Text(
//             item['Amount'].toString(),
//             style: receiptbold,
//           ),
//           flex: 1,
//         ),
//         Expanded(
//           child: Text(
//             item['Commission'].toString(),
//             style: receiptbold,
//           ),
//           flex: 1,
//         )
//       ],
//     );
//   }
//
//   _items(String frst, String scnd) {
//     return Row(
//       children: [
//         Expanded(
//             flex: 2,
//             child: Text(
//               frst.toUpperCase(),
//               style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
//             )),
//         Text(":   "),
//         Expanded(
//             flex: 2,
//             child: Text(
//               scnd.toUpperCase(),
//               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
//             ))
//       ],
//     );
//   }
//
//   _Bolditems(String frst, String scnd) {
//     return Row(
//       children: [
//         Expanded(
//             flex: 2,
//             child: Text(
//               frst.toUpperCase(),
//               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
//             )),
//         Text(":   "),
//         Expanded(
//             flex: 2,
//             child: Text(
//               scnd.toUpperCase(),
//               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
//             ))
//       ],
//     );
//   }
// }
//
// class MySeparator extends StatelessWidget {
//   final double height;
//   final Color color;
//
//   const MySeparator({this.height = 2, this.color = Colors.black});
//
//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(
//       builder: (BuildContext context, BoxConstraints constraints) {
//         final boxWidth = constraints.constrainWidth();
//         final dashWidth = 3.0;
//         final dashHeight = height;
//         final dashCount = (boxWidth / (2 * dashWidth)).floor();
//         return Flex(
//           children: List.generate(dashCount, (_) {
//             return SizedBox(
//               width: dashWidth,
//               height: dashHeight,
//               child: DecoratedBox(
//                 decoration: BoxDecoration(color: color),
//               ),
//             );
//           }),
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           direction: Axis.horizontal,
//         );
//       },
//     );
//   }
// }
