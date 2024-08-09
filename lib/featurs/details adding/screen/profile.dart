import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:plexpay/featurs/details%20adding/screen/BottomNavigation.dart';
import 'package:plexpay/featurs/details%20adding/screen/collections.dart';
import 'package:plexpay/Const/colorConst.dart';
import 'package:plexpay/featurs/details%20adding/screen/due_summary.dart';
import 'package:plexpay/featurs/details%20adding/screen/home_page.dart';
import 'package:plexpay/featurs/details%20adding/screen/login_page.dart';
import 'package:plexpay/featurs/details%20adding/screen/profit_summary.dart';
import 'package:plexpay/featurs/details%20adding/screen/refund_history.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../main.dart';
import 'History_Bottom.dart';
import 'debit&credit.dart';
import 'funds.dart';
import '../../../Const/imageConst.dart';

class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
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
        title: Text(
          "Profile & Payments",
          style: TextStyle(fontSize: width * 0.06, fontWeight: FontWeight.w700),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: AnimationLimiter(
          child: Column(
            children:  AnimationConfiguration.toStaggeredList(
              duration: const Duration(milliseconds: 500),
              childAnimationBuilder: (widget) => SlideAnimation(
                  horizontalOffset: 50.0,
                  child: FadeInAnimation(
                    child: widget,
                  )
              ),
            children: [
              SizedBox(
                height: width * 0.03,
              ),
              Center(
                child: Container(
                  height: width * 0.24,
                  width: width * 0.87,
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
                  child: Padding(
                    padding: EdgeInsets.only(left: width * 0.02),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              ImageConst.contact,
                              width: width * 0.12,
                            ),
                            SizedBox(
                              width: width * 0.02,
                            ),
                            Text(
                              "TEST4",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: width * 0.057),
                            ),
                            SizedBox(
                              width: width * 0.02,
                            ),
                            Image.asset(
                              ImageConst.verified,
                              width: width * 0.05,
                            ),
                          ],
                        ),
                        Text(
                          "Wallet & Account Settings",
                          style: TextStyle(fontSize: width * 0.047),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: width * 0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Center(
                    child: Container(
                      height: width * 0.24,
                      width: width * 0.41,
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                ImageConst.wallet,
                                width: width * 0.07,
                              ),
                              SizedBox(
                                width: width * 0.02,
                              ),
                              Text(
                                "Balance",
                                style: TextStyle(
                                    fontSize: width * 0.05,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          Text(" AED 54.56",
                              style: TextStyle(
                                  fontSize: width * 0.06,
                                  fontWeight: FontWeight.w800)),
                        ],
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      height: width * 0.24,
                      width: width * 0.41,
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                ImageConst.Duewallet,
                                width: width * 0.065,
                              ),
                              SizedBox(
                                width: width * 0.02,
                              ),
                              Text(
                                "Due Balance",
                                style: TextStyle(
                                    fontSize: width * 0.05,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          Text(" AED 1000.00",
                              style: TextStyle(
                                  fontSize: width * 0.06,
                                  fontWeight: FontWeight.w800)),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: width * 0.03,
              ),
              Center(
                child: Container(
                  height: width * 0.65,
                  width: width * 0.88,
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
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: width * 0.06,
                          ),
                          Text(
                            "Payment Methods",
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: width * 0.053),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Image.asset(
                                ImageConst.account,
                                color: Colors.indigo,
                                width: width * 0.075,
                              ),
                              SizedBox(
                                height: width * 0.02,
                              ),
                              Text("Bank"),
                              Text("Accounts"),
                            ],
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => debitcredit(),
                                  ));
                            },
                            child: Column(
                              children: [
                                Image.asset(
                                  ImageConst.debitcredit,
                                  color: Colors.indigo,
                                  width: width * 0.11,
                                ),
                                Text("Debit &"),
                                Text("Credit Cards"),
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              Image.asset(
                                ImageConst.plexpayWallet,
                                color: Colors.indigo,
                                width: width * 0.07,
                              ),
                              SizedBox(
                                height: width * 0.029,
                              ),
                              Text("PlexPe"),
                              Text("Wallet"),
                            ],
                          ),
                          Column(
                            children: [
                              Image.asset(
                                ImageConst.giftCard,
                                // color: Colors.indigo,
                                width: width * 0.078,
                              ),
                              SizedBox(
                                height: width * 0.02,
                              ),
                              Text("PlexPe"),
                              Text("Gift Card"),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: width * 0.08,
                          ),
                          Column(
                            children: [
                              SizedBox(
                                height: width * 0.03,
                              ),
                              Container(
                                height: width * 0.09,
                                width: width * 0.09,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    image: DecorationImage(
                                        image: AssetImage(ImageConst.upi)),
                                    borderRadius:
                                        BorderRadius.circular(width * 0.03)),
                              ),
                              SizedBox(
                                height: width * 0.03,
                              ),
                              Text("UPI Lite")
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: width * 0.032,
              ),
              Container(
                height: width * 1.1,
                width: width * 0.88,
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
                  children: [
                    SizedBox(
                      height: width * 0.05,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: width * 0.04,
                        ),
                        Text(
                          "Account Summary",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: width * 0.053),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: width * 0.03,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Funds(),));
                      },
                      child: ListTile(
                        leading: Image.asset(
                          ImageConst.funds,
                          width: width * 0.09,
                        ),
                        title: Text(
                          "Funds",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: width * 0.055),
                        ),
                        trailing: Icon(Icons.navigate_next),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HistoryBottom3(),
                            ));
                      },
                      child: ListTile(
                        leading: Image.asset(
                          ImageConst.transactions,
                          width: width * 0.09,
                        ),
                        title: Text(
                          "Transactions",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: width * 0.055),
                        ),
                        trailing: Icon(Icons.navigate_next),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Collections(),
                            ));
                      },
                      child: ListTile(
                        leading: Image.asset(
                          ImageConst.collections,
                          width: width * 0.09,
                        ),
                        title: Text(
                          "Collections",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: width * 0.055),
                        ),
                        trailing: Icon(Icons.navigate_next),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => dueSummary(),
                            ));
                      },
                      child: ListTile(
                        leading: Image.asset(
                          ImageConst.duesummary,
                          width: width * 0.09,
                        ),
                        title: Text(
                          "Due Summary",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: width * 0.055),
                        ),
                        trailing: Icon(Icons.navigate_next),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => profitSummary(),
                            ));
                      },
                      child: ListTile(
                        leading: Image.asset(
                          ImageConst.profitsummary,
                          width: width * 0.09,
                        ),
                        title: Text(
                          "Profit Summary",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: width * 0.055),
                        ),
                        trailing: Icon(Icons.navigate_next),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => refundHistory(),
                            ));
                      },
                      child: ListTile(
                        leading: Image.asset(
                          ImageConst.refundhistory,
                          width: width * 0.09,
                        ),
                        title: Text(
                          "Refund History",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: width * 0.055),
                        ),
                        trailing: Icon(Icons.navigate_next),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: width * 0.032,
              ),
              GestureDetector(
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
                              SharedPreferences _prefs = await SharedPreferences.getInstance();
                              _prefs.clear();
                              Navigator.pushAndRemoveUntil(context, CupertinoPageRoute(builder:(context) => Login(),), (route) => false);
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
                child: Container(
                  height: width * 0.17,
                  width: width * 0.88,
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
                    children: [
                      ListTile(
                        leading: Icon(
                          Icons.logout_sharp,
                          color: Colors.red,
                        ),
                        title: Text(
                          "Logout",
                          style:
                              TextStyle(color: Colors.red, fontSize: width * 0.053),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: width * 0.02,
              ),
            ],
          ),
          ),
        ),
      ),
    );
  }
}
