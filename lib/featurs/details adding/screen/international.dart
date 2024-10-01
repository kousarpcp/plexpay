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
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          child: Wrap(
            runSpacing: height*0.02,
            children: [
              TextField(),
              Countries(),
              IntVouchers()
            ],
          ),
        ),
      ),
    );
  }
  Widget TextField (){
    return MediaQuery.of(context).size.width > 650? InkWell(
        onTap: () {
          Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (context) => countryField(
                  dash: "1",
                ),
              ));
        },
        child: Center(
          child: Container(
              height: height * 0.1,
              width: width*0.94,
              decoration: BoxDecoration(
                  color: colorConst.lightgrey1,
                  borderRadius: BorderRadius.circular(width*0.03)),
              child: Padding(
                padding:  EdgeInsets.all(width*0.01),
                child: Row(
                  children: [
                    Icon(Icons.search_rounded,size: width*0.03,),
                    SizedBox(width: width*0.02,),
                    Text("Search",style: TextStyle(
                      fontSize: width * 0.022,
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                    ),)
                  ],
                ),
              )
          ),
        ),
      ):
    InkWell(
      onTap: () {
        Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) => countryField(
                dash: "1",
              ),
            ));
      },
      child: Center(
        child: Container(
            height: height * 0.055,
            width: width*0.9,
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
    );
  }
  Widget Countries(){
    return MediaQuery.of(context).size.width > 650?Container(
        child: Scrollbar(
          child: GridView.builder(
            itemCount: data != null ? data.length : 0,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 0.99,
                crossAxisSpacing: width*0.006,
                mainAxisSpacing: height*0.001,
                crossAxisCount: 8),
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
                      height: width*0.07,
                      width: width*0.07,
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
                    height: height * 0.008,
                  ),
                  Text(
                    item["CountryName"],
                    style: TextStyle(
                        fontWeight: FontWeight.w500, fontSize: width * 0.018),
                  )
                ],
              );
            },
          ),
        ),
      ):Container(
      child: Scrollbar(
        child: GridView.builder(
          itemCount: data != null ? data.length : 0,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 0.99,
              crossAxisSpacing: width*0.01,
              mainAxisSpacing: height*0.007,
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
                    height: height*0.077,
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
                  height: height * 0.008,
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
    );
  }
  Widget IntVouchers(){
    return MediaQuery.of(context).size.width > 650?InkWell(
        onTap: () {
          Navigator.push(context,MaterialPageRoute(builder: (context) => VoucherCountry(),));
        },
        child: Center(
          child: Container(
            height: height*0.1,
            width: width*0.94,
            margin: EdgeInsets.only(bottom: height*0.02),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(width*0.03),
              color: colorConst.blue,
            ),
            child: Center(
              child: Text("Voucher",style: TextStyle(
                color: Colors.white,
                fontSize: width*0.025,
              ),),
            ),
          ),
        ),
      ):InkWell(
      onTap: () {
        Navigator.push(context,MaterialPageRoute(builder: (context) => VoucherCountry(),));
      },
      child: Center(
        child: Container(
          height: height*0.06,
          width: width*0.9,
          margin: EdgeInsets.only(bottom: height*0.02),
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
      ),
    );
  }
}
