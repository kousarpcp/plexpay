import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plexpay/featurs/details%20adding/screen/Notification.dart';
import 'package:plexpay/featurs/details%20adding/screen/imageConst.dart';
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
    {"image1": ImageConst.uae},
    {"image1": ImageConst.oman},
    {"image1": ImageConst.bahrain},
    {"image1": ImageConst.india},
    {"image1": ImageConst.kuwait},
  ];

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
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Notifications(),
                        ));
                  },
                  child: CircleAvatar(
                    radius: width * 0.035,
                    backgroundColor: Colors.white,
                    child: Image.asset(
                      ImageConst.bellicon,
                      width: width * 0.055,
                    ),
                  ),
                ),
                SizedBox(
                  width: width * 0.01,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => profile(),
                        ));
                  },
                  child: CircleAvatar(
                    radius: width * 0.035,
                    backgroundColor: Colors.white,
                    child: Image.asset(
                      ImageConst.contact,
                      width: width * 0.055,
                    ),
                  ),
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
          child: Column(
            children: [
              Center(
                child: Container(
                  height: width * 0.26,
                  width: width * 0.93,
                  decoration: BoxDecoration(
                      color: Colors.indigoAccent,
                      borderRadius: BorderRadius.circular(width * 0.03)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: width * 0.05,
                          ),
                          Text(
                            "Free Vouchers",
                            style: TextStyle(
                                fontSize: width * 0.075, color: Colors.white),
                          ),
                          Text(
                            "Tap here to claim yourfree discount vouchers",
                            style: TextStyle(
                                fontSize: width * 0.03, color: Colors.white),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "0",
                            style: TextStyle(
                                fontSize: width * 0.2, color: Colors.white),
                          ),
                          Text(
                            "%",
                            style: TextStyle(
                                fontSize: width * 0.15,
                                color: Colors.lightBlueAccent),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: width * 0.04,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // SizedBox(width: width*0.06,),
                  Container(
                    height: width * 0.2,
                    width: width * 0.84,
                    child: ListView.separated(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              CircleAvatar(
                                radius: width * 0.072,
                                backgroundColor: Colors.black,
                                backgroundImage: AssetImage(a[index]["image1"]),
                              )
                            ],
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
                height: width * 0.10,
                width: width * 0.56,
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(width * 0.03)),
                child: TabBar(
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.black,
                    indicatorColor: Colors.transparent,
                    dividerColor: Colors.transparent,
                    // indicatorPadding: EdgeInsets.symmetric(horizontal: 2,),
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicator: BoxDecoration(
                        color: Colors.indigoAccent,
                        borderRadius: BorderRadius.circular(width * 0.03)),
                    tabs: [
                      Tab(
                        child: Center(
                            child: Text(
                          "local",
                          style: TextStyle(fontSize: width * 0.06),
                        )),
                      ),
                      Tab(
                        child: Center(
                            child: Text("International",
                                style: TextStyle(fontSize: width * 0.033))),
                      ),
                    ]),
              ),
              SizedBox(
                height: width * 0.03,
              ),
              Container(
                height: width *1.02,
                child: Padding(
                  padding: EdgeInsets.all(width * 0.03),
                  child: TabBarView(children: [
                    local(),
                    international(),
                  ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
