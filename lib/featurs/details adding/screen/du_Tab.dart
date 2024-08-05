
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:plexpay/featurs/details%20adding/screen/BottomNavigation.dart';
import 'package:plexpay/featurs/details%20adding/screen/colorConst.dart';
import 'package:plexpay/featurs/details%20adding/screen/etisalat_custom.dart';
import 'package:plexpay/featurs/details%20adding/screen/etisalat_offer.dart';

import '../../../main.dart';
import '../Api/FetchCountryCodeApi.dart';
import '../Api/PlansByNumberApi.dart';
import '../Const/SharedPref.dart';
import '../Const/Snackbar_toast_helper.dart';
import 'imageConst.dart';

class duTab extends StatefulWidget {
  const duTab({
    super.key,
  });

  @override
  State<duTab> createState() => _duTabState();
}

class _duTabState extends State<duTab> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          scrolledUnderElevation: 0,
          elevation: 0,
          backgroundColor: Colors.white,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) =>BottomNavigation()));
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
            "DU UAE",
            style:
            TextStyle(fontSize: width * 0.06, fontWeight: FontWeight.w800),
          ),
          actions: [Image.asset(ImageConst.du,width: width*0.077,),SizedBox(width: width*0.07,)],

        ),
        body: Column(
          children: [
            Center(
              child: Container(
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
                        color: colorConst.blue,
                        borderRadius: BorderRadius.circular(width * 0.03)),
                    tabs: [
                      Tab(
                        child: Center(
                            child: Text(
                              "Offer",
                              style: TextStyle(fontSize: width * 0.05),
                            )),
                      ),
                      Tab(
                        child: Center(
                            child: Text("Custom",
                                style: TextStyle(fontSize: width * 0.05))),
                      ),
                    ]),
              ),
            ),
            Expanded(
              child: TabBarView(children: [
                offer(),
                custom(),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
