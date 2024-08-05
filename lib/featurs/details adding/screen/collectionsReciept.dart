//
//
// import 'package:flutter/material.dart';
// import 'package:flutter_sunmi_printer_plus/enums.dart';
// import 'package:flutter_sunmi_printer_plus/flutter_sunmi_printer_plus.dart';
// import 'package:flutter_sunmi_printer_plus/sunmi_style.dart';
// // import 'package:plexpay/Api/collectionInfoApi.dart';
// // import 'package:plexpay/Const/network.dart';
// // import 'package:plexpay/Helper/resources.dart';
// // import 'package:flutter_sunmi_printer/flutter_sunmi_printer.dart';
// import 'dart:convert';
// import 'dart:typed_data';
//
//
// import '../Api/CollectionInfoApi.dart';
// import '../Const/NetWork.dart';
//
// class CollectionsReceipt extends StatefulWidget {
//   // const Receipt({Key? key}) : super(key: key);
//   final id;
//
//
//   CollectionsReceipt({this.id});
//   @override
//   _CollectionsReceiptState createState() => _CollectionsReceiptState();
// }
//
// class _CollectionsReceiptState extends State<CollectionsReceipt> {
//
//
//   var trans_id ="";
//   var user_id ="";
//   var due_wallet ="";
//   var entry_date ="";
//   var collected_amount ="";
//   var due_balance ="";
//   var agent_name ="";
//   var mode_of_payment ="";
//
//   var point_name ="";
//
//   var isTap =false;
//   var  isLoading = true;
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     print("orderid");
//     print(widget.id);
//
//     this.getHome();
//     //  this.bluetoothSearch();
//
//
//   }
//
//   Future<bool> getHome() async {
//
//
//
//     var rsp = await collectionInfoApi(widget.id.toString());
//     print(rsp);
//     if(rsp['status']==true){
//       setState(() {
//         trans_id =rsp['due_info'][0]['trans_id'].toString();
//         user_id =rsp['due_info'][0]['user_id'].toString();
//         due_wallet =rsp['due_info'][0]['due_wallet'].toString();
//         mode_of_payment =rsp['due_info'][0]['mode_of_payment'].toString();
//         entry_date =rsp['due_info'][0]['entry_date'].toString();
//         collected_amount =rsp['due_info'][0]['collected_amount'].toString();
//         due_balance =rsp['due_info'][0]['due_balance'].toString();
//         agent_name =rsp['due_info'][0]['agent_name'].toString();
//         point_name =rsp['due_info'][0]['point_name'].toString();
//         isLoading=false;
//       });
//     }
//     return true;
//
//   }
//
//
//   void printOut2()async{
//
//
//     setState(() {
//       isTap =true;
//     });
//
//     /// logo
//
//     Uint8List byteImage1 = await networkImageToByte(pluspayImgUrl);
//     dynamic imgData1 = base64.encode(byteImage1);
//     // var convrt = await imgConvert(byteImage1);
//
//     SunmiPrinter.printImage(image: imgData1, align: SunmiPrintAlign.CENTER);
//
//     //SunmiPrinter.emptyLines(1);
//     /// url
//
//     SunmiPrinter.printText(content: "www.plexpay.in",
//         style: SunmiStyle(align: SunmiPrintAlign.CENTER,bold: true));
//
//     ///   barcode
//     Uint8List byteImage = await networkImageToByte(barcodImgUrl);
//
//
//     dynamic imgData = base64.encode(byteImage);
//     SunmiPrinter.printImage(image: imgData, align: SunmiPrintAlign.CENTER);
//     SunmiPrinter.lineWrap(1);
//     //   SunmiPrinter.hr();
//
//     ///  now date
//     SunmiPrinter.printText(content:DateTime.now().toString(),
//       style: SunmiStyle(align: SunmiPrintAlign.CENTER,bold: true),  );
//
//     SunmiPrinter.lineWrap(1);
//     ///datas ->
//
//
//
//     SunmiPrinter.printText(
//       content: "ID    :  "+trans_id,
//       style: SunmiStyle(align: SunmiPrintAlign.LEFT,bold: true),
//     );
//
//     SunmiPrinter.printText(
//       content: "POINT NAME    :  "+point_name.toString(),
//       style: SunmiStyle(align: SunmiPrintAlign.LEFT,bold: true),
//     );
//
//     SunmiPrinter.printText(
//       content: "AGENT NAME        :  "+agent_name.toString(),
//       style: SunmiStyle(align: SunmiPrintAlign.LEFT,bold: true),
//     );
//     SunmiPrinter.printText(
//       content: "DUE WALLET        :  "+due_wallet.toString(),
//       style: SunmiStyle(align: SunmiPrintAlign.LEFT,bold: true),
//     );
//     SunmiPrinter.printText(
//       content:  "COLLECTION AMOUNT :  "+collected_amount.toString(),
//       style: SunmiStyle(align: SunmiPrintAlign.LEFT,bold: true),
//     );
//     SunmiPrinter.printText(
//       content: "MODE OF PAYMENT   :  "+mode_of_payment.toString(),
//       style: SunmiStyle(align: SunmiPrintAlign.LEFT,bold: true),
//     );
//     SunmiPrinter.printText(
//       content: "DUE BALANCE       :  "+due_balance.toString(),
//       style: SunmiStyle(align: SunmiPrintAlign.LEFT,bold: true),
//     );
//
//     SunmiPrinter.printText(
//       content: "DATE & TIME       :  "+entry_date.toString(),
//       style: SunmiStyle(align: SunmiPrintAlign.LEFT,bold: true),
//     );
//     SunmiPrinter.printText(
//       content: "STATUS            :  "+"SUCCESS",
//       style: SunmiStyle(align: SunmiPrintAlign.LEFT,bold: true),
//     );
//
//
//     SunmiPrinter.lineWrap(3);
//
//     setState(() {
//       isTap=false;
//     });
//
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body:
//       // isLoading == true
//       //     ? Container(child: Center(child: CircularProgressIndicator()))
//       //     :
//       Stack(
//         children: [
//           Align(
//             alignment: Alignment.topCenter,
//             child: Container(
//               height: MediaQuery.of(context).size.height * 0.09,
//               decoration: BoxDecoration(
//                   // gradient: grad,
//                   borderRadius: BorderRadius.only(
//                       bottomLeft: Radius.circular(80),
//                       bottomRight: Radius.circular(80)),
//                   image: DecorationImage(
//                       image: AssetImage("assets/images/blncCont.png"),
//                       fit: BoxFit.cover)),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: 20),
//             child: Align(
//               alignment: Alignment.topLeft,
//               child: IconButton(
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//                 icon: Icon(
//                   Icons.arrow_back_outlined,
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(top: 50),
//             child: Align(
//               child: Stack(
//                 children: [
//                   SingleChildScrollView(
//                     child: Container(
//                       // margin: EdgeInsets.symmetric(horizontal: 50, vertical: 50),
//                       // height: MediaQuery.of(context).size.height * 0.75,
//                       child: Stack(
//                         // mainAxisSize: MainAxisSize.min,
//                         children: [
//                           Card(
//                             elevation: 2,
//                             margin: EdgeInsets.symmetric(
//                                 horizontal: 50, vertical: 50),
//                             child: Padding(
//                               padding: const EdgeInsets.symmetric(
//                                   horizontal: 15, vertical: 35),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [rec()],
//                               ),
//                             ),
//                           ),
//                           SizedBox(
//                             height: MediaQuery.of(context).size.height * 0.07,
//                           ),
//                           Positioned(
//                             right: 0,
//                             left: 0,
//                             bottom: 25,
//                             child: _Button(),
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   _Button() {
//     return GestureDetector(
//       onTap:isTap==true?null: (){
//         printOut2();
//       },
//       child: Container(
//         margin: EdgeInsets.symmetric(horizontal: 90),
//         alignment: Alignment.center,
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(10),
//             // gradient: grad2
//         ),
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
//           child: Text(
//             isTap==true?"Printing....":"Print",
//             style: TextStyle(
//                 fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white),
//           ),
//         ),
//       ),
//     );
//   }
//
//   rec() {
//     return Container(
//       color: Colors.white,
//       child: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 10),
//         child: ConstrainedBox(
//           constraints:
//           BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.8),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               FittedBox(
//                 fit: BoxFit.fitWidth,
//                 child: Image.asset(
//                   "assets/images/logo.png",
//                   height: 40,
//                 ),
//               ),
//               Text(
//                 "www.pluspays.in",
//                 style: TextStyle(
//                     fontWeight: FontWeight.w400,
//                     fontSize: 14,
//                     letterSpacing: 0.3),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               Image(
//                 image: NetworkImage(
//                     "https://www.incimages.com/uploaded_files/image/1920x1080/*Barcode_32896.jpg"),
//                 height: MediaQuery.of(context).size.height * 0.1,
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               Text(
//                 entry_date,
//                 style: TextStyle(
//                     fontWeight: FontWeight.w400,
//                     fontSize: 14,
//                     letterSpacing: 0.3),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               Wrap(
//                 runSpacing: 10,
//                 children: [
//                   _items("transaction id", trans_id),
//                   _items("point name", point_name),
//                   _items("agent name",agent_name),
//                   _items("due wallet", due_wallet),
//                   _items("collection amount", collected_amount),
//                   _items("mode of payment", mode_of_payment),
//                   _items("due balance", due_balance),
//                   _items("date & time", entry_date),
//                 ],
//               ),
//
//               SizedBox(
//                 height: MediaQuery.of(context).size.height * 0.03,
//               ),
//               // Text(
//               //   "WhatsApp Support: " + "0578914789",
//               //   style: TextStyle(fontWeight: FontWeight.bold),
//               // )
//             ],
//           ),
//         ),
//       ),
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
//               style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
//             )),
//         Text(":   "),
//         Expanded(
//             flex: 2,
//             child: Text(
//               scnd.toUpperCase(),
//               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//             ))
//       ],
//     );
//   }
//
//   networkImageToByte(barcodImgUrl) {}
// }
