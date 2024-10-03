import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../Const/imageConst.dart';
import '../../../main.dart';
import '../../../Const/colorConst.dart';
import 'Reacharge.dart';

class topUp extends StatefulWidget {
  const topUp({super.key, required this.number, required this.name});
  final String number;
  final String name;

  @override
  State<topUp> createState() => _topUpState();
}

class _topUpState extends State<topUp> {
  List AED = [
    {
      "Text1": "AED",
      "Text2": "30.85",
      "Text3": "Viw details",
      "Text4": "Validity",
      "Text5": "Talktime",
      "Text6": "Roaming Data",
      "Text7": "NA",
      "Text8": "AED 28.75",
      "Text9": "None    ",
      "Text10": "AED 42.85",
      "Text12": "Valid for 30 Days",
      "Text11": "1 GB Local Data Every Day (30 GB Total) for 30 days  "
          "and free Takeful Personal Accident Plan for AED 45"
          " (5%VAT Incl).",
    },
    {
      "Text1": "AED",
      "Text2": "50.25",
      "Text3": "Viw details",
      "Text4": "Validity",
      "Text5": "Talktime",
      "Text6": "Roaming Data",
      "Text7": "NA",
      "Text8": "AED 48.55",
      "Text9": "None    ",
      "Text10": "AED 40.00",
      "Text12": "Valid for 28 Days",
      "Text11": "Enjoy 75 MB Everyday (2.1 GB Total) Local Data "
          "Pack valid for 28 Days"
          " ",
    },
    {
      "Text1": "AED",
      "Text2": "100.05",
      "Text3": "Viw details",
      "Text4": "Validity",
      "Text5": "Talktime",
      "Text6": "Roaming Data",
      "Text7": "NA",
      "Text8": "AED 98.11",
      "Text9": "None    ",
      "Text10": "AED 325.00",
      "Text12": "Valid for 1 year",
      "Text11": "Non-Stop Local Data and 1 GB Roaming Data 900 Flexi   "
          "Minutes, 100 UAE Wi-FI hours and 12 Month Commitment"
          " ",
    },
    {
      "Text1": "AED",
      "Text2": "30.85",
      "Text3": "Viw details",
      "Text4": "Validity",
      "Text5": "Talktime",
      "Text6": "Roaming Data",
      "Text7": "NA",
      "Text8": "AED 28.75",
      "Text9": "None    ",
      "Text10": "AED 200.00",
      "Text12": "Valid for 1 year",
      "Text11": "13 GB Local Data 400 Flexi minutes (Local & Intl.)  "
          "100 UAE Wi-Fi hours "
          " ",
    },
    {
      "Text1": "AED",
      "Text2": "30.85",
      "Text3": "Viw details",
      "Text4": "Validity",
      "Text5": "Talktime",
      "Text6": "Roaming Data",
      "Text7": "NA",
      "Text8": "AED 28.75",
      "Text9": "None    ",
      "Text10": "AED 260.00",
      "Text12": "Valid for 1 year",
      "Text11": "20 GB Local Data 250 MB Roaming Data 600 Flexi minutes   "
          "(Local &Intl.) Calls to 1 Prefferd Number, 100"
          " UAE Wi-Fi hours and 12 month Commitment",
    },
    {
      "Text1": "AED",
      "Text2": "30.85",
      "Text3": "Viw details",
      "Text4": "Validity",
      "Text5": "Talktime",
      "Text6": "Roaming Data",
      "Text7": "NA",
      "Text8": "AED 28.75",
      "Text9": "None    ",
      "Text10": "AED 150.00",
      "Text12": "Valid for 7 Days",
      "Text11": "1 GB Local Data Every Day (30 GB Total) for 30 days  "
          "and free Takeful Personal Accident Plan for AED 45"
          " (5%VAT Incl).",
    },
    {
      "Text1": "AED",
      "Text2": "30.85",
      "Text3": "Viw details",
      "Text4": "Validity",
      "Text5": "Talktime",
      "Text6": "Roaming Data",
      "Text7": "NA",
      "Text8": "AED 28.75",
      "Text9": "None    ",
      "Text10": "AED 100.00",
      "Text12": "Valid for 30 Days",
      "Text11": "1 GB Local Data Every Day (30 GB Total) for 30 days  "
          "and free Takeful Personal Accident Plan for AED 45"
          " (5%VAT Incl).",
    },
    {
      "Text1": "AED",
      "Text2": "30.85",
      "Text3": "Viw details",
      "Text4": "Validity",
      "Text5": "Talktime",
      "Text6": "Roaming Data",
      "Text7": "NA",
      "Text8": "AED 28.75",
      "Text9": "None    ",
      "Text10": "AED 600.00",
      "Text12": "Valid for 30 Days",
      "Text11": "1 GB Local Data Every Day (30 GB Total) for 30 days  "
          "and free Takeful Personal Accident Plan for AED 45"
          " (5%VAT Incl).",
    },
    {
      "Text1": "AED",
      "Text2": "30.85",
      "Text3": "Viw details",
      "Text4": "Validity",
      "Text5": "Talktime",
      "Text6": "Roaming Data",
      "Text7": "NA",
      "Text8": "AED 28.75",
      "Text9": "None    ",
      "Text10": "AED 76.19",
      "Text12": "Valid for 60 Days",
      "Text11": "1 GB Local Data Every Day (30 GB Total) for 30 days  "
          "and free Takeful Personal Accident Plan for AED 45"
          " (5%VAT Incl).",
    },
    {
      "Text1": "AED",
      "Text2": "30.85",
      "Text3": "Viw details",
      "Text4": "Validity",
      "Text5": "Talktime",
      "Text6": "Roaming Data",
      "Text7": "NA",
      "Text8": "AED 28.75",
      "Text9": "None    ",
      "Text10": "AED 60.00",
      "Text12": "Valid for 30 Days",
      "Text11": "1 GB Local Data Every Day (30 GB Total) for 30 days  "
          "and free Takeful Personal Accident Plan for AED 45"
          " (5%VAT Incl).",
    },
    {
      "Text1": "AED",
      "Text2": "30.85",
      "Text3": "Viw details",
      "Text4": "Validity",
      "Text5": "Talktime",
      "Text6": "Roaming Data",
      "Text7": "NA",
      "Text8": "AED 28.75",
      "Text9": "None    ",
      "Text10": "AED 3.00",
      "Text12": "Valid for 1 Day",
      "Text11": "1 GB Local Data Every Day (30 GB Total) for 30 days  "
          "and free Takeful Personal Accident Plan for AED 45"
          " (5%VAT Incl).",
    },
    {
      "Text1": "AED",
      "Text2": "30.85",
      "Text3": "Viw details",
      "Text4": "Validity",
      "Text5": "Talktime",
      "Text6": "Roaming Data",
      "Text7": "NA",
      "Text8": "AED 28.75",
      "Text9": "None    ",
      "Text10": "AED 55.00",
      "Text12": "Valid for 28 Days",
      "Text11": "1 GB Local Data Every Day (30 GB Total) for 30 days  "
          "and free Takeful Personal Accident Plan for AED 45"
          " (5%VAT Incl).",
    },
    {
      "Text1": "AED",
      "Text2": "40.85",
      "Text3": "Viw details",
      "Text4": "Validity",
      "Text5": "Talktime",
      "Text6": "Roaming Data",
      "Text7": "NA",
      "Text8": "AED 37.75",
      "Text9": "None    ",
      "Text10": "AED 2.00",
      "Text12": "Valid for 1 day",
      "Text11": "1 GB Local Data Every Day (30 GB Total) for 30 days  "
          "and free Takeful Personal Accident Plan for AED 45"
          " (5%VAT Incl).",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(context).size.width > 650?SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: width * 0.05,
                      ),
                      Text(
                          "TOP-UP",
                          style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: width * 0.03,
                              color: colorConst.blue)
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.02,
              ),
              ListView.separated(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        InkWell(
                          onTap: () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //       builder: (context) => reacharge(
                            //
                            //         number: widget.number, dash: '', code: '',),
                            //     ));
                          },
                          child: Center(
                            child: Container(
                              height: height * 0.25,
                              width: width * 0.9,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: width * 0.007,)
                                  ],
                                  borderRadius:
                                  BorderRadius.circular(width * 0.02)),
                              child: Padding(
                                padding: EdgeInsets.all(width * 0.012),
                                child: Column(
                                  children: [
                                    // Row(
                                    //   children: [
                                    //     // Container(
                                    //     //   height: width*0.07,
                                    //     //   width: width*0.22,
                                    //     //   decoration: BoxDecoration(
                                    //     //       color: Colors.red,
                                    //     //       borderRadius: BorderRadius.circular(width*0.05)
                                    //     //   ),
                                    //     //   // child: Center(child: Text("Unlimited 5G",style: TextStyle(fontWeight: FontWeight.w900,color: Colors.white),)),
                                    //     // ),
                                    //     // SizedBox(width: width*0.032,),
                                    //     // Text("Popular Plan",style: TextStyle(color:Colors.blue,fontWeight: FontWeight.w600),)
                                    //   ],
                                    // ),
                                    SizedBox(
                                      height: height * 0.003,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Text(AED[index]["Text1"],
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w900,
                                                    fontSize: width * 0.022)),
                                            SizedBox(
                                              width: width * 0.02,
                                            ),
                                            Text(
                                              AED[index]["Text2"],
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w900,
                                                  fontSize: width * 0.022),
                                            ),
                                          ],
                                        ),
                                        InkWell(
                                          onTap: () {
                                            // showModalBottomSheet(
                                            //   context: context,
                                            //   isScrollControlled: true,
                                            //   shape: RoundedRectangleBorder(
                                            //       borderRadius:
                                            //       BorderRadius.circular(
                                            //           width * 0.07)),
                                            //   builder: (context) {
                                            //     return Container(
                                            //       height: width * 0.7,
                                            //       width: width * 1,
                                            //       decoration: BoxDecoration(
                                            //           color: Colors.white,
                                            //           borderRadius:
                                            //           BorderRadius.only(
                                            //             topLeft:
                                            //             Radius.circular(
                                            //               width * 0.07,
                                            //             ),
                                            //             topRight:
                                            //             Radius.circular(
                                            //               width * 0.07,
                                            //             ),
                                            //           )),
                                            //       child: Column(
                                            //         children: [
                                            //           SizedBox(
                                            //             height: width * 0.033,
                                            //           ),
                                            //           Row(
                                            //             mainAxisAlignment:
                                            //             MainAxisAlignment
                                            //                 .end,
                                            //             children: [
                                            //               InkWell(
                                            //                 onTap: () {
                                            //                   Navigator.pop(
                                            //                       context);
                                            //                 },
                                            //                 child: Image.asset(
                                            //                   ImageConst.remove,
                                            //                   width:
                                            //                   width * 0.05,
                                            //                 ),
                                            //               ),
                                            //               SizedBox(
                                            //                 width:
                                            //                 width * 0.042,
                                            //               ),
                                            //             ],
                                            //           ),
                                            //           Padding(
                                            //             padding: EdgeInsets.all(
                                            //                 width * 0.042),
                                            //             child: Column(
                                            //               children: [
                                            //                 Row(
                                            //                   children: [
                                            //                     Text(
                                            //                       AED[index][
                                            //                       "Text10"],
                                            //                       style: TextStyle(
                                            //                           fontWeight:
                                            //                           FontWeight
                                            //                               .w900,
                                            //                           fontSize:
                                            //                           width *
                                            //                               0.07),
                                            //                     ),
                                            //                   ],
                                            //                 ),
                                            //                 SizedBox(
                                            //                   height:
                                            //                   width * 0.03,
                                            //                 ),
                                            //                 Text(
                                            //                   AED[index]
                                            //                   ["Text11"],
                                            //                   style: TextStyle(
                                            //                       fontSize:
                                            //                       width *
                                            //                           0.045,
                                            //                       color: Colors
                                            //                           .grey),
                                            //                 ),
                                            //                 SizedBox(
                                            //                     height: width *
                                            //                         0.03),
                                            //                 Row(
                                            //                   children: [
                                            //                     Icon(
                                            //                       Icons
                                            //                           .calendar_month_outlined,
                                            //                       weight:
                                            //                       width *
                                            //                           0.03,
                                            //                     ),
                                            //                     SizedBox(
                                            //                       width: width *
                                            //                           0.025,
                                            //                     ),
                                            //                     Text(
                                            //                         AED[index][
                                            //                         "Text12"],
                                            //                         style: TextStyle(
                                            //                             fontSize:
                                            //                             width *
                                            //                                 0.045,
                                            //                             color: Colors
                                            //                                 .grey))
                                            //                   ],
                                            //                 )
                                            //               ],
                                            //             ),
                                            //           ),
                                            //           SizedBox(
                                            //             height: width * 0.06,
                                            //           ),
                                            //           InkWell(
                                            //             onTap: () {
                                            //               Navigator.push(
                                            //                   context,
                                            //                   CupertinoPageRoute(
                                            //                     builder:
                                            //                         (context) =>
                                            //                         reacharge(
                                            //                           number: widget
                                            //                               .number, dash: '', code: '',
                                            //                         ),
                                            //                   ));
                                            //             },
                                            //             child: Container(
                                            //               height: width * 0.1,
                                            //               width: width * 0.68,
                                            //               decoration: BoxDecoration(
                                            //                   color:
                                            //                   Colors.indigo,
                                            //                   borderRadius:
                                            //                   BorderRadius
                                            //                       .circular(
                                            //                       width *
                                            //                           0.05)),
                                            //               child: Center(
                                            //                 child: Text(
                                            //                   "Recharge",
                                            //                   style: TextStyle(
                                            //                       color: Colors
                                            //                           .white,
                                            //                       fontWeight:
                                            //                       FontWeight
                                            //                           .w800,
                                            //                       fontSize:
                                            //                       width *
                                            //                           0.06),
                                            //                 ),
                                            //               ),
                                            //             ),
                                            //           )
                                            //         ],
                                            //       ),
                                            //     );
                                            //   },
                                            // );
                                          },
                                          child: Container(
                                            height: height * 0.042,
                                            width: width * 0.2,
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.end,
                                              children: [
                                                Text(
                                                  AED[index]["Text3"],
                                                  style: TextStyle(
                                                      fontWeight:
                                                      FontWeight.w600,
                                                      color: Colors.indigo),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    Divider(
                                      thickness: height * 0.001,
                                      // indent: width * 0.035,
                                      // endIndent: width * 0.035,
                                    ),

                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(AED[index]["Text4"],
                                            style: TextStyle(
                                              fontSize: width*0.015,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.grey)),
                                        Text(AED[index]["Text5"],
                                            style: TextStyle(
                                                fontSize: width*0.015,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.grey)),
                                        Text(AED[index]["Text6"],
                                            style: TextStyle(
                                                fontSize: width*0.015,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.grey)),
                                      ],
                                    ),

                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(AED[index]["Text7"],
                                            style: TextStyle(
                                                fontSize: width*0.015,
                                                fontWeight: FontWeight.w700,
                                            )),
                                        Text(AED[index]["Text8"],
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                              fontSize: width*0.015,
                                            )),
                                        Text(AED[index]["Text9"],
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                              fontSize: width*0.015,
                                            )),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                      ],
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      width: width * 0.02,
                    );
                  },
                  itemCount: AED.length),

              SizedBox(height: height*0.3,)

            ],
          ),
        ),
      ),
    ):
    SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: width * 0.082,
                      ),
                      Text(
                        "TOP-UP",
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: width * 0.07,
                            color: colorConst.blue),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.02,
              ),
              ListView.separated(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => reacharge(

                                      number: widget.number, dash: '', code: '',),
                                ));
                          },
                          child: Center(
                            child: Container(
                              height: height * 0.22,
                              width: width * 0.84,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: width * 0.007,)
                                  ],
                                  borderRadius:
                                  BorderRadius.circular(width * 0.06)),
                              child: Padding(
                                padding: EdgeInsets.all(width * 0.03),
                                child: Column(
                                  children: [
                                    // Row(
                                    //   children: [
                                    //     // Container(
                                    //     //   height: width*0.07,
                                    //     //   width: width*0.22,
                                    //     //   decoration: BoxDecoration(
                                    //     //       color: Colors.red,
                                    //     //       borderRadius: BorderRadius.circular(width*0.05)
                                    //     //   ),
                                    //     //   // child: Center(child: Text("Unlimited 5G",style: TextStyle(fontWeight: FontWeight.w900,color: Colors.white),)),
                                    //     // ),
                                    //     // SizedBox(width: width*0.032,),
                                    //     // Text("Popular Plan",style: TextStyle(color:Colors.blue,fontWeight: FontWeight.w600),)
                                    //   ],
                                    // ),
                                    SizedBox(
                                      height: height * 0.005,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Text(AED[index]["Text1"],
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w900,
                                                    fontSize: width * 0.06)),
                                            SizedBox(
                                              width: width * 0.02,
                                            ),
                                            Text(
                                              AED[index]["Text2"],
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w900,
                                                  fontSize: width * 0.07),
                                            ),
                                          ],
                                        ),
                                        InkWell(
                                          onTap: () {
                                            // showModalBottomSheet(
                                            //   context: context,
                                            //   isScrollControlled: true,
                                            //   shape: RoundedRectangleBorder(
                                            //       borderRadius:
                                            //       BorderRadius.circular(
                                            //           width * 0.07)),
                                            //   builder: (context) {
                                            //     return Container(
                                            //       height: width * 0.7,
                                            //       width: width * 1,
                                            //       decoration: BoxDecoration(
                                            //           color: Colors.white,
                                            //           borderRadius:
                                            //           BorderRadius.only(
                                            //             topLeft:
                                            //             Radius.circular(
                                            //               width * 0.07,
                                            //             ),
                                            //             topRight:
                                            //             Radius.circular(
                                            //               width * 0.07,
                                            //             ),
                                            //           )),
                                            //       child: Column(
                                            //         children: [
                                            //           SizedBox(
                                            //             height: width * 0.033,
                                            //           ),
                                            //           Row(
                                            //             mainAxisAlignment:
                                            //             MainAxisAlignment
                                            //                 .end,
                                            //             children: [
                                            //               InkWell(
                                            //                 onTap: () {
                                            //                   Navigator.pop(
                                            //                       context);
                                            //                 },
                                            //                 child: Image.asset(
                                            //                   ImageConst.remove,
                                            //                   width:
                                            //                   width * 0.05,
                                            //                 ),
                                            //               ),
                                            //               SizedBox(
                                            //                 width:
                                            //                 width * 0.042,
                                            //               ),
                                            //             ],
                                            //           ),
                                            //           Padding(
                                            //             padding: EdgeInsets.all(
                                            //                 width * 0.042),
                                            //             child: Column(
                                            //               children: [
                                            //                 Row(
                                            //                   children: [
                                            //                     Text(
                                            //                       AED[index][
                                            //                       "Text10"],
                                            //                       style: TextStyle(
                                            //                           fontWeight:
                                            //                           FontWeight
                                            //                               .w900,
                                            //                           fontSize:
                                            //                           width *
                                            //                               0.07),
                                            //                     ),
                                            //                   ],
                                            //                 ),
                                            //                 SizedBox(
                                            //                   height:
                                            //                   width * 0.03,
                                            //                 ),
                                            //                 Text(
                                            //                   AED[index]
                                            //                   ["Text11"],
                                            //                   style: TextStyle(
                                            //                       fontSize:
                                            //                       width *
                                            //                           0.045,
                                            //                       color: Colors
                                            //                           .grey),
                                            //                 ),
                                            //                 SizedBox(
                                            //                     height: width *
                                            //                         0.03),
                                            //                 Row(
                                            //                   children: [
                                            //                     Icon(
                                            //                       Icons
                                            //                           .calendar_month_outlined,
                                            //                       weight:
                                            //                       width *
                                            //                           0.03,
                                            //                     ),
                                            //                     SizedBox(
                                            //                       width: width *
                                            //                           0.025,
                                            //                     ),
                                            //                     Text(
                                            //                         AED[index][
                                            //                         "Text12"],
                                            //                         style: TextStyle(
                                            //                             fontSize:
                                            //                             width *
                                            //                                 0.045,
                                            //                             color: Colors
                                            //                                 .grey))
                                            //                   ],
                                            //                 )
                                            //               ],
                                            //             ),
                                            //           ),
                                            //           SizedBox(
                                            //             height: width * 0.06,
                                            //           ),
                                            //           InkWell(
                                            //             onTap: () {
                                            //               Navigator.push(
                                            //                   context,
                                            //                   CupertinoPageRoute(
                                            //                     builder:
                                            //                         (context) =>
                                            //                         reacharge(
                                            //                           number: widget
                                            //                               .number, dash: '', code: '',
                                            //                         ),
                                            //                   ));
                                            //             },
                                            //             child: Container(
                                            //               height: width * 0.1,
                                            //               width: width * 0.68,
                                            //               decoration: BoxDecoration(
                                            //                   color:
                                            //                   Colors.indigo,
                                            //                   borderRadius:
                                            //                   BorderRadius
                                            //                       .circular(
                                            //                       width *
                                            //                           0.05)),
                                            //               child: Center(
                                            //                 child: Text(
                                            //                   "Recharge",
                                            //                   style: TextStyle(
                                            //                       color: Colors
                                            //                           .white,
                                            //                       fontWeight:
                                            //                       FontWeight
                                            //                           .w800,
                                            //                       fontSize:
                                            //                       width *
                                            //                           0.06),
                                            //                 ),
                                            //               ),
                                            //             ),
                                            //           )
                                            //         ],
                                            //       ),
                                            //     );
                                            //   },
                                            // );
                                          },
                                          child: Container(
                                            height: height * 0.042,
                                            width: width * 0.2,
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.end,
                                              children: [
                                                Text(
                                                  AED[index]["Text3"],
                                                  style: TextStyle(
                                                      fontWeight:
                                                      FontWeight.w600,
                                                      color: Colors.indigo),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    Divider(
                                      thickness: height * 0.001,
                                      // indent: width * 0.035,
                                      // endIndent: width * 0.035,
                                    ),
                                    SizedBox(
                                      height: height * 0.01,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(AED[index]["Text4"],
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                color: Colors.grey)),
                                        Text(AED[index]["Text5"],
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                color: Colors.grey)),
                                        Text(AED[index]["Text6"],
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                color: Colors.grey)),
                                      ],
                                    ),
                                    SizedBox(
                                      height: height * 0.005,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(AED[index]["Text7"],
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontSize: width * 0.048)),
                                        Text(AED[index]["Text8"],
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontSize: width * 0.048)),
                                        Text(AED[index]["Text9"],
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontSize: width * 0.048)),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                      ],
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      width: width * 0.02,
                    );
                  },
                  itemCount: AED.length)
            ],
          ),
        ),
      ),
    );
  }
}
