import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:plexpay/Const/colorConst.dart';
import 'package:plexpay/Const/widgets.dart';
import 'package:plexpay/featurs/details%20adding/screen/country_field.dart';

import '../../../main.dart';
import '../../../Const/imageConst.dart';

class international extends StatefulWidget {
  final data;
  const international({super.key, required this.data});

  @override
  State<international> createState() => _internationalState();
}

class _internationalState extends State<international> {
  var data;
  List Country = [
    {
      "image1": ImageConst.india1, "text": "India",
      'code': 'IN',
      "country code":"+91"
    },
    {
      "image1": ImageConst.usa,"text": "USA",
      'code': 'US',
      "country code":"+1"
    },
    {
      "image1": ImageConst.italy,"text": "Italy",
      'code': 'IT',
      "country code":"+41"
    },
    {
      "image1": ImageConst.armenia,"text": "Armenia",
      'code': 'AM',
      "country code":"+374"
    },
    {
      "image1": ImageConst.ecuador,"text": "Ecuador",
      'code': 'EC',
      "country code":"+593"
    },
    {
      "image1": ImageConst.peru,"text": "Peru",
      'code': 'PE',
      "country code":"+51"
    },
    {
      "image1": ImageConst.uruguay,"text": "Uruguay",
      'code': 'UY',
      "country code":"+598"
    },
    {
      "image1": ImageConst.hungary,"text": "Hungary",
      'code': 'HU',
      "country code":"+36"
    },
    {
      "image1": ImageConst.croatia,"text": "Croatia",
      'code': 'HR',
      "country code":"+385"
    },
    {
      "image1": ImageConst.egypt,"text": "Egypt",
      'code': 'EG',
      "country code":"+20"
    },
    {
      "image1": ImageConst.australia,"text": "Australia",
      'code': 'AU',
      "country code":"+61"
    },
    {
      "image1": ImageConst.vietnam,"text": "Vietnam",
      'code': 'VN',
      "country code":"+84"
    },
    {
      "image1": ImageConst.zimbabwe,"text": "Zimbabwe",
      'code': 'ZW',
      "country code":"+263"
    },
    {
      "image1": ImageConst.bolivia,"text": "Bolivia",
      'code': 'BO',
      "country code":"+591"
    },
    {
      "image1": ImageConst.sweden,"text": "Sweden",
      'code': 'SE',
      "country code":"+46"
    },
    {
      "image1": ImageConst.spain,"text": "Spain",
      'code': 'ES',
      "country code":"+34"
    },
    {
      "image1": ImageConst.thailand,"text": "Thailand",
      'code': 'TH',
      "country code":"+66"
    },
    {
      "image1": ImageConst.monaco,"text": "Monaco",
      'code': 'MC',
      "country code":"+377"
    },
    {
      "image1": ImageConst.lebanon,"text": "Lebanon",
      'code': 'LB',
      "country code":"+961"
    },
    {
      "image1": ImageConst.portugal,"text": "Portugal",
      'code': 'PT',
      "country code":"+351"
    },
  ];

  @override
  void initState() {
    data =widget.data;
    // TODO: implement initState
    super.initState();
  }

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
                // final item =  data!= null ? data[index] : null;
                // Navigator.push(
                //     context,
                //     CupertinoPageRoute(
                //       builder: (context) => countryField(
                //           dash: item["topC"],
                //           name: item["CountryName"],
                //           image: item["Cflag"],
                //           code: item["CountryIso"]
                //       ),
                //     ));
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
                itemCount: data != null ? data.length : 0,
                shrinkWrap: true,
                physics: BouncingScrollPhysics(
                    decelerationRate: ScrollDecelerationRate.fast),
                scrollDirection: Axis.vertical,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 0.99,
                    crossAxisSpacing: width*0.01,
                    mainAxisSpacing: width*0.01,
                    crossAxisCount: 4),
                itemBuilder: (context, index) {
                  final item =  data!= null ? data[index] : null;
                  return Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => countryField(
                                  dash: item["topC"],
                                  name: item["CountryName"],
                                  image: item["Cflag"],
                                  code: item["CountryIso"]
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
                                  image: CachedNetworkImageProvider(item['Cflag']),fit:BoxFit.cover)
                          ),
                          // child: Image.asset(images[index]["image1"],fit: BoxFit.fill,),
                        ),
                      ),
                      SizedBox(
                        height: width * 0.01,
                      ),
                      Text(
                        item["CountryName"],
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: width * 0.03),
                      )
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
