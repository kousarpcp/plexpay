import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plexpay/Const/colorConst.dart';
import 'package:plexpay/Const/widgets.dart';
import 'package:plexpay/featurs/details%20adding/screen/Notification.dart';
import 'package:plexpay/Const/imageConst.dart';
import 'package:plexpay/featurs/details%20adding/screen/international.dart';
import 'package:plexpay/featurs/details%20adding/screen/local.dart';
import 'package:plexpay/featurs/details%20adding/screen/profile.dart';

import '../../../main.dart';

class home_page extends StatefulWidget {
  const home_page({super.key});

  @override
  State<home_page> createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {

  var isLoading = true;



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

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          scrolledUnderElevation: 0,
          backgroundColor: Colors.white,
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage(ImageConst.plexpay),
                width: width * 0.23,
              ),
              Text(
                "WALLET : 400 AED",
                style: TextStyle(fontSize: width * 0.029, color: Colors.black),
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
                          builder: (context) => profile(),
                        ));
                  },
                  child: CircleAvatar(
                    radius: width*0.05,
                    backgroundColor: Colors.transparent,
                    child: Icon(
                      CupertinoIcons.person_circle_fill,
                      color: colorConst.blue,
                      size: width*0.065,
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
        body:
        SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                gap,
                Center(
                  child: Container(
                    height: width * 0.26,
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
                              Container(
                              height: width*0.14,
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
                  height: width * 0.125,
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
                  height: width * 0.03,
                ),
                SizedBox(
                  height: height*0.482,
                  child: TabBarView(children: [
                    local(),
                    international(),
                  ],
                    physics: BouncingScrollPhysics(),

                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
