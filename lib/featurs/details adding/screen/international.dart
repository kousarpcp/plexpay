import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:plexpay/Const/colorConst.dart';
import 'package:plexpay/Const/widgets.dart';
import 'package:plexpay/featurs/details%20adding/screen/country_field.dart';
import 'package:plexpay/featurs/details%20adding/screen/voucher/voucher_country_select.dart';

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
      body: Column(
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
            height: width*0.7,
            child: GridView.builder(
              itemCount: data != null ? data.length : 0,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
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
          gap,
          InkWell(
            onTap: () {
              Navigator.push(context,MaterialPageRoute(builder: (context) => VoucherCountry(),));
            },
            child: Container(
              height: width*0.13,
              margin: EdgeInsets.all(width*0.05),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(width*0.03),
                color: colorConst.blue,
              ),
              child: Center(
                child: Text("Voucher",style: TextStyle(
                  color: Colors.white,
                  fontSize: width*0.04,
                ),),
              ),
            ),
          )
        ],
      ),
    );
  }
}
