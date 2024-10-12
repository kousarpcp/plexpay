import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:plexpay/Const/colorConst.dart';
import 'package:plexpay/Const/shared_preference1.dart';
import 'package:plexpay/featurs/details%20adding/plexBill/plexBill_New.dart';
import 'package:plexpay/featurs/details%20adding/plexBill/plexBill_login.dart';
import 'package:plexpay/featurs/details%20adding/plexBill/purchase.dart';
import 'package:plexpay/featurs/details%20adding/screen/BottomNavigation.dart';
import 'package:plexpay/featurs/details%20adding/screen/home_page.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';


import '../../../Const/imageConst.dart';
import '../../../Const/shared_preference.dart';
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
  var currency;
  var isLoading=false;


  getData() async {
    setState(() {
      isLoading=true;
    });
    var username= await getplexbilllogin("username");
    var password= await getplexbilllogin("password");
    print(password);
    print(username);
    print("nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn");
    var rsp=await plexbillLoginApi(username.toString(),password.toString());
    if ( rsp['userdatas']!=null) {
      todays_sale= rsp["todaysale"];
      todays_purchase= rsp["todayreturn"];
      todays_receipt= rsp["todayreceipt"];
      todays_payments= rsp["todaypayment"];
      currency=rsp["currency"];
      print("wwwwwwwwwwwwwwwwwwwwwwwwwww");
      print("Login success");
      print("wrking");
      print(rsp?['id']);
      print(rsp?['token']);
    }
    setState(() {
      isLoading=false;
    });
  }
  @override
  void initState() {
    getData();
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(context).size.width > 650 ?
      Scaffold(
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
              height: height * 0.09,
              width: width * 0.05,
              child: Padding(
                padding: EdgeInsets.all(width * 0.01),
                child: SvgPicture.asset(
                  ImageConst.back,
                ),
              ),
            ),
          ),
          title: LocaleText(
            "PlexBill",
            style:
                TextStyle(fontSize: width * 0.025, fontWeight: FontWeight.w700),
          ),
          actions: [
            InkWell(
              onTap: () {
                showCupertinoModalPopup(
                  barrierColor: Colors.black.withOpacity(0.5),
                  context: context,
                  builder: (context) {
                    return CupertinoAlertDialog(
                      content: Text("Are you Sure\nYou Want to Log Out !",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: width * 0.023)),
                      actions: [
                        CupertinoDialogAction(
                          textStyle:
                          TextStyle(color: Colors.black),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text("Cancel"),
                        ),
                        CupertinoDialogAction(
                          isDefaultAction: true,
                          textStyle: TextStyle(color: colorConst.blue),
                          onPressed: () async {
                            var id = await removesharedPrefrence("userId", null);
                            var token = await removesharedPrefrence("token", null);
                            var name = await removesharedPrefrence("name", null);
                            Navigator.pushAndRemoveUntil(context, CupertinoPageRoute(builder:(context) => BottomNavigation(),), (route) => false);
                          },
                          child: Text("Confirm"),
                        ),
                      ],
                    );
                  },
                );

              },
                child: Container(child: Icon(Icons.logout,color: colorConst.blue,))),
            SizedBox(width: width*0.04,)
          ],
        ),
        body: isLoading==true?Container(
          margin: EdgeInsets.only(
              bottom: width*0.05,
              left: width*0.05,
              right: width*0.05
          ),
          child: Center(child: Lottie.asset(ImageConst.loadingWhite))
          ,
        ):SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
              children: [
            // Text("Contact Info",style: TextStyle(fontSize: width*0.06,fontWeight: FontWeight.w900)),
            // SizedBox(
            //   height: width*0.015,
            // ),
                SizedBox(
                  height: height*0.03,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: width*0.072,
                    ),
                    LocaleText("Dash Board",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700,color: Colors.white),),
                  ],
                ),
                SizedBox(
                  height: height*0.03,
                ),
                Center(
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
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => plexbillNew(),));
                                },
                                child: Center(
                                  child: Container(
                                    height: width * 0.06,
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
                                        borderRadius: BorderRadius.circular(width * 0.018)),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.paid_outlined,
                                          color: Colors.black,
                                          size: width * 0.027,
                                        ),
                                        SizedBox(
                                          width: width * 0.02,
                                        ),
                                        LocaleText(
                                          "Billing",
                                          style: TextStyle(
                                              fontSize: width * 0.02,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Center(
                                child: Container(
                                  height: width * 0.06,
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
                                      borderRadius: BorderRadius.circular(width * 0.018)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.shopping_cart,
                                        color: Colors.black,
                                        size: width * 0.027,
                                      ),
                                      SizedBox(
                                        width: width * 0.02,
                                      ),
                                      LocaleText(
                                        "Purchase",
                                        style: TextStyle(
                                            fontSize: width * 0.02,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: height * 0.05,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Center(
                                child: Container(
                                  height: width * 0.06,
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
                                      borderRadius: BorderRadius.circular(width * 0.018)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.screen_rotation_alt,
                                        color: Colors.black,
                                        size: width * 0.027,
                                      ),
                                      SizedBox(
                                        width: width * 0.02,
                                      ),
                                      LocaleText(
                                        "Sale Return",
                                        style: TextStyle(
                                            fontSize: width * 0.02,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                height: width * 0.06,
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
                                    borderRadius: BorderRadius.circular(width * 0.018)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.refresh_outlined,
                                      color: Colors.black,
                                      size: width * 0.027,
                                    ),
                                    SizedBox(
                                      width: width * 0.016,
                                    ),
                                    LocaleText(
                                      "Purchase Return",
                                      style: TextStyle(
                                          fontSize: width * 0.02,
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

            SizedBox(
              height: width*0.07,
            ),
            Column(
              children: [
                Container(
                  height: height*0.11,
                  width: width*0.7,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(width*0.018)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      LocaleText("TODAY'S SALE :",style: TextStyle(fontSize:14,color: Colors.black)),
                      Text(" ${todays_sale} ${currency}",style: TextStyle(fontSize: 19,color: Colors.black,fontWeight: FontWeight.w600),),
                    ],
                  ),
                ),
                SizedBox(
                  height: height*0.037,
                ),
                Container(
                  height: height*0.11,
                  width: width*0.7,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(width*0.018)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      LocaleText("TODAY'S PURCHASE :",style: TextStyle(fontSize: 14,color: Colors.black)),
                      Text(" ${todays_purchase} ${currency}",style: TextStyle(fontSize: 17,color: Colors.black,fontWeight: FontWeight.w600),),
                    ],
                  ),
                ),
                SizedBox(
                  height: height*0.037,
                ),
                Container(
                  height: height*0.11,
                  width: width*0.7,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(width*0.018)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      LocaleText("TODAY'S RECEIPT :",style: TextStyle(fontSize: 14,color: Colors.black)),
                      Text(" ${todays_receipt} ${currency}",style: TextStyle(fontSize:16,color: Colors.black,fontWeight: FontWeight.w600),),
                    ],
                  ),
                ),
                SizedBox(
                  height: height*0.037,
                ),
                Container(
                  height: height*0.11,
                  width: width*0.7,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(width*0.018)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      LocaleText("TODAY'S PAYMENTS :",style: TextStyle(fontSize: 14,color: Colors.black)),
                      Text(" ${todays_payments} ${currency}",style: TextStyle(fontSize:17,color: Colors.black,fontWeight: FontWeight.w600),),
                    ],
                  ),
                ),
              ],
            ),
                SizedBox(
                  height: height*0.02,
                )
          ]),
        )):
      Scaffold(
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
          actions: [
            InkWell(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  anchorPoint: Offset(2, 5),

                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(width*0.05)
                  ),
                  builder: (context) {
                    return Container(
                      height: width*0.6,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(width*0.05),topRight: Radius.circular(width*0.05)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Text("Are you sure you want to log out?",style: TextStyle(
                                fontSize: 20,fontWeight: FontWeight.w600)),
                          ),
                          SizedBox(height: width*0.05,),
                          InkWell(onTap: () async {
                            var id= await removeplexbilllogin("userId1", null);
                            var user= await removeplexbilllogin("username", null);
                            var pass= await removeplexbilllogin("password", null);
                            Navigator.pushAndRemoveUntil(context, CupertinoPageRoute(builder:(context) => BottomNavigation(),), (route) => false);
                          },
                            child: Container(
                              height: width*0.1,
                              width:width*0.8,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(width*0.03),
                                  color: colorConst.blue
                              ),
                              child: Center(child: Text("YES",style: TextStyle(
                                  fontWeight: FontWeight.w600,color: Colors.white),)),
                            ),
                          ),
                          SizedBox(height: width*0.05,),
                          InkWell(onTap: () {
                            Navigator.pop(context);
                          },
                            child: Container(
                              height: width*0.1,
                              width:width*0.8,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(width*0.03),
                                  color: colorConst.blue
                              ),
                              child: Center(child: Text("NO",style: TextStyle(
                                  fontWeight: FontWeight.w600,color: Colors.white),)),
                            ),
                          ),
                        ],
                      ),

                    );
                  },
                );
              },
                child: Container(child: Icon(Icons.logout,color: colorConst.blue,))),
            SizedBox(width: width*0.04,)
          ],
        ),
        body: isLoading==true?Container(
          // color: Colors.white,
          margin: EdgeInsets.only(
              bottom: width*0.05,
              left: width*0.05,
              right: width*0.05
          ),
          child: Center(child: Lottie.asset(ImageConst.loadingWhite))
          ,
        ):SingleChildScrollView(
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
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => plexbillNew(),));
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
                                InkWell(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => purchase(),));
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
                      Text(" ${todays_sale} ${currency}",style: TextStyle(fontSize: 19,color: Colors.black,fontWeight: FontWeight.w600),),
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
                      Text(" ${todays_purchase} ${currency}",style: TextStyle(fontSize: 17,color: Colors.black,fontWeight: FontWeight.w600),),
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
                      Text(" ${todays_receipt} ${currency}",style: TextStyle(fontSize:16,color: Colors.black,fontWeight: FontWeight.w600),),
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
                      Text(" ${todays_payments} ${currency}",style: TextStyle(fontSize:17,color: Colors.black,fontWeight: FontWeight.w600),),
                    ],
                  ),
                ),
              ],
            )
          ]),
        ));
  }
}
