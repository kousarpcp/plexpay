import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plexpay/Const/colorConst.dart';
import 'package:plexpay/Const/widgets.dart';
import 'package:plexpay/api/home_api.dart';
import 'package:plexpay/featurs/details%20adding/screen/Notification.dart';
import 'package:plexpay/Const/imageConst.dart';
import 'package:plexpay/featurs/details%20adding/screen/international.dart';
import 'package:plexpay/featurs/details%20adding/screen/local.dart';
import 'package:plexpay/featurs/details%20adding/screen/profile.dart';
import 'package:shimmer/shimmer.dart';

import '../../../Const/Snackbar_toast_helper.dart';
import '../../../Const/shared_preference.dart';
import '../../../api/fetchcountryhome_api.dart';
import '../../../api/wallet_amount_API.dart';
import '../../../main.dart';
int _selectedIndex = 0;


class home_page extends StatefulWidget {
  const home_page({super.key});

  @override
  State<home_page> createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {

  var isLoading = false;
  var data ;
  var prepaid ;
  var postpaid;
  var voucher ;
  var giftcard ;
  var electricity  ;
  var DTH  ;
  var GamingCard  ;
  var isCatLoading = true;
  var wallet_amount;
  var due_amount;


  var interlist;


  List a = [
    {"image1": ImageConst.cart1},
    {"image1": ImageConst.cart2},
    {"image1": ImageConst.cart3},
    {"image1": ImageConst.cart4},
    {"image1": ImageConst.cart5},
  ];

  bool k = false;
  bool b = false;
  bool c = false;
  bool d = false;

  Future<String> getHome() async {
    setState(() {
      isCatLoading = true;
    });
    var rsp =await fetchHomeApi();

    data=rsp['data'];
    // postpaid = rsp['data']['Postpaid'];
    // voucher = rsp['data']['Voucher'];
    // giftcard =rsp['data']['Gift Card'];
    // electricity = rsp['data']['Electricity'];
    // DTH = rsp['data']['DTH'];
    // GamingCard = rsp['data']['Gaming Card'];
    setState(() {
      isCatLoading = false;
    });
    print(data);
    print("uuuuuuuuuuuuuuuuuuu");
    return "";
  }
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
    print(data);
    print("uuuuuuuuuuuuuuuuuuu");
    return "";
  }
  Future<String> changeDash() async {
    setState(() {
      isLoading = false;
    });

    //var rsp = await dashFlipApi();
    var rsp = await fetchCountryHomeApi();

    //   voucherList = rsp['mobile_countries'];
    print("international");
    print(rsp);
    if (rsp != 0) {
      setState(() {
        interlist = rsp['country'];


      });
    }

    print("voucherrr");

    setState(() {
      isLoading = false;
    });

    return " ";
  }
  @override
  void initState() {
    // TODO: implement initState
    getHome();
    changeDash();
    getWallet();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(context).size.width > 650?
      DefaultTabController(
      length: 2,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          scrolledUnderElevation: 0,
          toolbarHeight: height*0.1,
          backgroundColor: Colors.white,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage(ImageConst.plexpay),
                width: width * 0.09,
              ),
              Row(
                children: [
                  LocaleText(
                    "WALLET :",
                    style: TextStyle(fontSize: width * 0.015, color: Colors.black),
                  ),
                  SizedBox(
                    width: width*0.01,
                  ),
                  Text(
                    wallet_amount != null ? wallet_amount.toString() : "",
                    style: TextStyle(fontSize: width * 0.015, color: Colors.black),
                  )
                ],
              ),
            ],
          ),
          actions: [
            Row(
              children: [
                InkWell(
                  borderRadius: BorderRadius.circular(width*0.06),
                  splashColor: colorConst.blue,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Notifications(),
                        ));
                  },
                  child: CircleAvatar(
                    radius: width*0.025,
                    backgroundColor: Colors.transparent,
                    child: Icon(
                      Icons.notifications_rounded,
                      color: colorConst.blue,
                      size: width*0.035,
                    ),
                  )
                ),

                InkWell(
                    borderRadius: BorderRadius.circular(width*0.06),
                    splashColor: colorConst.blue,
                    onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => profile(
                          ),
                        ));
                  },
                  child: CircleAvatar(
                    radius: width*0.025,
                    backgroundColor: Colors.transparent,
                    child: Icon(
                      CupertinoIcons.person_circle_fill,
                      color: colorConst.blue,
                      size: width*0.035,
                    ),
                  )
                ),
              ],
            ),
            SizedBox(
              width: width * 0.02,
            )
          ],
        ),
        body:isCatLoading?Container(
          child: Padding(
            padding:  EdgeInsets.all(width*0.03),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  gap,
                  Center(
                    child: Shimmer.fromColors(
                      baseColor: Colors.grey.shade100,
                      highlightColor: Colors.white,
                      direction: ShimmerDirection.ltr,
                      period: Duration(seconds: 1),
                      enabled: true,
                      child: Container(
                        height: height * 0.13,
                        width: width * 0.93,
                        decoration: BoxDecoration(
                            color: colorConst.lightgrey1,
                            borderRadius: BorderRadius.circular(width * 0.03))
                      ),
                    ),
                  ),
                  gap,
                  SizedBox(
                    height: width*0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // SizedBox(width: width*0.06,),
                      Container(
                        height: width * 0.18,
                        width: width * 0.82,
                        child: ListView.separated(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Column(
                                  children: [
                                    Shimmer.fromColors(
                                      baseColor: Colors.grey.shade100,
                                      highlightColor: Colors.white,
                                      direction: ShimmerDirection.btt,
                                      enabled: true,
                                      child: Container(
                                          height: width*0.14,
                                          width: width*0.14,
                                          decoration: BoxDecoration(
                                            color: CupertinoColors.systemGrey4,
                                            borderRadius: BorderRadius.circular(width*0.03),
                                          ),
                                      ),
                                    ),
                                  ]
                              );
                            },
                            separatorBuilder: (context, index) {
                              return SizedBox(
                                width: width * 0.03,
                              );
                            },
                            itemCount: 5),
                      )
                    ],
                  ),
                  Shimmer.fromColors(
                    baseColor: Colors.grey.shade100,
                    highlightColor: Colors.white,
                    direction: ShimmerDirection.btt,
                    enabled: true,
                    child: Container(
                      height: width * 0.125,
                      width: width * 0.56,
                      decoration: BoxDecoration(
                          color: CupertinoColors.systemGrey4,
                          borderRadius: BorderRadius.circular(width * 0.03)),
                    ),
                  ),
                  SizedBox(
                    height: width * 0.03,
                  ),
                  Container(
                    height: width*0.15,
                    width: width*1,
                    child: ListView.separated(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Shimmer.fromColors(
                                baseColor: Colors.grey.shade100,
                                highlightColor: Colors.white,
                                direction: ShimmerDirection.btt,
                                enabled: true,
                                child: Container(
                                  height: width*0.088,
                                  width: width*0.25,
                                  margin: EdgeInsets.only(left: width*0.035),
                                  decoration: BoxDecoration(
                                      color:  Colors.grey.shade100,
                                      borderRadius: BorderRadius.circular(width*0.03)
                                  ),
                                ),
                              )
                            ],
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                              width:width*0.01
                          );
                        },
                        itemCount: 4
                    ),
                  ),
                  Container(
                    height: width*1.3,
                    child: GridView.builder(
                      itemCount: 12,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 0.9,
                          crossAxisSpacing: width*0.01,
                          mainAxisSpacing: width*0.01,
                          crossAxisCount: 4),
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Shimmer.fromColors(
                              baseColor: Colors.grey.shade100,
                              highlightColor: Colors.white,
                              direction: ShimmerDirection.btt,
                              enabled: true,
                              child: Container(
                                height: width*0.17,
                                width: width*0.17,
                                decoration: BoxDecoration(
                                  // color: Colors.blue,
                                    borderRadius: BorderRadius.circular(width * 0.03),
                                  color: Colors.grey.shade100,
                                    ),
                                // child: Image.asset(images[index]["image1"],fit: BoxFit.fill,),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  )

                ],
              ),
            ),
          ),
        ):
        Padding(
          padding:  EdgeInsets.all(width*0.01),
          child: Column(
            children: [
              SizedBox(
                height: height*0.02,
              ),
              Center(
                child: Container(
                  height: height * 0.14,
                  width: width * 0.93,
                  decoration: BoxDecoration(
                      color: colorConst.blue,
                      borderRadius: BorderRadius.circular(width * 0.03)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          LocaleText(
                            "Free Vouchers",
                            style: TextStyle(
                                // softWrap: true, // Allows text to wrap to the next line
                                // maxLines: null, // Allows unlimited lines
                                overflow: TextOverflow.visible,
                                fontSize: width*0.023, color: Colors.white),
                          ),
                          LocaleText(
                            "Tap here to claim your free discount vouchers",
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                                fontSize: width * 0.01, color: Colors.white),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: width*0.15,
                      ),
                      Row(
                        children: [
                          Text(
                            "0",
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: width*0.045,
                            )
                          ),
                          Text(
                            "%",
                            style: GoogleFonts.poppins(
                                fontSize: width * 0.045,
                                color: Colors.lightBlue.shade200),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(
                height: height*0.03,
              ),
              Container(
                height: height * 0.11,
                // width: width * 0.46,
                child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                        Container(
                        height: height*0.09,
                        width: width*0.06,
                        decoration: BoxDecoration(
                            color: Colors.indigo.withOpacity(0.05),
                            borderRadius: BorderRadius.circular(width*0.03),
                        ),
                            child: Padding(
                              padding:  EdgeInsets.all(width*0.01),
                              child: Image(image: AssetImage(a[index]["image1"],),
                              ),
                            )
                      ),
                        ]
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        width: width * 0.03,
                      );
                    },
                    itemCount: a.length),
              ),
              SizedBox(
                height: height*0.02,
              ),
              Container(
                height: height * 0.07,
                width: width * 0.26,
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(width * 0.03)),
                child: TabBar(
                  splashBorderRadius:BorderRadius.circular(width*0.03),
                    indicatorColor: Colors.transparent,
                    labelColor: CupertinoColors.white,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicator: BoxDecoration(
                        color: colorConst.blue,
                        borderRadius: BorderRadius.circular(width*0.03)
                    ),
                    dividerColor: Colors.transparent,
                    labelStyle: TextStyle(
                        color: Colors.white,
                        fontSize: width*0.015,
                        fontWeight: FontWeight.w500
                    ),
                    unselectedLabelStyle: TextStyle(
                        color: Colors.black,
                        fontSize: width*0.015,
                        fontWeight: FontWeight.w400
                    ),
                    onTap: (value) {

                    },
                    tabs: [
                      Tab(
                        child: Center(
                            child: LocaleText(
                          "Local",

                        )),
                      ),
                      Tab(
                        child: Center(
                            child: LocaleText("International",
                                // style: TextStyle(fontSize: width * 0.033)
                            )),
                      ),
                    ]),
              ),
              SizedBox(
                height: height * 0.035,
              ),
              Flexible(
                child: Container(
                  child: TabBarView(
                    children: [
                    Container(
                      child: local(
                        data:data
                      ),
                    ),
                    Container(
                      child: international(
                        data:interlist
                      ),
                    ),
                  ],
                    physics: BouncingScrollPhysics(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    )
        :DefaultTabController(
      length: 2,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          scrolledUnderElevation: 0,
          backgroundColor: Colors.white,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage(ImageConst.plexpay),
                width: width * 0.23,
              ),
              Row(
                children: [
                  LocaleText(
                    "WALLET :",
                    style: TextStyle(fontSize: width * 0.029, color: Colors.black),
                  ),
                  SizedBox(
                    width: width*0.01,
                  ),
                  Text(
                    wallet_amount != null ? wallet_amount.toString() : "",
                    style: TextStyle(fontSize: width * 0.029, color: Colors.black),
                  )
                ],
              ),
            ],
          ),
          actions: [
            Row(
              children: [
                InkWell(
                  borderRadius: BorderRadius.circular(width*0.06),
                  splashColor: colorConst.blue,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Notifications(),
                        ));
                  },
                  child: CircleAvatar(
                    radius: width*0.04,
                    backgroundColor: Colors.transparent,
                    child: Icon(
                      Icons.notifications_rounded,
                      color: colorConst.blue,
                      size: width*0.065,
                    ),
                  )
                ),
                SizedBox(
                  width: width * 0.01,
                ),
                InkWell(
                    borderRadius: BorderRadius.circular(width*0.06),
                    splashColor: colorConst.blue,
                    onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => profile(
                          ),
                        ));
                  },
                  child: CircleAvatar(
                    radius: width*0.05,
                    backgroundColor: Colors.transparent,
                    child: Icon(
                      CupertinoIcons.person_circle_fill,
                      color: colorConst.blue,
                      size: width*0.08,
                    ),
                  )
                ),
              ],
            ),
            SizedBox(
              width: width * 0.03,
            )
          ],
        ),
        body:isCatLoading?Container(
          child: Padding(
            padding:  EdgeInsets.all(width*0.03),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  gap,
                  Center(
                    child: Shimmer.fromColors(
                      baseColor: Colors.grey.shade100,
                      highlightColor: Colors.white,
                      direction: ShimmerDirection.ltr,
                      period: Duration(seconds: 1),
                      enabled: true,
                      child: Container(
                        height: height * 0.13,
                        width: width * 0.93,
                        decoration: BoxDecoration(
                            color: colorConst.lightgrey1,
                            borderRadius: BorderRadius.circular(width * 0.03))
                      ),
                    ),
                  ),
                  gap,
                  SizedBox(
                    height: width*0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // SizedBox(width: width*0.06,),
                      Container(
                        height: width * 0.18,
                        width: width * 0.82,
                        child: ListView.separated(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Column(
                                  children: [
                                    Shimmer.fromColors(
                                      baseColor: Colors.grey.shade100,
                                      highlightColor: Colors.white,
                                      direction: ShimmerDirection.btt,
                                      enabled: true,
                                      child: Container(
                                          height: width*0.14,
                                          width: width*0.14,
                                          decoration: BoxDecoration(
                                            color: CupertinoColors.systemGrey4,
                                            borderRadius: BorderRadius.circular(width*0.03),
                                          ),
                                      ),
                                    ),
                                  ]
                              );
                            },
                            separatorBuilder: (context, index) {
                              return SizedBox(
                                width: width * 0.03,
                              );
                            },
                            itemCount: 5),
                      )
                    ],
                  ),
                  Shimmer.fromColors(
                    baseColor: Colors.grey.shade100,
                    highlightColor: Colors.white,
                    direction: ShimmerDirection.btt,
                    enabled: true,
                    child: Container(
                      height: width * 0.125,
                      width: width * 0.56,
                      decoration: BoxDecoration(
                          color: CupertinoColors.systemGrey4,
                          borderRadius: BorderRadius.circular(width * 0.03)),
                    ),
                  ),
                  SizedBox(
                    height: width * 0.03,
                  ),
                  Container(
                    height: width*0.15,
                    width: width*1,
                    child: ListView.separated(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Shimmer.fromColors(
                                baseColor: Colors.grey.shade100,
                                highlightColor: Colors.white,
                                direction: ShimmerDirection.btt,
                                enabled: true,
                                child: Container(
                                  height: width*0.088,
                                  width: width*0.25,
                                  margin: EdgeInsets.only(left: width*0.035),
                                  decoration: BoxDecoration(
                                      color:  Colors.grey.shade100,
                                      borderRadius: BorderRadius.circular(width*0.03)
                                  ),
                                ),
                              )
                            ],
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                              width:width*0.01
                          );
                        },
                        itemCount: 4
                    ),
                  ),
                  Container(
                    height: width*1.3,
                    child: GridView.builder(
                      itemCount: 12,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 0.9,
                          crossAxisSpacing: width*0.01,
                          mainAxisSpacing: width*0.01,
                          crossAxisCount: 4),
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Shimmer.fromColors(
                              baseColor: Colors.grey.shade100,
                              highlightColor: Colors.white,
                              direction: ShimmerDirection.btt,
                              enabled: true,
                              child: Container(
                                height: width*0.17,
                                width: width*0.17,
                                decoration: BoxDecoration(
                                  // color: Colors.blue,
                                    borderRadius: BorderRadius.circular(width * 0.03),
                                  color: Colors.grey.shade100,
                                    ),
                                // child: Image.asset(images[index]["image1"],fit: BoxFit.fill,),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  )

                ],
              ),
            ),
          ),
        ):
        Padding(
          padding:  EdgeInsets.all(width*0.02),
          child: Column(
            children: [
              gap,
              Center(
                child: Container(
                  height: height * 0.13,
                  width: width * 0.93,
                  decoration: BoxDecoration(
                      color: colorConst.blue,
                      borderRadius: BorderRadius.circular(width * 0.03)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          LocaleText(
                            "Free Vouchers",
                            style: TextStyle(
                                // softWrap: true, // Allows text to wrap to the next line
                                // maxLines: null, // Allows unlimited lines
                                overflow: TextOverflow.visible,
                                fontSize: width*0.068, color: Colors.white),
                          ),
                          LocaleText(
                            "Tap here to claim your free discount vouchers",
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                                fontSize: width * 0.027, color: Colors.white),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: width*0.02,
                      ),
                      Row(
                        children: [
                          Text(
                            "0",
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: width*0.15,
                            )
                          ),
                          Text(
                            "%",
                            style: GoogleFonts.poppins(
                                fontSize: width * 0.12,
                                color: Colors.lightBlue.shade200),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              gap,
              SizedBox(
                height: height*0.01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // SizedBox(width: width*0.06,),
                  Container(
                    height: height * 0.09,
                    width: width * 0.82,
                    child: ListView.separated(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                            Container(
                            height: height*0.07,
                            width: width*0.14,
                            decoration: BoxDecoration(
                                color: Colors.indigo.withOpacity(0.05),
                                borderRadius: BorderRadius.circular(width*0.03),
                            ),
                                child: Padding(
                                  padding:  EdgeInsets.all(width*0.03),
                                  child: Image(image: AssetImage(a[index]["image1"],),
                                  ),
                                )
                          ),
                            ]
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            width: width * 0.03,
                          );
                        },
                        itemCount: a.length),
                  )
                ],
              ),
              Container(
                height: height * 0.052,
                width: width * 0.56,
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(width * 0.03)),
                child: TabBar(
                  splashBorderRadius:BorderRadius.circular(width*0.03),
                    indicatorColor: Colors.transparent,
                    labelColor: CupertinoColors.white,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicator: BoxDecoration(
                        color: colorConst.blue,
                        borderRadius: BorderRadius.circular(width*0.03)
                    ),
                    dividerColor: Colors.transparent,
                    labelStyle: TextStyle(
                        color: Colors.white,
                        fontSize: width*0.033,
                        fontWeight: FontWeight.w500
                    ),
                    unselectedLabelStyle: TextStyle(
                        color: Colors.black,
                        fontSize: width*0.03,
                        fontWeight: FontWeight.w400
                    ),
                    onTap: (value) {

                    },
                    tabs: [
                      Tab(
                        child: Center(
                            child: LocaleText(
                          "Local",
                          style: TextStyle(fontSize: width * 0.04),
                        )),
                      ),
                      Tab(
                        child: Center(
                            child: LocaleText("International",
                                // style: TextStyle(fontSize: width * 0.033)
                            )),
                      ),
                    ]),
              ),
              SizedBox(
                height: height * 0.035,
              ),
              Flexible(
                child: Container(
                  child: TabBarView(
                    children: [
                    Container(
                      child: local(
                        data:data
                      ),
                    ),
                    Container(
                      child: international(
                        data:interlist
                      ),
                    ),
                  ],
                    physics: BouncingScrollPhysics(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
