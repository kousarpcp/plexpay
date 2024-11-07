import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:plexpay/Const/colorConst.dart';
import 'package:plexpay/Const/imageConst.dart';

import '../../../main.dart';
import 'Reacharge.dart';

class popular extends StatefulWidget {
  const popular({super.key, required this.number, required this.name, required this.plan, required this.providerinfo, required this.dash, this.rsp, });
  final String number;
  final String name;
  final String dash;
  final rsp;
  final plan;
  final providerinfo;

  @override
  State<popular> createState() => _popularState();
}

class _popularState extends State<popular> {
  var dash;
  @override
  void initState() {
    // TODO: implement initState
    print("ccccccccc");
    print(widget.dash);
    print(widget.number);
    dash=widget.dash;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(context).size.width > 650?
    widget.rsp["message"]=="Empty"?
    Container(
      margin: EdgeInsets.all(width*0.1),
      child: Center(child: Text("No Vouchers Found!")),
    ):SafeArea(
      child: Scaffold(
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
                        "Popular Plans",
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: width * 0.03,
                            color: colorConst.blue),
                      ),
                    ],
                  ),
                ],
              ),
              dash=="1"?Row(
                children: [
                  SizedBox(
                    width: width*0.04,
                  ),
                  Container(
                    margin: EdgeInsets.all(width*0.01),
                    width: width*0.1,
                    height: height*0.2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(width*0.02),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: width * 0.007,)
                      ],
                    ),
                    child: Container(
                      width: width*0.2,
                      height: height*0.15,
                      margin: EdgeInsets.all(width*0.01),
                      decoration: BoxDecoration(
                        image: DecorationImage(image: NetworkImage(widget.providerinfo["ProviderLogo"])),
                      ),
                    ),
                  ),

                  Expanded(
                    child: Text(widget.providerinfo["ProviderName"],style: TextStyle(
                      fontSize: width*0.02,
                       fontWeight: FontWeight.bold,
                      color: colorConst.blue
                    ),),
                  )
                ],
              ):SizedBox(
                height: height * 0.02,
              ),
              ListView.separated(
                  scrollDirection:
                  Axis.vertical,
                  shrinkWrap: true,
                  physics:
                  BouncingScrollPhysics(),
                  itemBuilder:
                      (context, index) {
                    return Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                  builder: (context) => reacharge(
                                      code:widget.plan[index]["SkuCode"],
                                      number: widget.number,
                                      dash: widget
                                          .dash),
                                ));
                          },
                          child: Center(
                            child: Container(
                              height:
                              height * 0.31,
                              width:
                              width * 0.9,
                              decoration:
                              BoxDecoration(
                                  color: Colors
                                      .white,
                                  boxShadow: [
                                    BoxShadow(
                                      color:
                                      Colors.black12,
                                      blurRadius:
                                      width * 0.007,
                                    )
                                  ],
                                  borderRadius:
                                  BorderRadius.circular(width *
                                      0.03)),
                              child: Padding(
                                padding: EdgeInsets
                                    .all(width *
                                    0.015),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [

                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment
                                          .spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(widget.plan[index]["ReceiveCurrencyIso"], style: TextStyle(fontWeight: FontWeight.w900, fontSize: width * 0.025)),
                                                    SizedBox(
                                                      width: width * 0.02,
                                                    ),
                                                    Text(
                                                      widget.plan[index]["ReceiveValue"].toString(),
                                                      style: TextStyle(fontWeight: FontWeight.w900, fontSize: width * 0.025),
                                                    ),
                                                  ],
                                                ),
                                                Container(
                                                  width: width*0.54,
                                                  child: Text(widget.plan[index]["CoupenTitle"],style: TextStyle(
                                                      fontSize: width*0.015
                                                  ),overflow: TextOverflow.ellipsis,maxLines: 1,),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                        widget.dash ==
                                            "1"
                                            ? Row(
                                          children: [
                                            Text(widget.plan[index]["SendCurrencyIso"], style: TextStyle(fontWeight: FontWeight.w900, fontSize: width * 0.025)),
                                            SizedBox(
                                              width: width * 0.02,
                                            ),
                                            Text(
                                              widget.plan[index]["Our_SendValue"].toString(),
                                              style: TextStyle(fontWeight: FontWeight.w900, fontSize: width * 0.025),
                                            ),
                                          ],
                                        )
                                            : SizedBox()
                                      ],
                                    ),
                                    // SizedBox(
                                    //   height: height*0.01,
                                    // ),
                                    Divider(
                                      thickness:
                                      height *
                                          0.001,
                                      // indent: width * 0.035,
                                      // endIndent: width * 0.035,
                                    ),

                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment
                                          .spaceBetween,
                                      children: [
                                        Text(
                                            "Validity",
                                            style:
                                            TextStyle(fontWeight: FontWeight.w500, color: Colors.grey)),
                                        Text(
                                            "Local Data",
                                            style:
                                            TextStyle(fontWeight: FontWeight.w500, color: Colors.grey)),
                                        Text(
                                            "Roaming Data",
                                            style:
                                            TextStyle(fontWeight: FontWeight.w500, color: Colors.grey)),
                                      ],
                                    ),
                                    SizedBox(
                                      height: height *
                                          0.001,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment
                                          .spaceBetween,
                                      children: [
                                        Text(
                                            widget.plan[index][
                                            "Expiry_Date"],
                                            style:
                                            TextStyle(fontWeight: FontWeight.w700, fontSize: width * 0.02)),
                                        Text(
                                            "N.A",
                                            style:
                                            TextStyle(fontWeight: FontWeight.w700, fontSize: width * 0.02)),
                                        Text(
                                            "N.A",
                                            style:
                                            TextStyle(fontWeight: FontWeight.w700, fontSize: width * 0.02)),
                                      ],
                                    ),
                                    SizedBox(height: height*0.01,),
                                    InkWell(
                                      onTap: () {
                                        showDialog(

                                          context: context, builder: (context) {
                                          return Dialog(
                                            child: FittedBox(

                                              child: Container(
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius: BorderRadius.circular(width*0.04),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Colors.black12,
                                                        blurRadius: width * 0.009,
                                                      )
                                                    ]
                                                ),
                                                child: Padding(
                                                  padding:  EdgeInsets.all(width*0.06),
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Center(
                                                        child: Column(

                                                          crossAxisAlignment: CrossAxisAlignment.center,
                                                          children: [
                                                            Text(widget.plan[index]["ReceiveCurrencyIso"],
                                                                style: TextStyle(

                                                                    fontSize: width * 0.03)),
                                                            // SizedBox(
                                                            //   height: height * 0.002,
                                                            // ),
                                                            Text(
                                                              widget.plan[index]["ReceiveValue"].toString(),
                                                              style: TextStyle(
                                                                  fontWeight: FontWeight.w900,
                                                                  fontSize: width * 0.055),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      widget.dash=="1"?Row(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        children: [
                                                          Text(widget.plan[index]["SendCurrencyIso"],
                                                              style: TextStyle(
                                                                  fontSize: width * 0.02)),
                                                          SizedBox(
                                                            width: width * 0.01,
                                                          ),
                                                          Text(
                                                            widget.plan[index]["Our_SendValue"].toString(),
                                                            style: TextStyle(
                                                                fontSize: width * 0.02),
                                                          ),
                                                        ],
                                                      ):SizedBox(),
                                                      Text(
                                                        widget.plan[index]["CoupenTitle"],
                                                        textAlign: TextAlign.center,
                                                      ),
                                                      SizedBox(height: height*0.02,),
                                                      InkWell(
                                                        onTap: () {
                                                          Navigator.push(
                                                              context,
                                                              CupertinoPageRoute(
                                                                builder: (context) => reacharge(
                                                                    code:widget.plan[index]["SkuCode"],
                                                                    number: widget.number,
                                                                    dash:widget.dash
                                                                ),
                                                              ));
                                                        },
                                                        child: Container(
                                                          height: height* 0.05,
                                                          width: width*0.35,
                                                          decoration:  BoxDecoration(
                                                              color: colorConst.blue,
                                                              borderRadius: BorderRadius.circular(width*0.06)
                                                          ),
                                                          child: Center(child: Text("RECHARGE",style: TextStyle(color: Colors.white),)),
                                                        ),
                                                      ),
                                                      SizedBox(height: height*0.01,),

                                                      InkWell(
                                                        onTap: () {
                                                          Navigator.pop(context);
                                                        },
                                                        child: Container(
                                                          height: height* 0.05,
                                                          width: width*0.35,
                                                          decoration:  BoxDecoration(
                                                              border: Border.all(
                                                                color: colorConst.blue,
                                                              ),
                                                              color: Colors.white,
                                                              borderRadius: BorderRadius.circular(width*0.06)
                                                          ),
                                                          child: Center(child: Text("CANCEL",style: TextStyle(color: Colors.black),)),
                                                        ),
                                                      ),

                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );

                                        },);
                                      },
                                      child: Container(
                                        height: height*0.05,
                                        decoration: BoxDecoration(
                                            borderRadius:BorderRadius.circular(width*0.06),
                                            color: colorConst.blue
                                        ),
                                        child: Center(child: Text("View details".toUpperCase(),style: TextStyle(
                                            color: Colors.white
                                        ),)),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        SizedBox(
                          height: height * 0.01,
                        ),
                      ],
                    );
                  },
                  separatorBuilder:
                      (context, index) {
                    return SizedBox(
                      width: width * 0.02,
                    );
                  },
                  itemCount: widget.plan.length),
              SizedBox(height: height*0.3,)
            ],
          ),
        ),
      ),
    ):
    widget.rsp["message"]=="Empty"?
    Container(
      margin: EdgeInsets.all(width*0.1),
      child: Center(child: Text("No Vouchers Found!")),
    ):SafeArea(
      child: Scaffold(
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
                        "Popular Plans",
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: width * 0.07,
                            color: colorConst.blue),
                      ),
                    ],
                  ),
                ],
              ),
              dash=="1"?Row(
                children: [
                  SizedBox(
                    width: width*0.05,
                  ),
                  Container(
                    margin: EdgeInsets.all(width*0.03),
                    width: width*0.3,
                    height: width*0.3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(width*0.03),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: width * 0.007,)
                      ],
                    ),
                    child: Container(
                      width: width*0.2,
                      height: width*0.25,
                      margin: EdgeInsets.all(width*0.03),
                      decoration: BoxDecoration(
                        image: DecorationImage(image: NetworkImage(widget.providerinfo["ProviderLogo"])),
                      ),
                    ),
                  ),

                  Expanded(
                    child: Text(widget.providerinfo["ProviderName"],style: TextStyle(
                        fontSize: width*0.05,
                        fontWeight: FontWeight.bold,
                        color: colorConst.blue
                    ),),
                  )
                ],
              ):SizedBox(
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
                                CupertinoPageRoute(
                                  builder: (context) => reacharge(
                                      code:widget.plan[index]["SkuCode"],
                                      number: widget.number,
                                      dash:widget.dash
                                  ),
                                ));
                          },
                          child: Center(
                            child: Container(
                              height: height * 0.26,
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
                                    SizedBox(
                                      height: height * 0.007,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(widget.plan[index]["ReceiveCurrencyIso"],
                                                        style: TextStyle(
                                                            fontWeight: FontWeight.w900,
                                                            fontSize: width * 0.055)),
                                                    SizedBox(
                                                      width: width * 0.02,
                                                    ),
                                                    Text(
                                                      widget.plan[index]["ReceiveValue"].toString(),
                                                      style: TextStyle(
                                                          fontWeight: FontWeight.w900,
                                                          fontSize: width * 0.055),
                                                    ),
                                                  ],
                                                ),
                                                Text(
                                                    widget.plan[index]["CoupenTitle"]
                                                )
                                              ],
                                            )


                                          ],
                                        ),
                                        dash=="1"?Row(
                                          children: [
                                            Text(widget.plan[index]["SendCurrencyIso"],
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w900,
                                                    fontSize: width * 0.05)),
                                            SizedBox(
                                              width: width * 0.02,
                                            ),
                                            Text(
                                              widget.plan[index]["Our_SendValue"].toString(),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w900,
                                                  fontSize: width * 0.05),
                                            ),
                                          ],
                                        ):SizedBox()
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
                                        Text("Validity",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                color: Colors.grey)),
                                        Text("Local Data",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                color: Colors.grey)),
                                        Text("Roaming Data",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                color: Colors.grey)),
                                      ],
                                    ),
                                    SizedBox(
                                      height: height * 0.002,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(widget.plan[index]["Expiry_Date"],
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontSize: width * 0.048)),
                                        Text("N.A",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontSize: width * 0.048)),
                                        Text("N.A",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontSize: width * 0.048)),
                                      ],
                                    ),
                                    SizedBox(
                                      height: height * 0.01,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        showDialog(
                                          context: context, builder: (context) {
                                          return Dialog(
                                            child: FittedBox(

                                              child: Container(
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius: BorderRadius.circular(width*0.06),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Colors.black12,
                                                        blurRadius: width * 0.009,
                                                      )
                                                    ]
                                                ),
                                                child: Padding(
                                                  padding:  EdgeInsets.all(width*0.06),
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Center(
                                                        child: Column(

                                                          crossAxisAlignment: CrossAxisAlignment.center,
                                                          children: [
                                                            Text(widget.plan[index]["ReceiveCurrencyIso"],
                                                                style: TextStyle(

                                                                    fontSize: width * 0.05)),
                                                            // SizedBox(
                                                            //   height: height * 0.002,
                                                            // ),
                                                            Text(
                                                              widget.plan[index]["ReceiveValue"].toString(),
                                                              style: TextStyle(
                                                                  fontWeight: FontWeight.w900,
                                                                  fontSize: width * 0.095),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      widget.dash=="1"?Row(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        children: [
                                                          Text(widget.plan[index]["SendCurrencyIso"],
                                                              style: TextStyle(
                                                                  fontSize: width * 0.035)),
                                                          SizedBox(
                                                            width: width * 0.02,
                                                          ),
                                                          Text(
                                                            widget.plan[index]["Our_SendValue"].toString(),
                                                            style: TextStyle(
                                                                fontSize: width * 0.035),
                                                          ),
                                                        ],
                                                      ):SizedBox(),
                                                      Text(
                                                        widget.plan[index]["CoupenTitle"],
                                                        textAlign: TextAlign.center,
                                                      ),
                                                      SizedBox(height: height*0.02,),
                                                      InkWell(
                                                        onTap: () {
                                                          Navigator.push(
                                                              context,
                                                              CupertinoPageRoute(
                                                                builder: (context) => reacharge(
                                                                    code:widget.plan[index]["SkuCode"],
                                                                    number: widget.number,
                                                                    dash:widget.dash
                                                                ),
                                                              ));
                                                        },
                                                        child: Container(
                                                          height: height* 0.045,
                                                          width: width*0.5,
                                                          decoration:  BoxDecoration(
                                                              color: colorConst.blue,
                                                              borderRadius: BorderRadius.circular(width*0.06)
                                                          ),
                                                          child: Center(child: Text("RECHARGE",style: TextStyle(color: Colors.white),)),
                                                        ),
                                                      ),
                                                      SizedBox(height: height*0.01,),

                                                      InkWell(
                                                        onTap: () {
                                                          Navigator.pop(context);
                                                        },
                                                        child: Container(
                                                          height: height* 0.045,
                                                          width: width*0.5,
                                                          decoration:  BoxDecoration(
                                                              border: Border.all(
                                                                color: colorConst.blue,
                                                              ),
                                                              color: Colors.white,
                                                              borderRadius: BorderRadius.circular(width*0.06)
                                                          ),
                                                          child: Center(child: Text("CANCEL",style: TextStyle(color: Colors.black),)),
                                                        ),
                                                      ),

                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );

                                        },);
                                      },
                                      child: Container(
                                        height: height*0.05,
                                        decoration: BoxDecoration(
                                          borderRadius:BorderRadius.circular(width*0.06),
                                          color: colorConst.blue
                                        ),
                                        child: Center(child: Text("View details".toUpperCase(),style: TextStyle(
                                          color: Colors.white
                                        ),)),
                                      ),
                                    )
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
                  itemCount: widget.plan.length)
            ],
          ),
        ),
      ),
    );
  }
}
