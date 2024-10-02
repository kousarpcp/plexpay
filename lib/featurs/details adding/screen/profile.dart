import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:plexpay/featurs/details%20adding/screen/BottomNavigation.dart';
import 'package:plexpay/featurs/details%20adding/screen/collections.dart';
import 'package:plexpay/Const/colorConst.dart';
import 'package:plexpay/featurs/details%20adding/screen/due_summary.dart';
import 'package:plexpay/featurs/details%20adding/screen/home_page.dart';
import 'package:plexpay/featurs/details%20adding/screen/plexpay%20authentication/change_password.dart';
import 'package:plexpay/featurs/details%20adding/screen/plexpay%20authentication/login_page.dart';
import 'package:plexpay/featurs/details%20adding/screen/profit_summary.dart';
import 'package:plexpay/featurs/details%20adding/screen/refund_history.dart';
import 'package:plexpay/featurs/details%20adding/screen/report.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../../../Const/Snackbar_toast_helper.dart';
import '../../../Const/shared_preference.dart';
import '../../../api/wallet_amount_API.dart';
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
  var name;
  List locales=[
    "English",
    "हिंदी",
    "العربي"
  ];
  List localeCodes=[
    "en",
    "hi",
    "er"
  ];
  var isLoading = false;
  var wallet_amount;
  var due_amount;

  int currentIndex = 0;

  bool selectedLocale = false;
  Future<String> getWallet() async {
    setState(() {
      isLoading = true;
    });

    var wallet = await walletAmnt();


    if (wallet['status'] == true) {
      setState(() {
        wallet_amount = wallet['wallet_amount'].toString();
        due_amount = wallet['due_amount'].toString();
      });
    } else {
      var token = await sharedPrefrence("token", null);

      var name = await sharedPrefrence("name", null);
      print("logout");
      showToast("Session timeout !");
    }
    setState(() {
      isLoading = false;
    });
    print("uuuuuuuuuuuuuuuuuuu");
    return "";
  }



  @override
  void initState() {

    // TODO: implement initState
    super.initState();
    getWallet();
    _loadSavedLocale();
  }

  _loadSavedLocale() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    name = await getSharedPrefrence(shopname);
    setState(() {
      currentIndex = prefs.getInt('selectedLanguageIndex') ?? 0; // Default to first language if not set
    });
  }
  _saveLocale(int index) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('selectedLanguageIndex', index);
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(context).size.width > 650 ?
    Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        elevation: 0,
        backgroundColor: Colors.white,
        // leading: InkWell(
        //   onTap: () {
        //     Navigator.pop(context);
        //   },
        //   child: Container(
        //     height: height * 0.09,
        //     width: width * 0.05,
        //     child: Padding(
        //       padding: EdgeInsets.all(width * 0.01),
        //       child: SvgPicture.asset(
        //         ImageConst.back,
        //       ),
        //     ),
        //   ),
        // ),
        title: LocaleText(
          "Profile & Payments",
          style: TextStyle(fontSize: width * 0.025, fontWeight: FontWeight.w700),
        ),
      ),
      body:isLoading==true?Center(
        child: Container(
          margin: EdgeInsets.only(
              bottom: width*0.05,
              left: width*0.05,
              right: width*0.05
          ),
          child: Center(child: Lottie.asset(ImageConst.loading1,width: width*0.3),)
          ,
        ),
      ): SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: AnimationLimiter(
          child: Column(
            children:  AnimationConfiguration.toStaggeredList(
              duration:  Duration(milliseconds: 500),
              childAnimationBuilder: (widget) => SlideAnimation(
                  horizontalOffset: 50.0,
                  child: FadeInAnimation(
                    child: widget,
                  )
              ),
            children: [
              SizedBox(
                height: height * 0.015,
              ),
              Center(
                child: Container(
                  height: height * 0.16,
                  width: width * 0.93,
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
                  child: Padding(
                    padding: EdgeInsets.only(left: width * 0.02),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(CupertinoIcons.person_circle_fill,size: width * 0.043,color: colorConst.blue,),
                            SizedBox(
                              width: width * 0.02,
                            ),
                            Text(
                              name.toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: width * 0.026),
                            ),
                            SizedBox(
                              width: width * 0.02,
                            ),
                            Icon(Icons.verified,color: Colors.blue,)
                          ],
                        ),
                        LocaleText(
                          "Wallet & Account Settings",
                          style: TextStyle(fontSize: width * 0.018),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.018,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Center(
                    child: Container(
                      height: height * 0.12,
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
                          borderRadius: BorderRadius.circular(width * 0.018)),
                      child:
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                ImageConst.wallet,
                                width: width * 0.038,
                              ),
                              SizedBox(
                                width: width * 0.02,
                              ),
                              LocaleText(
                                "Balance",
                                style: TextStyle(
                                    fontSize: width * 0.027,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                width: width*0.02,
                              ),
                              Text(wallet_amount.toString(),
                                  style: TextStyle(
                                      fontSize: width * 0.026,
                                      fontWeight: FontWeight.w800)),
                            ],
                          ),

                    ),
                  ),
                  SizedBox(
                    width: width*0.03,
                  ),
                  Center(
                    child: Container(
                      height: height * 0.12,
                      width: width * 0.43,
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
                      child:
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                ImageConst.Duewallet,
                                width: width * 0.038,
                              ),
                              SizedBox(
                                width: width * 0.02,
                              ),
                              LocaleText(
                                "Due Balance",
                                style: TextStyle(
                                    fontSize: width * 0.027,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                width: width*0.02,
                              ),
                              Text(due_amount.toString(),
                                  style: TextStyle(
                                      fontSize: width * 0.026,
                                      fontWeight: FontWeight.w800)),
                            ],
                          ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: height * 0.018,
              ),
              Center(
                child: Container(
                  height: height * 0.35,
                  width: width * 0.932,
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: width * 0.03,
                          ),
                          LocaleText(
                            "Payment Methods",
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: width * 0.028),
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
                                width: width * 0.045,
                              ),
                              SizedBox(
                                height: height * 0.017,
                              ),
                              Text("Bank\nAccounts",textAlign: TextAlign.center,style: TextStyle(
                                fontSize: width*0.015,)),
                            ],
                          ),
                          InkWell(
                            onTap: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //       builder: (context) => debitcredit(),
                              //     ));
                            },
                            child: Column(
                              children: [
                                Image.asset(
                                  ImageConst.debitcredit,
                                  color: Colors.indigo,
                                  width: width * 0.055,
                                ),
                                Text("Debit &\nCredit Cards",textAlign: TextAlign.center,style: TextStyle(
                                  fontSize: width*0.015)),
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              Image.asset(
                                ImageConst.plexpayWallet,
                                color: Colors.indigo,
                                width: width * 0.045,
                              ),
                              SizedBox(
                                height: height * 0.017,
                              ),
                              Text("PlexPe\nWallet",textAlign: TextAlign.center,style: TextStyle(
                                fontSize: width*0.015),)
                            ],
                          ),
                          Column(
                            children: [
                              Image.asset(
                                ImageConst.giftCard,
                                // color: Colors.indigo,
                                width: width * 0.045,
                              ),
                              SizedBox(
                                height: height * 0.01,
                              ),
                              Text("PlexPe\nGift Card",textAlign: TextAlign.center,style: TextStyle(
                                fontSize: width*0.015,
                              ),),
                              // LocaleText(""),
                            ],
                          ),
                          Column(
                            children: [
                              SizedBox(
                                height: height * 0.015,
                              ),
                              Container(
                                height: height * 0.06,
                                width: width * 0.09,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    image: DecorationImage(
                                        image: AssetImage(ImageConst.upi)),
                                    borderRadius:
                                    BorderRadius.circular(width * 0.01)),
                              ),
                              SizedBox(
                                height: height * 0.025,
                              ),
                              Text("UPI Lite",textAlign: TextAlign.center,style: TextStyle(
                                fontSize: width*0.015,))
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.016,
              ),
              Container(
                height: MediaQuery.of(context).size.height > 520 ?height*0.94: height * 1.4,
                width: width * 0.932,
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
                      height: height * 0.025,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: width * 0.03,
                        ),
                        LocaleText(
                          "Account Summary",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: width * 0.028),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.015,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ReportsTab(),));
                      },
                      child: ListTile(
                        leading: Image.asset(
                          ImageConst.report,
                          width: width * 0.035,
                        ),
                        title: LocaleText(
                          "Report",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: width * 0.023),
                        ),
                        trailing: Icon(Icons.navigate_next),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Funds(),));
                      },
                      child: ListTile(
                        leading: Image.asset(
                          ImageConst.funds,
                          width: width * 0.035,
                        ),
                        title: LocaleText(
                          "Funds",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: width * 0.023),
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
                          width: width * 0.035,
                        ),
                        title: LocaleText(
                          "Transactions",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: width * 0.023),
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
                          width: width * 0.035,
                        ),
                        title: LocaleText(
                          "Collections",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: width * 0.023),
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
                          width: width * 0.035,
                        ),
                        title: LocaleText(
                          "Due Summary",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: width * 0.023),
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
                          width: width * 0.035,
                        ),
                        title: LocaleText(
                          "Profit Summary",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: width * 0.023),
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
                          width: width * 0.035,
                        ),
                        title: LocaleText(
                          "Refund History",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: width * 0.023),
                        ),
                        trailing: Icon(Icons.navigate_next),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ChangePIN(),
                            ));
                      },
                      child: ListTile(
                        leading: Padding(
                          padding:  EdgeInsets.only(left: width*0.01),
                          child: Icon(
                            Icons.edit_outlined,
                            size: width*0.022,
                            color: colorConst.blue,
                          ),
                        ),
                        title: Text(
                          "Change Password",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: width * 0.023),
                        ),
                        trailing: Icon(Icons.navigate_next),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.016,
              ),
              Center(
                child: Container(

                  height: MediaQuery.of(context).size.height > 520 ?height*0.6:height * 0.68,
                  width: width * 0.932,
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
                      SizedBox(
                        height: height * 0.025,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: width * 0.03,
                          ),
                          Text(
                            "Languages",
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: width * 0.028),
                          ),
                        ],
                      ),
                     SizedBox(
                       height: height*0.025,
                     ),

                     Column(
                       children: [
                         ListView.builder(
                           physics: NeverScrollableScrollPhysics(),
                           shrinkWrap: true,
                             itemCount: locales.length,
                             itemBuilder: (context, index) {
                             selectedLocale = currentIndex == index;
                               return Container(
                                 height: MediaQuery.of(context).size.height > 520 ?height*0.11:height*0.15,
                                 margin: EdgeInsets.only(bottom: height*0.025,left: width*0.025,right: width*0.025),
                                 decoration: BoxDecoration(
                                   color: colorConst.lightgrey1,
                                   borderRadius: BorderRadius.circular(width*0.018)
                                 ),
                                 child: ListTile(
                                   onTap: () {
                                     setState(() {
                                        currentIndex = index ;
                                     });
                                     _saveLocale(index);
                                     Locales.change(context, localeCodes[currentIndex]);
                                   },
                                   leading:Icon(selectedLocale?Icons.check : Icons.language,size: width*0.025,),
                                   title: Text(locales[index],style: TextStyle(
                                 fontWeight: FontWeight.w500, fontSize: width * 0.023),
                                     ),
                                   trailing: Icon(Icons.navigate_next,size: width*0.025,),
                                 ),
                               );
                             },
                         )
                       ],
                     ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.025,
              ),
              GestureDetector(
                onTap: () {
                  showCupertinoModalPopup(
                  barrierColor: Colors.black.withOpacity(0.5),
                  context: context,
                  builder: (context) {
                    return CupertinoAlertDialog(
                      content: Text("Are you Sure\nYou Want to Log Out !",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: width * 0.018)),
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
                            Navigator.pushAndRemoveUntil(context, CupertinoPageRoute(builder:(context) => Login(),), (route) => false);
                          },
                          child: Text("Confirm"),
                        ),
                      ],
                    );
                  },
                );
                },
                child: Container(
                  height: MediaQuery.of(context).size.height > 520 ?height*0.11:height * 0.16,
                  width: width * 0.932,
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
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(
                          Icons.logout_sharp,
                          color: Colors.red,
                        ),
                        title: LocaleText(
                          "Logout",
                          style:
                              TextStyle(color: Colors.red, fontSize: width * 0.027),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.025,
              ),
            ],
          ),
          ),
        ),
      ),
    )
    : Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        elevation: 0,
        backgroundColor: Colors.white,

        title: LocaleText(
          "Profile & Payments",
          style: TextStyle(fontSize: width * 0.05, fontWeight: FontWeight.w700),
        ),
      ),
      body:isLoading==true?Container(
        margin: EdgeInsets.only(
            bottom: width*0.05,
            left: width*0.05,
            right: width*0.05
        ),
        child: Center(child: Lottie.asset(ImageConst.loading1))
        ,
      ): SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: AnimationLimiter(
          child: Column(
            children:  AnimationConfiguration.toStaggeredList(
              duration:  Duration(milliseconds: 500),
              childAnimationBuilder: (widget) => SlideAnimation(
                  horizontalOffset: 50.0,
                  child: FadeInAnimation(
                    child: widget,
                  )
              ),
            children: [
              SizedBox(
                height: height * 0.015,
              ),
              Center(
                child: Container(
                  height: height * 0.13,
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
                            Icon(CupertinoIcons.person_circle_fill,size: width * 0.12,color: colorConst.blue,),
                            SizedBox(
                              width: width * 0.02,
                            ),
                            Text(
                              name.toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: width * 0.057),
                            ),
                            SizedBox(
                              width: width * 0.02,
                            ),
                            Icon(Icons.verified,color: Colors.blue,)
                          ],
                        ),
                        LocaleText(
                          "Wallet & Account Settings",
                          style: TextStyle(fontSize: width * 0.047),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.015,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Center(
                    child: Container(
                      height: height * 0.12,
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
                              LocaleText(
                                "Balance",
                                style: TextStyle(
                                    fontSize: width * 0.05,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          Text(wallet_amount.toString(),
                              style: TextStyle(
                                  fontSize: width * 0.06,
                                  fontWeight: FontWeight.w800)),
                        ],
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      height: height * 0.12,
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
                              LocaleText(
                                "Due Balance",
                                style: TextStyle(
                                    fontSize: width * 0.05,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),

                          Text(due_amount.toString(),
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
                height: height * 0.015,
              ),
              Center(
                child: Container(
                  height: height * 0.33,
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
                          LocaleText(
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
                                height: height * 0.01,
                              ),
                              LocaleText("Bank"),
                              LocaleText("Accounts"),
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
                                LocaleText("Debit &"),
                                LocaleText("Credit Cards"),
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
                                height: height * 0.015,
                              ),
                              LocaleText("PlexPe"),
                              LocaleText("Wallet"),
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
                                height: height * 0.01,
                              ),
                              LocaleText("PlexPe"),
                              LocaleText("Gift Card"),
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
                                height: height * 0.015,
                              ),
                              Container(
                                height: height * 0.045,
                                width: width * 0.09,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    image: DecorationImage(
                                        image: AssetImage(ImageConst.upi)),
                                    borderRadius:
                                        BorderRadius.circular(width * 0.03)),
                              ),
                              SizedBox(
                                height: height * 0.015,
                              ),
                              LocaleText("UPI Lite")
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.016,
              ),
              Container(
                height: height * 0.69,
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
                      height: height * 0.025,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: width * 0.04,
                        ),
                        LocaleText(
                          "Account Summary",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: width * 0.053),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.015,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ReportsTab(),));
                      },
                      child: ListTile(
                        leading: Image.asset(
                          ImageConst.report,
                          width: width * 0.09,
                        ),
                        title: LocaleText(
                          "Report",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: width * 0.055),
                        ),
                        trailing: Icon(Icons.navigate_next),
                      ),
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
                        title: LocaleText(
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
                        title: LocaleText(
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
                        title: LocaleText(
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
                        title: LocaleText(
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
                        title: LocaleText(
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
                        title: LocaleText(
                          "Refund History",
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
                              builder: (context) => ChangePIN(),
                            ));
                      },
                      child: ListTile(
                        leading: Padding(
                          padding:  EdgeInsets.only(left: width*0.02),
                          child: Icon(
                            Icons.edit_outlined,
                            size: width*0.07,
                            color: colorConst.blue,
                          ),
                        ),
                        title: Text(
                          "Change Password",
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
                height: height * 0.016,
              ),
              Center(
                child: Container(
                  height: height * 0.35,
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
                      SizedBox(
                        height: height * 0.015,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: width * 0.06,
                          ),
                          Text(
                            "Languages",
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: width * 0.053),
                          ),
                        ],
                      ),

                     Column(
                       children: [
                         ListView.builder(
                           shrinkWrap: true,
                             itemCount: locales.length,
                             itemBuilder: (context, index) {
                             selectedLocale = currentIndex == index;
                               return Container(
                                 margin: EdgeInsets.all(width*0.01),
                                 decoration: BoxDecoration(
                                   color: colorConst.lightgrey1,
                                   borderRadius: BorderRadius.circular(width*0.03)
                                 ),
                                 child: ListTile(
                                   onTap: () {
                                     setState(() {
                                        currentIndex = index ;
                                     });
                                     _saveLocale(index);
                                     Locales.change(context, localeCodes[currentIndex]);
                                   },
                                   leading:Icon(selectedLocale?Icons.check : Icons.language,),
                                   title: Text(locales[index],style: TextStyle(
                                 fontWeight: FontWeight.w500, fontSize: width * 0.055),
                                     ),
                                   trailing: Icon(Icons.navigate_next),
                                 ),
                               );
                             },
                         )
                       ],
                     ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.016,
              ),
              GestureDetector(
                onTap: () {
                  showCupertinoModalPopup(
                    barrierColor: Colors.black.withOpacity(0.5),
                    context: context,
                    builder: (context) {
                      return CupertinoAlertDialog(
                        content: Text("Are you Sure\nYou Want to Log Out !",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: width * 0.035)),
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
                              Navigator.pushAndRemoveUntil(context, CupertinoPageRoute(builder:(context) => Login(),), (route) => false);
                            },
                            child: Text("Confirm"),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Container(
                  height: height * 0.083,
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
                        title: LocaleText(
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
                height: height * 0.01,
              ),
            ],
          ),
          ),
        ),
      ),
    );
  }
}
