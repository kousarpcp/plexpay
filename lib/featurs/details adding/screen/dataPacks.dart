import 'package:flutter/material.dart';

import '../../../main.dart';
import '../../../Const/colorConst.dart';
import 'Reacharge.dart';

class dataPacks extends StatefulWidget {
  const dataPacks({super.key, required this.number, required this.name});
  final String number;
  final String name;


  @override
  State<dataPacks> createState() => _dataPacksState();
}

class _dataPacksState extends State<dataPacks> {

  List datapacks = [
  {
  "Text1": "AED",
  "Text2": "600.00",
  "Text3": "Viw details",
  "Text4": "Validity",
  "Text5": "Local Data",
  "Text6": "Roaming Data",
  "Text7": "30 days",
  "Text8": "50 GB        ",
  "Text9": "None    ",
},
  {
  "Text1": "AED",
  "Text2": "300.00",
  "Text3": "Viw details",
  "Text4": "Validity",
  "Text5": "Local Data",
  "Text6": "Roaming Data",
  "Text7": "30 days",
  "Text8": "20 GB        ",
  "Text9": "None    ",
},
  {
  "Text1": "AED",
  "Text2": "200.00",
  "Text3": "Viw details",
  "Text4": "Validity",
  "Text5": "Local Data",
  "Text6": "Roaming Data",
  "Text7": "30 days",
  "Text8": "10 GB        ",
  "Text9": "None    ",
},
  {
  "Text1": "AED",
  "Text2": "150.00",
  "Text3": "Viw details",
  "Text4": "Validity",
  "Text5": "Local Data",
  "Text6": "Roaming Data",
  "Text7": "30 days",
  "Text8": "6 GB        ",
  "Text9": "None    ",
},
  {
  "Text1": "AED",
  "Text2": "100.00",
  "Text3": "Viw details",
  "Text4": "Validity",
  "Text5": "Local Data",
  "Text6": "Roaming Data",
  "Text7": "30 days",
  "Text8": "3 GB        ",
  "Text9": "None    ",
},
  {
  "Text1": "AED",
  "Text2": "75.00",
  "Text3": "Viw details",
  "Text4": "Validity",
  "Text5": "Local Data",
  "Text6": "Roaming Data",
  "Text7": "28 days",
  "Text8": "3 GB        ",
  "Text9": "None    ",
},
  {
  "Text1": "AED",
  "Text2": "55.00",
  "Text3": "Viw details",
  "Text4": "Validity",
  "Text5": "Local Data",
  "Text6": "Roaming Data",
  "Text7": "28 days",
  "Text8": "2 GB        ",
  "Text9": "None    ",
},
  {
  "Text1": "AED",
  "Text2": "50.00",
  "Text3": "Viw details",
  "Text4": "Validity",
  "Text5": "Local Data",
  "Text6": "Roaming Data",
  "Text7": "28 days",
  "Text8": "1 GB        ",
  "Text9": "None    ",
},
  {
  "Text1": "AED",
  "Text2": "30.00",
  "Text3": "Viw details",
  "Text4": "Validity",
  "Text5": "Local Data",
  "Text6": "Roaming Data",
  "Text7": "28 days",
  "Text8": "500 MB        ",
  "Text9": "None    ",
},
    {
      "Text1": "AED",
      "Text2": "20.00",
      "Text3": "Viw details",
      "Text4": "Validity",
      "Text5": "Local Data",
      "Text6": "Roaming Data",
      "Text7": "28 days",
      "Text8": "300 MB        ",
      "Text9": "None    ",
    },
  {
  "Text1": "AED",
  "Text2": "7.62",
  "Text3": "Viw details",
  "Text4": "Validity",
  "Text5": "Local Data",
  "Text6": "Roaming Data",
  "Text7": "1 day",
  "Text8": "250 MB        ",
  "Text9": "None    ",
},
  {
  "Text1": "AED",
  "Text2": "5.00",
  "Text3": "Viw details",
  "Text4": "Validity",
  "Text5": "Local Data",
  "Text6": "Roaming Data",
  "Text7": "1 day",
  "Text8": "100 MB        ",
  "Text9": "None    ",
},
    {
      "Text1": "AED",
      "Text2": "4.00",
      "Text3": "Viw details",
      "Text4": "Validity",
      "Text5": "Local Data",
      "Text6": "Roaming Data",
      "Text7": "1 day",
      "Text8": "150 MB        ",
      "Text9": "None    ",
    },
  {
  "Text1": "AED",
  "Text2": "3.00",
  "Text3": "Viw details",
  "Text4": "Validity",
  "Text5": "Local Data",
  "Text6": "Roaming Data",
  "Text7": "1 day",
  "Text8": "100 MB        ",
  "Text9": "None    ",
},
  {
  "Text1": "AED",
  "Text2": "2.00",
  "Text3": "Viw details",
  "Text4": "Validity",
  "Text5": "Local Data",
  "Text6": "Roaming Data",
  "Text7": "1 day",
  "Text8": "60 MB        ",
  "Text9": "None    ",
},
    ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(

          child: Column(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: width * 0.04,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: width * 0.082,
                      ),
                      Text(
                        "Data Packs",
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
                height: width * 0.05,
              ),
              ListView.separated(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => reacharge(
                                  dash: '', code: '', number: '',
                              ),
                            ));
                      },
                      child: Column(
                        children: [
                          Center(
                            child: Container(
                              height: width * 0.362,
                              width: width * 0.84,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: width * 0.007,
                                    )
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
                                      height: width * 0.02,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Text(datapacks[index]["Text1"],
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w900,
                                                    fontSize: width * 0.06)),
                                            SizedBox(
                                              width: width * 0.02,
                                            ),
                                            Text(
                                              datapacks[index]["Text2"],
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w900,
                                                  fontSize: width * 0.065),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          datapacks[index]["Text3"],
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: Colors.indigo),
                                        )
                                      ],
                                    ),
                                    Divider(
                                      thickness: width * 0.002,
                                      // indent: width * 0.035,
                                      // endIndent: width * 0.035,
                                    ),
                                    SizedBox(
                                      height: width * 0.01,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(datapacks[index]["Text4"],
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                color: Colors.grey)),
                                        Text(datapacks[index]["Text5"],
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                color: Colors.grey)),
                                        Text(datapacks[index]["Text6"],
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                color: Colors.grey)),
                                      ],
                                    ),
                                    SizedBox(
                                      height: width * 0.01,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(datapacks[index]["Text7"],
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontSize: width * 0.048)),
                                        Text(datapacks[index]["Text8"],
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontSize: width * 0.048)),
                                        Text(datapacks[index]["Text9"],
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontSize: width * 0.048)),
                                      ],
                                    ),
                                    // Container(
                                    //   height: width*0.09,
                                    //   width: width*0.68,
                                    //   decoration: BoxDecoration(
                                    //       color: Colors.indigo,
                                    //       borderRadius: BorderRadius.circular(width*0.05)
                                    //   ),
                                    //   child: Center(
                                    //     child: Text("Recharge",
                                    //       style: TextStyle(
                                    //           color: Colors.white,
                                    //           fontWeight: FontWeight.w800,
                                    //           fontSize: width*0.06
                                    //       ),),
                                    //   ),
                                    // )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: width * 0.04,
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      width: width * 0.02,
                    );
                  },
                  itemCount: datapacks.length)
            ],
          ),
        ),
      ),
    );
  }
}
