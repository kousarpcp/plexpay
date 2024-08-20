
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:plexpay/featurs/details%20adding/screen/BottomNavigation.dart';
import 'package:plexpay/Const/colorConst.dart';
import 'package:plexpay/featurs/details%20adding/screen/costom.dart';
import 'package:plexpay/featurs/details%20adding/screen/offer.dart';

import '../../../main.dart';

import '../../../Const/Snackbar_toast_helper.dart';
import '../../../Const/imageConst.dart';

class OfferDetails extends StatefulWidget {
  const OfferDetails({
    super.key, required this.name, required this.image, required this.code, required this.dash, required this.iso,
  });
  final String name;
  final String image;
  final String code;
  final String iso;
  final String dash;

  @override
  State<OfferDetails> createState() => _OfferDetailsState();
}

class _OfferDetailsState extends State<OfferDetails> {

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
            widget.name,
            style:
                TextStyle(fontSize: width * 0.06, fontWeight: FontWeight.w700),
          ),
          actions: [
            CircleAvatar(
              radius: width*0.045,
                backgroundImage:NetworkImage(widget.image,),
              backgroundColor: Colors.white,
                ),
            SizedBox(width: width*0.05,)],

        ),
        body: Column(
          children: [
            Center(
              child: Container(
                height: width * 0.09,
                width: width * 0.56,
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(width * 0.03)),
                child: TabBar(
                    splashBorderRadius:BorderRadius.circular(width*0.03),
                  physics: BouncingScrollPhysics(),
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.bold
                    ),
                    labelColor: Colors.white,
                    unselectedLabelStyle: TextStyle(
                      fontWeight: FontWeight.w400,
                    ),
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
                              style: TextStyle(fontSize: width * 0.04),
                            )),
                      ),
                      Tab(
                        child: Center(
                            child: Text("Custom",
                                style: TextStyle(fontSize: width * 0.04))),
                      ),
                    ]),
              ),
            ),
            Expanded(
              child: TabBarView(children: [
                offer(
                  name:widget.name,
                  image:widget.image,
                  code:widget.code,
                  dash:widget.dash,
                  iso:widget.iso

                ),
                custom(
                  name:widget.name,
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
