import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
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
      body: Column(
        children: [
          SizedBox(
            height: width * 0.02,
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => countryField(
                      initialCountryCode: "",
                    ),
                  ));
            },
            child: Stack(
              children: [
                Container(
                  height: width * 0.13,
                  width: width * 0.82,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black12),
                      borderRadius: BorderRadius.circular(width * 0.03)),
                ),
                Positioned(
                  right: width * 0.0,
                  child: Container(
                    height: width * 0.13,
                    width: width * 0.14,
                    child: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    decoration: BoxDecoration(
                        color: Colors.indigoAccent,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(width * 0.03),
                            bottomRight: Radius.circular(width * 0.03))),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: width * 0.02,
          ),
          Expanded(
            child: GridView.builder(
              itemCount: Country.length,
              shrinkWrap: true,
              physics: BouncingScrollPhysics(
                  decelerationRate: ScrollDecelerationRate.fast),
              scrollDirection: Axis.vertical,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 0.80,
                  crossAxisSpacing: 17,
                  mainAxisSpacing: 2,
                  crossAxisCount: 4),
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => countryField(
                                initialCountryCode: Country[index]["code"]!,
                              ),
                            ));
                      },
                      child: Container(
                        height: 65.02,
                        width: 65,
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
          )
        ],
      ),
    );
  }
}
