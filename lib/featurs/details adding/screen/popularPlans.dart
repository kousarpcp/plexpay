import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:plexpay/Const/colorConst.dart';
import 'package:plexpay/Const/imageConst.dart';

import '../../../main.dart';
import 'Reacharge.dart';

class popular extends StatefulWidget {
  const popular({super.key, required this.number, required this.name, required this.plan, required this.providerinfo, required this.dash, });
  final String number;
  final String name;
  final String dash;
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
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
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
                height: width * 0.04,
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
                                      code:widget.plan[index]["SkuCode"],
                                      number: widget.number,
                                    dash:widget.dash
                                  ),
                                ));
                          },
                          child: Center(
                            child: Container(
                              height: width * 0.42,
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
                                      height: width * 0.01,
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
                                      thickness: width * 0.002,
                                      // indent: width * 0.035,
                                      // endIndent: width * 0.035,
                                    ),
                                    SizedBox(
                                      height: width * 0.016,
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
                                      height: width * 0.01,
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
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: width * 0.04,
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
