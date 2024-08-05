import 'package:flutter/material.dart';
import 'package:plexpay/featurs/details%20adding/Const/NetWork.dart';
import 'package:plexpay/featurs/details%20adding/screen/page1.dart';

import '../../../main.dart';
import 'du_Tab.dart';
import 'etisalat_Tab.dart';
import 'imageConst.dart';

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

  List page = [
    Etisalat1(),
    duTab(),
    page1(),
    page1(),
    page1(),
    page1(),
    page1(),
    page1(),
    page1(),
    page1(),
    page1(),
    page1(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            height: width * 0.035,
          ),
          Expanded(
            child: GridView.builder(
              itemCount: images.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 0.73,
                  crossAxisSpacing: 17,
                  mainAxisSpacing: 15,
                  crossAxisCount: 4),
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => page[index],
                            ));
                      },
                      child: Container(
                        height: 71.02,
                        width: 100,
                        decoration: BoxDecoration(
                            // color: Colors.blue,
                            borderRadius: BorderRadius.circular(width * 0.04),
                            border: Border.all(width: width * 0.0001),
                            image: DecorationImage(
                                image: AssetImage(images[index]["image1"]))),
                        // child: Image.asset(images[index]["image1"],fit: BoxFit.fill,),
                      ),
                    ),
                    SizedBox(
                      height: width * 0.015,
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
