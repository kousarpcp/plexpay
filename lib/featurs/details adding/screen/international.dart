import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:plexpay/featurs/details%20adding/Const/colorConst.dart';
import 'package:plexpay/featurs/details%20adding/Const/widgets.dart';
import 'package:plexpay/featurs/details%20adding/screen/country_field.dart';

import '../../../main.dart';
import 'imageConst.dart';

class international extends StatefulWidget {
  const international({super.key});

  @override
  State<international> createState() => _internationalState();
}

class _internationalState extends State<international> {
  List Country = [
    {
      "image1": ImageConst.india1,
      'code': 'IN',
    },
    {
      "image1": ImageConst.usa,
      'code': 'US',
    },
    {
      "image1": ImageConst.italy,
      'code': 'IT',
    },
    {
      "image1": ImageConst.armenia,
      'code': 'AM',
    },
    {
      "image1": ImageConst.ecuador,
      'code': 'EC',
    },
    {
      "image1": ImageConst.peru,
      'code': 'PE',
    },
    {
      "image1": ImageConst.uruguay,
      'code': 'UY',
    },
    {
      "image1": ImageConst.hungary,
      'code': 'HU',
    },
    {
      "image1": ImageConst.croatia,
      'code': 'HR',
    },
    {
      "image1": ImageConst.egypt,
      'code': 'EG',
    },
    {
      "image1": ImageConst.australia,
      'code': 'AU',
    },
    {
      "image1": ImageConst.vietnam,
      'code': 'VN',
    },
    {
      "image1": ImageConst.zimbabwe,
      'code': 'ZW',
    },
    {
      "image1": ImageConst.bolivia,
      'code': 'BO',
    },
    {
      "image1": ImageConst.sweden,
      'code': 'SE',
    },
    {
      "image1": ImageConst.spain,
      'code': 'ES',
    },
    {
      "image1": ImageConst.thailand,
      'code': 'TH',
    },
    {
      "image1": ImageConst.monaco,
      'code': 'MC',
    },
    {
      "image1": ImageConst.lebanon,
      'code': 'LB',
    },
    {
      "image1": ImageConst.portugal,
      'code': 'PT',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: width * 0.02,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => countryField(
                        initialCountryCode: "",
                      ),
                    ));
              },
              child: Container(
                  height: height * 0.055,
                  width: width*0.84,
                  decoration: BoxDecoration(
                      color: colorConst.lightgrey1,
                      borderRadius: BorderRadius.circular(width*0.03)),
                  child: Padding(
                    padding: const EdgeInsets.all(9.0),
                    child: Row(
                      children: [
                        Icon(Icons.search_rounded),
                        SizedBox(width: width*0.02,),
                        Text("Search",style: TextStyle(
                          fontSize: width * 0.04,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                        ),)
                      ],
                    ),
                  )
              ),
            ),
            SizedBox(
              height: width * 0.04,
            ),
            Container(
              height: width*1.3,
              child: GridView.builder(
                itemCount: Country.length,
                shrinkWrap: true,
                physics: BouncingScrollPhysics(
                    decelerationRate: ScrollDecelerationRate.fast),
                scrollDirection: Axis.vertical,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 1.1,
                    crossAxisSpacing: width*0.01,
                    mainAxisSpacing: width*0.01,
                    crossAxisCount: 4),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => countryField(
                                  initialCountryCode: Country[index]["code"]!,
                                ),
                              ));
                        },
                        child: Container(
                          height: width*0.16,
                          width: width*0.16,
                          decoration: BoxDecoration(
                              // color: Colors.blue,
                              borderRadius: BorderRadius.circular(width * 0.04),
                              border: Border.all(width: width * 0.0001),
                              image: DecorationImage(
                                  image: AssetImage(Country[index]["image1"]!))),
                          // child: Image.asset(images[index]["image1"],fit: BoxFit.fill,),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
        
          ],
        ),
      ),
    );
  }
}
