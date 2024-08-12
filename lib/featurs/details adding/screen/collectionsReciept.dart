// import 'dart:convert';
// // import 'dart:nativewrappers/_internal/vm/lib/typed_data_patch.dart';
// import 'dart:typed_data';
//
//
// import 'package:esys_flutter_share_plus/esys_flutter_share_plus.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_bluetooth_basic/flutter_bluetooth_basic.dart';
// import 'package:maxx_sunmi_printer/maxx_sunmi_printer.dart';
// import 'package:plexpay/Const/colorConst.dart';
// import 'package:plexpay/Const/imageConst.dart';
// import 'package:screenshot/screenshot.dart';
//
// import '../../../main.dart';
// import '../../../Const/NetWork.dart';
//
// class CollectionsReceipt extends StatefulWidget {
//   const CollectionsReceipt({super.key});
//
//   @override
//   State<CollectionsReceipt> createState() => _billState();
// }
//
// class _billState extends State<CollectionsReceipt> {
//
//   var start =DateTime.now().year.toString()+"-"+DateTime.now().month.toString()+"-"+DateTime.now().day.toString();
//   var end =DateTime.now().year.toString()+"-"+DateTime.now().month.toString()+"-"+DateTime.now().day.toString();
//
//   DateTime now = DateTime.now();
//
//   void printOut2()async{
//
//
//     setState(() {
//       isTap =true;
//     });
//
//     Uint8List byteImage1 = await networkImageToByte(pluspayImgUrl);
//     final imgData1 = base64.encode(byteImage1);
//     MaxxSunmiPrinter.printImage(imgData1, align: SunmiAlign.center,);
//     MaxxSunmiPrinter.printText("www.plexpay.in",
//         styles: SunmiStyles(alignment: SunmiAlign.center, isBold: true));
//
//     MaxxSunmiPrinter.printBarcode(
//       "https://pngimg.com/uploads/barcode/barcode_PNG19.png",);
//     MaxxSunmiPrinter.printTextLine();
//
//     ///  now date
//     MaxxSunmiPrinter.printText(DateTime.now().toString(),
//       styles: SunmiStyles(alignment: SunmiAlign.center,isBold: true),  );
//     ///datas ->
//
//
//
//     MaxxSunmiPrinter.printText(
//       "ID    :  "+a[0]["trans_id"],
//       styles: SunmiStyles(alignment: SunmiAlign.left,isBold: true),
//     );
//
//     MaxxSunmiPrinter.printText(
//       "POINT NAME    :  "+a[0]["point_name"].toString(),
//       styles: SunmiStyles(alignment: SunmiAlign.left,isBold: true),
//     );
//
//     MaxxSunmiPrinter.printText(
//       "AGENT NAME        :  "+a[0]["agent_name"].toString(),
//       styles: SunmiStyles(alignment: SunmiAlign.left,isBold: true),
//     );
//     MaxxSunmiPrinter.printText(
//       "DUE WALLET        :  "+a[0]["due_wallet"].toString(),
//       styles: SunmiStyles(alignment: SunmiAlign.left,isBold: true),
//     );
//     MaxxSunmiPrinter.printText(
//       "COLLECTION AMOUNT :  "+a[0]["collection_amount"].toString(),
//       styles: SunmiStyles(alignment: SunmiAlign.left,isBold: true),
//     );
//     MaxxSunmiPrinter.printText(
//       "MODE OF PAYMENT   :  "+a[0]["mode_of_payment"].toString(),
//       styles: SunmiStyles(alignment: SunmiAlign.left,isBold: true),
//     );
//     MaxxSunmiPrinter.printText(
//       "DUE BALANCE       :  "+a[0]["due_balance"].toString(),
//       styles: SunmiStyles(alignment: SunmiAlign.left,isBold: true),
//     );
//
//     MaxxSunmiPrinter.printText(
//       "DATE & TIME       :  "+a[0]["entry_date"].toString(),
//       styles: SunmiStyles(alignment: SunmiAlign.left,isBold: true),
//     );
//     MaxxSunmiPrinter.printText(
//       "STATUS            :  "+"SUCCESS",
//       styles: SunmiStyles(alignment: SunmiAlign.left,isBold: true),
//     );
//     MaxxSunmiPrinter.printTextLine();
//     // MaxxSunmiPrinter.paperFeed(number: 1);
//     MaxxSunmiPrinter.printText("Help & Support",styles: SunmiStyles(alignment: SunmiAlign.center,isBold: true));
//     MaxxSunmiPrinter.printText("Whatsapp Support: +971589692115",styles: SunmiStyles(
//         alignment: SunmiAlign.center
//     ));
//
//
//     setState(() {
//       isTap=false;
//     });
//
//   }
//
//   Future<Uint8List> networkImageToByte(String imageUrl) async {
//     final ByteData imageData = await NetworkAssetBundle(Uri.parse(imageUrl)).load("");
//     final Uint8List bytes = imageData.buffer.asUint8List();
//     return bytes;
//   }
//
//   ScreenshotController screenshotController = ScreenshotController();
//   Uint8List? _imageFile;
//   BluetoothManager bluetoothManager = BluetoothManager.instance;
//
//   void capture(){
//     screenshotController
//         .capture(delay: Duration(milliseconds: 10)).then(
//             (Uint8List? image) async {
//           if (image != null) {
//             await Share.file('Plus Pay Recharge', 'card.jpg', image, 'image/jpg');
//             setState(() {
//               _imageFile = image;
//             });
//           }
//
//         }
//     )
//         .catchError((onError) {
//       print(onError);
//     });
//   }
//
//   List a=[
//     {
//       "trans_id":"test",
//       "point_name":"807",
//       "agent_name":"test",
//       "due_wallet":"887",
//       "collection_amount":675,
//       "mode_of_payment":"test",
//       "due_balance":766,
//       "entry_date":DateTime.now().day
//     },
//   ];
//   var isTap =false;
//   var nowDate ="";
//   var nowTime ="";
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Center(
//               child: Screenshot(
//                 controller: screenshotController,
//                 child: Container(
//                   height: width*1.55,
//                   width: width*0.75,
//                   margin: EdgeInsets.only(top: width*0.03),
//                   decoration: BoxDecoration(
//                       color: Colors.white,
//                       boxShadow: [
//                         BoxShadow(
//                             color: colorConst.lightgrey,
//                             spreadRadius: 0.01,
//                             blurRadius: 2,
//                             offset: Offset(0,01)
//                         )
//                       ],
//                       borderRadius: BorderRadius.circular(width*0.02)
//                   ),
//                   child: Padding(
//                     padding:  EdgeInsets.all(width*0.02),
//                     child: Column(
//                       children: [
//                         Image.asset(ImageConst.plexpay,width: width*0.47,),
//                         SizedBox(
//                           height: width*0.025,
//                         ),
//                         Text(
//                           "www.plexpay.in",
//                           style: TextStyle(
//                               fontWeight: FontWeight.w400,
//                               fontSize: width*0.028,
//                               letterSpacing: 0.3),
//                         ),
//                         SizedBox(
//                           height: width*0.01,
//                         ),
//                         Image(
//                           image: NetworkImage(
//                               "https://pngimg.com/uploads/barcode/barcode_PNG19.png"),
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Row(
//                               children: [
//                                 Text("17-Jul-2024  ",style: TextStyle(fontSize: width*0.03)),
//                                 Container(
//                                   height: width*0.04,
//                                   width: width*0.004,color: Colors.black,
//                                 ),
//                                 Text("  11:22 AM",style: TextStyle(fontSize: width*0.03),),
//                               ],
//                             ),
//                           ],
//                         ),
//                         SizedBox(
//                           height: width*0.04,
//                         ),
//                         Expanded(
//                           child: ListView.separated(
//                               shrinkWrap: true,
//                               physics: NeverScrollableScrollPhysics(),
//                               itemBuilder: (context, index) {
//                                 return Container(
//                                   height: width*0.5,
//                                   width: width*0.3,
//                                   color: Colors.red,
//                                   child: Column(
//                                     children: [
//                                       Row(
//                                         // mainAxisAlignment: MainAxisAlignment.start,
//                                         children: [
//                                           Text("ID"),
//                                           Text(":"),
//                                           Text(a[0]["trans_id"]),
//                                           Text("POINT NAME :  "),
//                                           Text(a[0]["point_name"]),
//
//                                         ],
//                                       ),
//                                       Row(
//                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//
//                                         children: [
//
//                                         ],
//                                       ),
//                                       Row(
//                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//
//                                         children: [
//
//                                         ],
//                                       ),
//                                       Row(
//                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//
//                                         children: [
//                                           Text("DUE WALLET :  "),
//                                           Text(a[0]["due_wallet"]),
//                                         ],
//                                       ),
//                                       Row(
//                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//
//                                         children: [
//                                           Text("COLLECTED AMOUNT :  "),
//                                           Text(a[0]["collection_amount"].toString()),
//                                         ],
//                                       ),
//                                       Row(
//                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                         children: [
//                                           Text("MODE OF PAYMENT :  "),
//
//                                           Text(a[0]["mode_of_payment"]),
//                                         ],
//                                       ),
//                                       Row(
//                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                         children: [
//                                           Text("DUE BALANCE :  "),
//                                           Text(a[0]["due_balance"].toString()),
//                                         ],
//                                       ),
//                                       Row(
//                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                         children: [
//                                           Text("ENTRY DATE :  "),
//                                           Text(a[0]["entry_date"].toString()),
//                                         ],
//                                       ),
//                                       SizedBox(
//                                         height: width*0.03,
//                                       ),
//                                     ],
//                                   ),
//                                 );
//                               },
//                               separatorBuilder: (context, index) {
//                                 return SizedBox(
//                                   width: width*0.02,
//                                 );
//                               },
//                               itemCount: a.length
//                           ),
//                         ),
//                         SizedBox(
//                           height: width*0.05,
//                         ),
//                         Text("Help & Support",style: TextStyle(fontSize: width*0.06,fontWeight: FontWeight.w800),),
//                         SizedBox(
//                           height: width*0.04,
//                         ),
//                         Text("WhatsApp Support: +971589692115"),
//                         SizedBox(
//                           height: width*0.06,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//
//           ],
//         ),
//         // bottomNavigationBar:
//         // InkWell(
//         //   onTap: () {
//         //     isTap==true?null:(){
//         //       setState(() {
//         //         isTap=true;
//         //       });
//         //       printOut();
//         //     };
//         //   },
//         //   child: Container(
//         //     // height: width*0.18,
//         //     child: Row(
//         //       children: [
//         //         Container(
//         //           height: width*0.12,
//         //           width: width*0.49,
//         //           color:isTap==true?Colors.grey: Colors.indigo,
//         //             child: Center(child: Text("Print",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700,fontSize: width*0.06),)),
//         //         ),
//         //         SizedBox(
//         //           width: width*0.02,
//         //         ),
//         //         InkWell(
//         //           onTap: () {
//         //
//         //           },
//         //           child: Container(
//         //             height: width*0.12,
//         //             width: width*0.49,
//         //               color: Colors.indigo,
//         //               child: Center(
//         //                 child: Text("Share",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700,fontSize: width*0.06)
//         //                                   ),
//         //               ),
//         //           ),
//         //         )
//         //       ],
//         //     ),
//         //   ),
//         // ),
//         bottomNavigationBar: Container(
//           height: width*0.18,
//           child: Row(
//             children: [
//               Expanded(child: Button1("Print")),
//               Expanded(child: Button2("Share"))
//             ],
//           ),
//         ),
//
//       ),
//     );
//   }
//
//
//   Widget Button1(String label) {
//     return GestureDetector(
//       onTap:isTap==true?null:(){
//         setState(() {
//           isTap=true;
//         });
//         printOut2();
//       } ,
//       child: Container(
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(width*0.06),
//             color:isTap==true?Colors.grey: colorConst.blue
//         ),
//         margin: EdgeInsets.all(width*0.03),
//         alignment: Alignment.center,
//         height: width*0.14,
//         child: Text(
//           label,
//           style: TextStyle(
//               color: Colors.white, fontSize: width*0.052, fontWeight: FontWeight.w600),
//         ),
//
//       ),
//     );
//   }
//   Widget Button2(String label) {
//     return GestureDetector(
//       onTap:(){
//         capture();
//       } ,
//       child: Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(width*0.06),
//           color: colorConst.blue,
//
//         ),
//         alignment: Alignment.center,
//         margin: EdgeInsets.all(width*0.03),
//         height: width*0.14,
//         child: Text(
//           label,
//           style: TextStyle(
//               color: Colors.white, fontSize:  width*0.052, fontWeight: FontWeight.w600),
//         ),
//       ),
//     );
//   }
// }
