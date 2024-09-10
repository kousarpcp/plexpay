import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:flutter_svg/svg.dart';
import 'package:plexpay/Const/colorConst.dart';
import 'package:plexpay/featurs/details%20adding/plexBill/plexBill_New.dart';
import 'package:plexpay/featurs/details%20adding/screen/BottomNavigation.dart';
import 'package:plexpay/featurs/details%20adding/screen/home_page.dart';


import '../../../Const/imageConst.dart';
import '../../../api/plexbillLogin_postApi.dart';
import '../../../main.dart';

class Plexbill_home extends StatefulWidget {
  const Plexbill_home({super.key});

  @override
  State<Plexbill_home> createState() => _Plexbill_homeState();
}

class _Plexbill_homeState extends State<Plexbill_home> {

  var isCatLoading = true;
  var data ;
  var todays_sale;
  var todays_purchase;
  var todays_receipt;
  var todays_payments;





  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: colorConst.blue,
        appBar: AppBar(
          scrolledUnderElevation: 0,
          elevation: 0,
          backgroundColor: Colors.white,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) => BottomNavigation(),));
            },
            child: Container(
              height: width * 0.05,
              width: width * 0.08,
              child: Padding(
                padding: EdgeInsets.all(width * 0.03),
                child: SvgPicture.asset(
                  ImageConst.back,
                ),
              ),
            ),
          ),
          title: LocaleText(
            "PlexBill",
            style:
                TextStyle(fontSize: width * 0.06, fontWeight: FontWeight.w700),
          ),
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
              children: [
            // Text("Contact Info",style: TextStyle(fontSize: width*0.06,fontWeight: FontWeight.w900)),
            // SizedBox(
            //   height: width*0.015,
            // ),
                SizedBox(
                  height: width*0.03,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: width*0.09,
                    ),
                    LocaleText("Dash Board",style: TextStyle(fontSize: 27,fontWeight: FontWeight.w700,color: Colors.white),),
                  ],
                ),
                Center(
                  child: Container(
                    height: width * 0.65,
                    width: width * 0.9,
                    decoration: BoxDecoration(
                        color: colorConst.blue,
                        boxShadow: [
                          BoxShadow(
                              blurStyle: BlurStyle.normal,
                              color: Colors.black.withOpacity(0.09),
                              offset: Offset(0, 2),
                              spreadRadius: 1,
                              blurRadius: 9)
                        ],
                        borderRadius: BorderRadius.circular(width * 0.03)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => plexbillNew(fruits: [], vegitalbles: [],),));
                                  },
                                  child: Center(
                                    child: Container(
                                      height: width * 0.25,
                                      width: width * 0.4,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                                blurStyle: BlurStyle.normal,
                                                color: Colors.black.withOpacity(0.09),
                                                offset: Offset(0, 2),
                                                spreadRadius: 1,
                                                blurRadius: 9)
                                          ],
                                          borderRadius: BorderRadius.circular(width * 0.03)),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.paid_outlined,
                                            color: Colors.black,
                                            size: width * 0.06,
                                          ),
                                          SizedBox(
                                            height: width * 0.02,
                                          ),
                                          LocaleText(
                                            "Billing",
                                            style: TextStyle(
                                                fontSize: width * 0.052,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Center(
                                  child: Container(
                                    height: width * 0.25,
                                    width: width * 0.4,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                              blurStyle: BlurStyle.normal,
                                              color: Colors.black.withOpacity(0.09),
                                              offset: Offset(0, 2),
                                              spreadRadius: 1,
                                              blurRadius: 9)
                                        ],
                                        borderRadius: BorderRadius.circular(width * 0.03)),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.shopping_cart,
                                          color: Colors.black,
                                          size: width * 0.06,
                                        ),
                                        SizedBox(
                                          height: width * 0.02,
                                        ),
                                        LocaleText(
                                          "Purchase",
                                          style: TextStyle(
                                              fontSize: width * 0.052,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: width * 0.05,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Center(
                                  child: Container(
                                    height: width * 0.25,
                                    width: width * 0.4,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                              blurStyle: BlurStyle.normal,
                                              color: Colors.black.withOpacity(0.09),
                                              offset: Offset(0, 2),
                                              spreadRadius: 1,
                                              blurRadius: 9)
                                        ],
                                        borderRadius: BorderRadius.circular(width * 0.03)),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.screen_rotation_alt,
                                          color: Colors.black,
                                          size: width * 0.06,
                                        ),
                                        SizedBox(
                                          height: width * 0.02,
                                        ),
                                        LocaleText(
                                          "Sale Return",
                                          style: TextStyle(
                                              fontSize: width * 0.052,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  height: width * 0.25,
                                  width: width * 0.4,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                            blurStyle: BlurStyle.normal,
                                            color: Colors.black.withOpacity(0.09),
                                            offset: Offset(0, 2),
                                            spreadRadius: 1,
                                            blurRadius: 9)
                                      ],
                                      borderRadius: BorderRadius.circular(width * 0.03)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.refresh_outlined,
                                        color: Colors.black,
                                        size: width * 0.065,
                                      ),
                                      SizedBox(
                                        height: width * 0.016,
                                      ),
                                      LocaleText(
                                        "Purchase Return",
                                        style: TextStyle(
                                            fontSize: width * 0.052,
                                            fontWeight: FontWeight.w800),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

            SizedBox(
              height: width*0.1,
            ),
            Column(
              children: [
                Container(
                  height: width*0.13,
                  width: width*0.77,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(width*0.03)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      LocaleText("TODAY'S SALE :",style: TextStyle(fontSize:14,color: Colors.black)),
                      Text(" 0.000 INR",style: TextStyle(fontSize: 19,color: Colors.black,fontWeight: FontWeight.w600),),
                    ],
                  ),
                ),
                SizedBox(
                  height: width*0.037,
                ),
                Container(
                  height: width*0.13,
                  width: width*0.77,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(width*0.03)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      LocaleText("TODAY'S PURCHASE :",style: TextStyle(fontSize: 14,color: Colors.black)),
                      Text(" 0.000 INR",style: TextStyle(fontSize: 19,color: Colors.black,fontWeight: FontWeight.w600),),
                    ],
                  ),
                ),
                SizedBox(
                  height: width*0.037,
                ),
                Container(
                  height: width*0.13,
                  width: width*0.77,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(width*0.03)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      LocaleText("TODAY'S RECEIPT :",style: TextStyle(fontSize: 14,color: Colors.black)),
                      Text(" 0.000 INR",style: TextStyle(fontSize:19,color: Colors.black,fontWeight: FontWeight.w600),),
                    ],
                  ),
                ),
                SizedBox(
                  height: width*0.037,
                ),
                Container(
                  height: width*0.13,
                  width: width*0.77,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(width*0.03)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      LocaleText("TODAY'S PAYMENTS :",style: TextStyle(fontSize: 14,color: Colors.black)),
                      Text("0.200 INR",style: TextStyle(fontSize:19,color: Colors.black,fontWeight: FontWeight.w600),),
                    ],
                  ),
                ),
              ],
            )
          ]),
        ));
  }
}
