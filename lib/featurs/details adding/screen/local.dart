import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plexpay/Const/NetWork.dart';
import 'package:plexpay/Const/colorConst.dart';
import 'package:plexpay/Const/widgets.dart';
import 'package:plexpay/featurs/details%20adding/screen/page1.dart';

import '../../../main.dart';
import 'offer_details.dart';
import '../../../Const/imageConst.dart';

class local extends StatefulWidget {
  const local({super.key});

  @override
  State<local> createState() => _localState();
}

class _localState extends State<local> {
  List images = [
    {"image1": ImageConst.etisalat, "text": "Etisalat UAE"},
    {"image1": ImageConst.du, "text": "DU UAE"},
    {"image1": ImageConst.lebanese, "text": "Lebanese"},
    {"image1": ImageConst.adnoc, "text": "Adnoc"},
    {"image1": ImageConst.kuwaitfinance, "text": " Finance"},
    {"image1": ImageConst.knpc, "text": "KNPC"},
    {"image1": ImageConst.mosaik, "text": "Mosaik"},
    {"image1": ImageConst.netflix, "text": "Netflix"},
    {"image1": ImageConst.ejari, "text": "Ejari"},
    {"image1": ImageConst.kseb, "text": "KSEB"},
    {"image1": ImageConst.jio, "text": "Jio"},
    {"image1": ImageConst.amazone, "text": "Amazon"},

  ];

   List All = [
     {
       "Size":50.0,
       "text":"All",
     },
    {
      "Size":80.0,
      "text":"Prepaid",
    },
    {
      "Size":80.0,
      "text":"Voucher",
    },
    {
      "Size":110.0,
      "text":"Gaming Card",
    },
    {
      "Size":93.0,
      "text":"Electricity",
    },
    {
      "Size":80.0,
      "text":"Gift Card",
    },
    {
      "Size":50.0,
      "text":"DTH",
    },
  ];
  int _selectedIndex = 0;
  bool tap=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
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
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedIndex = index;
                        });
                      },
                      child: Container(
                        height: width*0.088,
                      width: All[index]["Size"],
                      margin: EdgeInsets.only(left: width*0.035),
                      decoration: BoxDecoration(
                        color:  _selectedIndex==index ? colorConst.blue : colorConst.lightgrey1,
                        borderRadius: BorderRadius.circular(width*0.03)
                      ),
                      child: Center(
                        child: Text(
                          All[index]["text"],
                          style: TextStyle(color:_selectedIndex==index ? Colors.white: Colors.black, fontSize: 17.0),
                        ),
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
                itemCount: 6
            ),
          ),
          Expanded(
            child: GridView.builder(
              itemCount: images.length,
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
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => OfferDetails(
                                name:images[index]["text"],
                                image:images[index]["image1"]
                              ),
                            ));
                      },
                      child: Container(
                        height: width*0.17,
                        width: width*0.17,
                        decoration: BoxDecoration(
                            // color: Colors.blue,
                            borderRadius: BorderRadius.circular(width * 0.03),
                            border: Border.all(width: width * 0.0001),
                            image: DecorationImage(
                                image: AssetImage(images[index]["image1"]))),
                        // child: Image.asset(images[index]["image1"],fit: BoxFit.fill,),
                      ),
                    ),
                    SizedBox(
                      height: width * 0.01,
                    ),
                    Text(
                      images[index]["text"],
                      style: TextStyle(
                          fontWeight: FontWeight.w500, fontSize: width * 0.03),
                    )
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
