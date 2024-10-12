import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:plexpay/Const/NetWork.dart';
import 'package:plexpay/Const/colorConst.dart';
import 'package:plexpay/Const/widgets.dart';

import 'package:plexpay/featurs/details%20adding/screen/page1.dart';

import '../../../main.dart';
import 'electricity_bill_payment/electricity_homepage.dart';
import 'offer_details.dart';
import '../../../Const/imageConst.dart';

class local extends StatefulWidget {
  final data;
  final prepaid;
  const local({super.key, required this.data, this.prepaid});

  @override
  State<local> createState() => _localState();
}

class _localState extends State<local> {
  var dataList =[];
  var isCatLoading = false;
  List<Map<String, dynamic>> prepaidCategory = [];
  List<Map<String, dynamic>> voucherCategory = [];
  List<Map<String, dynamic>> voucherAE = [];
  List<Map<String, dynamic>> gamingCategory = [];
  List<Map<String, dynamic>> electricityCategory = [];
  List<Map<String, dynamic>> giftCategory = [];
  List<Map<String, dynamic>> dthCategory = [];
  List<Map<String, dynamic>> items = [];
  List<Map<String, dynamic>> products = [];



   List All = [
     {
       "Size":width*0.15,
       "text":"All",
     },
    {
      "Size":width*0.25,
      "text":"Prepaid",
    },
    {
      "Size":width*0.3,
      "text":"Voucher",
    },
    {
      "Size":width*0.3,
      "text":"Gaming Card",
    },
    {
      "Size":width*0.34,
      "text":"Electricity",
    },
    {
      "Size":width*0.32,
      "text":"Gift Card",
    },
    {
      "Size":width*0.2,
      "text":"DTH",
    },
  ];
  List All2 = [
    {
      "Size":width*0.07,
      "text":"All",
    },
    {
      "Size":width*0.11,
      "text":"Prepaid",
    },
    {
      "Size":width*0.11,
      "text":"Voucher",
    },
    {
      "Size":width*0.14,
      "text":"Gaming Card",
    },
    {
      "Size":width*0.15,
      "text":"Electricity",
    },
    {
      "Size":width*0.13,
      "text":"Gift Card",
    },
    {
      "Size":width*0.07,
      "text":"DTH",
    },
  ];
  List Vouchers=[];
  List AllTab = [
    {
      "Size":width*0.12,
      "text":"All",
    },
    {
      "Size":width*0.21,
      "text":"Prepaid",
    },
    {
      "Size":width*0.22,
      "text":"Voucher",
    },
    {
      "Size":width*0.26,
      "text":"Gaming Card",
    },
    {
      "Size":width*0.24,
      "text":"Electricity",
    },
    {
      "Size":width*0.23,
      "text":"Gift Card",
    },
    {
      "Size":width*0.14,
      "text":"DTH",
    },
  ];

  int _selectedIndex = 0;
  bool tap=false;
  @override
  void initState() {
    getData();
    // TODO: implement initState
    super.initState();
  }

  selectItem(index){
    if(items[index]["type"]=="Prepaid"){
      Navigator.push(context, CupertinoPageRoute(builder: (context) => OfferDetails(
          name: items[index]["subcategory"],
          image: items[index]["sub_cat_logo"],
          code:items[index]["ProviderCode"],
          dash:items[index]["dash"],
          iso:items[index]["CountryIso"]
      ),));
    }
    if(items[index]["type"]=="Vouchers"){

    }
    if(items[index]["type"]=="Gaming Card"){
      Navigator.push(context, MaterialPageRoute(builder: (context) => OfferDetails(
          name: items[index]["subcategory"],
          image: items[index]["sub_cat_logo"],
          code:items[index]["ProviderCode"],
          voucher:"1",
          dash: items[index]["dash"],
          iso:items[index]["CountryIso"]
      ),));
    }
    if(items[index]["type"]=="Electricity"){
      Navigator.push(context, CupertinoPageRoute(builder: (context) => ElcHome(
        iso:items[index]["CountryIso"],
        code:items[index]["ProviderCode"]!=null?items[index]["ProviderCode"]:"",
        dash:items[index]["dash"],
        image: items[index]["sub_cat_logo"],
        name: items[index]["subcategory"],
      ),));
    }
    if(items[index]["type"]=="DTH"){
      Navigator.push(context, MaterialPageRoute(builder: (context) => OfferDetails(
        code: items[index]['ProviderCode'].toString(),
        name: items[index]['subcategory'].toString(),
        iso: items[index]['CountryIso'].toString(),
        dash: items[index]['dash'].toString(),
        image: items[index]['sub_cat_logo'].toString(),
      ),));
    }
    if(items[index]["type"]=="Gift Card"){
      Navigator.push(context, CupertinoPageRoute(builder: (context) => OfferDetails(
          name: items[index]["subcategory"],
          image: items[index]["sub_cat_logo"],
          code:items[index]["ProviderCode"],
          voucher:"1",
          dash: items[index]["dash"],
          iso:items[index]["CountryIso"]!=null?items[index]["CountryIso"]:""
      )));
    }
  }
  Future<String> getData()async{
    setState(() {
      isCatLoading = true;
    });
    if(widget.data!=null){
      dataList = widget.data;
    }

    // for(var all in dataList){
    //   if(all is List){
    //     for(var product in all){
    //       if(product["type"] =="DTH"){
    //         products.add(product);
    //       }
    //     }
    //   }
    // }
    for (var category in dataList) {
      if (category is List) {
        for (var item in category) {
          if(item!=""){
            items.add(item);
          }
          if (item['Categoryname'] == 'Prepaid') {
            prepaidCategory.add(item);
          }
          if (item['Categoryname'] == 'Voucher' || item['Categoryname'] == 'United Arab Emirates') {
            voucherCategory.add(item);
          }
          // if (item['Categoryname'] == "United Arab Emirates") {
          //   voucherCategory.add(item);
          // }
          if (item['Categoryname'] == 'Gaming Card') {
            gamingCategory.add(item);
          }
          if (item['Categoryname'] == 'Electricity') {
            electricityCategory.add(item);
          }
          if (item['Categoryname'] == 'Gift Card') {
            giftCategory.add(item);
          }
          if (item['Categoryname'] == 'DTH') {
            dthCategory.add(item);
          }
        }
      }
    }


    print(voucherCategory);
    // print(dataList);
    print(prepaidCategory);
    print("hhhhhhhhhhhh");
    setState(() {
      isCatLoading = false;
    });
    return " ";
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: isCatLoading?Container(
        child: Center(child: CircularProgressIndicator(
          color: colorConst.blue,
        )),
      ):SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          child: Wrap(
            runSpacing: height*0.02,
            children: [
              tab(),
              _selectedIndex==6? DTH():SizedBox(),
              _selectedIndex==5? Gift():SizedBox(),
              _selectedIndex==4? Electricity():SizedBox(),
              _selectedIndex==3? Gaming():SizedBox(),
              _selectedIndex==2? Voucher():SizedBox(),
              _selectedIndex==1? Prepaid():SizedBox(),
              _selectedIndex==0? AllProviders():SizedBox()
            ],
          ),
        ),
      ),
    );

  }
  Widget tab(){
    return MediaQuery.of(context).size.width > 650? Container(
      height: height*0.07,
      width: width*2,
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
                    height: height*0.06,
                    width: All2[index]["Size"],
                    margin: EdgeInsets.only(left: width*0.015),
                    decoration: BoxDecoration(
                        color:  _selectedIndex==index ? colorConst.blue : colorConst.lightgrey1,
                        borderRadius: BorderRadius.circular(width*0.01)
                    ),
                    child: Center(
                      child: LocaleText(
                        All2[index]["text"],
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color:_selectedIndex==index ? Colors.white: Colors.black, fontSize: width*0.015),
                      ),
                    ),
                  ),
                )
              ],
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(
                width:width*0.005
            );
          },
          itemCount: All2.length
      ),
    ):Container(
      height: height*0.04,
      width: width*2,
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
                    height: height*0.04,
                    width: MediaQuery.of(context).size.width > 600?AllTab[index]["Size"]:All[index]["Size"],
                    margin: EdgeInsets.only(left: width*0.03),
                    decoration: BoxDecoration(
                        color:  _selectedIndex==index ? colorConst.blue : colorConst.lightgrey1,
                        borderRadius: BorderRadius.circular(width*0.03)
                    ),
                    child: Center(
                      child: LocaleText(
                        All[index]["text"],
                        overflow: TextOverflow.ellipsis,
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
          itemCount: All.length
      ),
    );
  }
  Widget AllProviders(){
    return MediaQuery.of(context).size.width > 650?
    Column(
      children: [
        Container(
          child: GridView.builder(
            itemCount: items.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 0.9,
                crossAxisSpacing: width*0.01,
                mainAxisSpacing: width*0.01,
                crossAxisCount: 8),
            itemBuilder: (context, index) {
              return Column(
                children: [
                  GestureDetector(
                    onTap: () {

                      selectItem(index);

                    },
                    child: Container(
                      height: width*0.07,
                      width: width*0.07,
                      decoration: BoxDecoration(
                        // color: Colors.blue,
                          borderRadius: BorderRadius.circular(width * 0.01),
                          image: DecorationImage(
                              image: NetworkImage(items[index]["sub_cat_logo"]),fit: BoxFit.cover)),
                      // child: Image.asset(images[index]["image1"],fit: BoxFit.fill,),
                    ),
                  ),
                  SizedBox(
                    height: width * 0.01,
                  ),
                  Text(
                    items[index]["subcategory"],
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontWeight: FontWeight.w500, fontSize: width * 0.015),
                  )
                ],
              );
            },
          ),
        ),
      ],
    ):
    Column(
      children: [
        Container(
          child: GridView.builder(
            itemCount: items.length,
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

                      selectItem(index);

                    },
                    child: Container(
                      height: width*0.17,
                      width: width*0.17,
                      decoration: BoxDecoration(
                        // color: Colors.blue,
                          borderRadius: BorderRadius.circular(width * 0.03),
                          image: DecorationImage(
                              image: NetworkImage(items[index]["sub_cat_logo"]),fit: BoxFit.cover)),
                      // child: Image.asset(images[index]["image1"],fit: BoxFit.fill,),
                    ),
                  ),
                  SizedBox(
                    height: width * 0.01,
                  ),
                  Text(
                    items[index]["subcategory"],
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontWeight: FontWeight.w500, fontSize: width * 0.03),
                  )
                ],
              );
            },
          ),
        ),
      ],
    );
  }
  Widget Prepaid (){
    return MediaQuery.of(context).size.width > 650?
    Column(
      children: [
        Row(
          children: [
            SizedBox(width: width*0.03),
            LocaleText("Prepaid",style: TextStyle(fontSize:width*0.025,fontWeight: FontWeight.w700),),
          ],
        ),
        SizedBox(height: height*0.01,),
        Center(
          child: GridView.builder(
            itemCount: prepaidCategory.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 1.07,
                crossAxisSpacing: width*0.01,
                mainAxisSpacing: width*0.01,
                crossAxisCount: 4),
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(context, CupertinoPageRoute(builder: (context) => OfferDetails(
                              name: prepaidCategory[index]["subcategory"],
                              image: prepaidCategory[index]["sub_cat_logo"],
                            code:prepaidCategory[index]["ProviderCode"],
                            dash:prepaidCategory[index]["dash"],
                            iso:prepaidCategory[index]["CountryIso"]
                          ),));
                        },
                        child: Container(
                          height: height*0.3,
                          width: width*0.18,
                          decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                            image: DecorationImage(image: NetworkImage(prepaidCategory[index]["sub_cat_logo"]),fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(width*0.01)
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: width*0.01,),
                  Text(prepaidCategory[index]["subcategory"],style: TextStyle(fontSize: width*0.02),)
                ],
              );
            },
          ),
        )
      ],
    ):
    Column(
      children: [
        Row(
          children: [
            SizedBox(width: width*0.05,),
            LocaleText("Prepaid",style: TextStyle(fontSize:width*0.06,fontWeight: FontWeight.w700),),
          ],
        ),
        SizedBox(height: height*0.01,),
        GridView.builder(
          itemCount: prepaidCategory.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio:MediaQuery.of(context).size.width > 600?1:1.07,
              crossAxisSpacing: width*0.01,
              mainAxisSpacing: width*0.01,
              crossAxisCount:  MediaQuery.of(context).size.width > 600?3:2),
          itemBuilder: (context, index) {
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(context, CupertinoPageRoute(builder: (context) => OfferDetails(
                            name: prepaidCategory[index]["subcategory"],
                            image: prepaidCategory[index]["sub_cat_logo"],
                          code:prepaidCategory[index]["ProviderCode"],
                          dash:prepaidCategory[index]["dash"],
                          iso:prepaidCategory[index]["CountryIso"]
                        ),));
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.width > 600?height*0.14:height*0.172,
                        width: MediaQuery.of(context).size.width > 600?width*0.22:width*0.37,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                          image: DecorationImage(image: NetworkImage(prepaidCategory[index]["sub_cat_logo"]),fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(width*0.03)
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: height*0.01,),
                Text(prepaidCategory[index]["subcategory"],style: TextStyle(fontSize:MediaQuery.of(context).size.width > 600?width*0.03: width*0.04),)
              ],
            );
          },
        )
      ],
    );
  }
  Widget Voucher (){
    return MediaQuery.of(context).size.width > 650?
      Column(
      children: [
        Row(
          children: [
            SizedBox(width: width*0.03,),
            LocaleText("Voucher",style: TextStyle(fontSize:width*0.025,fontWeight: FontWeight.w700),),
          ],
        ),
        SizedBox(
          height: height*0.01,
        ),
        GridView.builder(
          itemCount: voucherCategory.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 1.07,
              crossAxisSpacing: width*0.01,
              mainAxisSpacing: width*0.01,
              crossAxisCount: 4),
          itemBuilder: (context, index) {
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: height*0.3,
                      width: width*0.18,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          image: DecorationImage(image: NetworkImage(voucherCategory[index]["sub_cat_logo"]),fit: BoxFit.fill),
                          borderRadius: BorderRadius.circular(width*0.01)
                      ),
                    ),
                  ],
                ),
                SizedBox(height: height*0.01,),
                Text(voucherCategory[index]["subcategory"],style: TextStyle(fontSize: width*0.02),overflow: TextOverflow.ellipsis,)
              ],
            );
          },
        )
      ],
    ):
      Column(
      children: [
        Row(
          children: [
            SizedBox(width: width*0.05,),
            LocaleText("Voucher",style: TextStyle(fontSize:width*0.06,fontWeight: FontWeight.w700),),
          ],
        ),
        SizedBox(
          height: width*0.013,
        ),
        Container(

          child: GridView.builder(
            itemCount: voucherCategory.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio:MediaQuery.of(context).size.width > 600?1:0.95,
                crossAxisSpacing: width*0.01,
                mainAxisSpacing: width*0.01,
                crossAxisCount: MediaQuery.of(context).size.width > 600?3:2),
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.width > 600?height*0.14:height*0.172,
                        width: MediaQuery.of(context).size.width > 600?width*0.22:width*0.37,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            image: DecorationImage(image: NetworkImage(voucherCategory[index]["sub_cat_logo"]),fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(width*0.03)
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: width*0.01,),
                  Text(voucherCategory[index]["subcategory"],style: TextStyle(fontSize:MediaQuery.of(context).size.width > 600?width*0.03: width*0.04),textAlign:
                    TextAlign.center,)
                ],
              );
            },
          ),
        )
      ],
    );
  }
  Widget Gaming  (){
    return MediaQuery.of(context).size.width > 650?
    Column(
      children: [
        Row(
          children: [
            SizedBox(width: width*0.03,),
            LocaleText("Gaming Card",style: TextStyle(fontSize:width*0.025,fontWeight: FontWeight.w700),),
          ],
        ),
        SizedBox(
          height: height*0.01,
        ),
        GridView.builder(
          itemCount: gamingCategory.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 1.07,
              crossAxisSpacing: width*0.01,
              mainAxisSpacing: width*0.01,
              crossAxisCount: 4),
          itemBuilder: (context, index) {
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => OfferDetails(
                            name: gamingCategory[index]["subcategory"],
                            image: gamingCategory[index]["sub_cat_logo"],
                            code:gamingCategory[index]["ProviderCode"],
                            voucher:"1",
                            dash: gamingCategory[index]["dash"],
                            iso:gamingCategory[index]["CountryIso"]
                        ),));
                      },
                      child: Container(
                        height: height*0.3,

                        width: width*0.18,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            image: DecorationImage(image: NetworkImage(gamingCategory[index]["sub_cat_logo"]),fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(width*0.01)
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: height*0.01,),
                Expanded(child: Text(gamingCategory[index]["subcategory"],style: TextStyle(fontSize: width*0.02),textAlign: TextAlign.center,))
              ],
            );
          },
        )
      ],
    ):
    Column(
      children: [
        Row(
          children: [
            SizedBox(width: width*0.05,),
            LocaleText("Gaming Card",style: TextStyle(fontSize:width*0.06,fontWeight: FontWeight.w700),),
          ],
        ),
        SizedBox(
          height: width*0.013,
        ),
        GridView.builder(
          itemCount: gamingCategory.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio:MediaQuery.of(context).size.width > 600?1:1.07,
              crossAxisSpacing: width*0.01,
              mainAxisSpacing: width*0.01,
              crossAxisCount: MediaQuery.of(context).size.width > 600?3:2),
          itemBuilder: (context, index) {
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => OfferDetails(
                            name: gamingCategory[index]["subcategory"],
                            image: gamingCategory[index]["sub_cat_logo"],
                            code:gamingCategory[index]["ProviderCode"],
                            voucher:"1",
                            dash: gamingCategory[index]["dash"],
                            iso:gamingCategory[index]["CountryIso"]
                        ),));
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.width > 600?height*0.14:height*0.172,
                        width: MediaQuery.of(context).size.width > 600?width*0.22:width*0.37,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            image: DecorationImage(image: NetworkImage(gamingCategory[index]["sub_cat_logo"]),fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(width*0.03)
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: width*0.01,),
                Expanded(child: Text(gamingCategory[index]["subcategory"],style: TextStyle(fontSize:MediaQuery.of(context).size.width > 600?width*0.03: width*0.04),textAlign:
            TextAlign.center)),
              ],
            );
          },
        )
      ],
    );
  }
  Widget Electricity (){
    return MediaQuery.of(context).size.width > 650?
    Column(
      children: [
        Row(
          children: [
            SizedBox(width: width*0.03,),
            LocaleText("Electricity",style: TextStyle(fontSize:width*0.025,fontWeight: FontWeight.w700),),
          ],
        ),
        SizedBox(
          height: height*0.01,
        ),
        GridView.builder(
          itemCount: electricityCategory.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 1.07,
              crossAxisSpacing: width*0.01,
              mainAxisSpacing: width*0.01,
              crossAxisCount: 4),
          itemBuilder: (context, index) {
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(context, CupertinoPageRoute(builder: (context) => ElcHome(
                            iso:electricityCategory[index]["CountryIso"],
                          code:electricityCategory[index]["ProviderCode"]!=null?electricityCategory[index]["ProviderCode"]:"",
                          dash:electricityCategory[index]["dash"],
                          image: electricityCategory[index]["sub_cat_logo"],
                          name: electricityCategory[index]["subcategory"],
                        ),));
                      },
                      child: Container(
                        height: height*0.3,
                        width: width*0.18,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            image: DecorationImage(image: NetworkImage(electricityCategory[index]["sub_cat_logo"]),fit: BoxFit.fill),
                            borderRadius: BorderRadius.circular(width*0.01)
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: height*0.01,),
                Text(electricityCategory[index]["subcategory"],style: TextStyle(fontSize: width*0.002),)
              ],
            );
          },
        )
      ],
    ):Column(
      children: [
        Row(
          children: [
            SizedBox(width: width*0.05,),
            LocaleText("Electricity",style: TextStyle(fontSize:width*0.06,fontWeight: FontWeight.w700),),
          ],
        ),
        SizedBox(
          height: width*0.013,
        ),
        GridView.builder(
          itemCount: electricityCategory.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio:MediaQuery.of(context).size.width > 600?1:1.07,
              crossAxisSpacing: width*0.01,
              mainAxisSpacing: width*0.01,
              crossAxisCount: MediaQuery.of(context).size.width > 600?3:2),
          itemBuilder: (context, index) {
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(context, CupertinoPageRoute(builder: (context) => ElcHome(
                          iso:electricityCategory[index]["CountryIso"],
                          code:electricityCategory[index]["ProviderCode"]!=null?electricityCategory[index]["ProviderCode"]:"",
                          dash:electricityCategory[index]["dash"],
                          image: electricityCategory[index]["sub_cat_logo"],
                          name: electricityCategory[index]["subcategory"],
                        ),));
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.width > 600?height*0.14:height*0.172,
                        width: MediaQuery.of(context).size.width > 600?width*0.22:width*0.37,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            image: DecorationImage(image: NetworkImage(electricityCategory[index]["sub_cat_logo"]),fit: BoxFit.fill),
                            borderRadius: BorderRadius.circular(width*0.03)
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: width*0.01,),
                Text(electricityCategory[index]["subcategory"],style: TextStyle(fontSize:MediaQuery.of(context).size.width > 600?width*0.03: width*0.04),textAlign:
                TextAlign.center,)
              ],
            );
          },
        )
      ],
    );
  }
  Widget Gift (){
    return MediaQuery.of(context).size.width > 650? Column(
      children: [
        Row(
          children: [
            SizedBox(width: width*0.03,),
            LocaleText("Gift Card",style: TextStyle(fontSize:width*0.025,fontWeight: FontWeight.w700),),
          ],
        ),
        SizedBox(
          height: height*0.01,
        ),
        GridView.builder(
          itemCount: giftCategory.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 1.07,
              crossAxisSpacing: width*0.01,
              mainAxisSpacing: width*0.01,
              crossAxisCount: 4),
          itemBuilder: (context, index) {
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(context, CupertinoPageRoute(builder: (context) => OfferDetails(
                            name: giftCategory[index]["subcategory"],
                            image: giftCategory[index]["sub_cat_logo"],
                            code:giftCategory[index]["ProviderCode"],
                            voucher:"1",
                            dash: giftCategory[index]["dash"],
                            iso:giftCategory[index]["CountryIso"]!=null?giftCategory[index]["CountryIso"]:""
                        )));
                      },
                      child: Container(
                        height: height*0.3,
                        width: width*0.18,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            image: DecorationImage(image: NetworkImage(giftCategory[index]["sub_cat_logo"]),fit: BoxFit.fill),
                            borderRadius: BorderRadius.circular(width*0.01)
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: height*0.01,),
                Text(giftCategory[index]["subcategory"],style: TextStyle(fontSize: width*0.02),)
              ],
            );
          },
        )
      ],
    ):Column(
      children: [
        Row(
          children: [
            SizedBox(width: width*0.05,),
            LocaleText("Gift Card",style: TextStyle(fontSize:width*0.06,fontWeight: FontWeight.w700),),
          ],
        ),
        SizedBox(
          height: width*0.013,
        ),
        GridView.builder(
          itemCount: giftCategory.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio:MediaQuery.of(context).size.width > 600?1:1.07,
              crossAxisSpacing: width*0.01,
              mainAxisSpacing: width*0.01,
              crossAxisCount: MediaQuery.of(context).size.width > 600?3:2),
          itemBuilder: (context, index) {
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(context, CupertinoPageRoute(builder: (context) => OfferDetails(
                            name: giftCategory[index]["subcategory"],
                            image: giftCategory[index]["sub_cat_logo"],
                            code:giftCategory[index]["ProviderCode"],
                            voucher:"1",
                            dash: giftCategory[index]["dash"],
                            iso:giftCategory[index]["CountryIso"]!=null?giftCategory[index]["CountryIso"]:""
                        )));
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.width > 600?height*0.14:height*0.172,
                        width: MediaQuery.of(context).size.width > 600?width*0.22:width*0.37,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            image: DecorationImage(image: NetworkImage(giftCategory[index]["sub_cat_logo"]),fit: BoxFit.fill),
                            borderRadius: BorderRadius.circular(width*0.03)
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: width*0.01,),
                Text(giftCategory[index]["subcategory"],style: TextStyle(fontSize:MediaQuery.of(context).size.width > 600?width*0.03: width*0.04),textAlign:
                TextAlign.center,)
              ],
            );
          },
        )
      ],
    );
  }
  Widget DTH (){
    return MediaQuery.of(context).size.width > 650?Column(
      children: [
        Row(
          children: [
            SizedBox(width: width*0.03,),
            LocaleText("DTH",style: TextStyle(fontSize:width*0.025,fontWeight: FontWeight.w700),),
          ],
        ),
        GridView.builder(
          itemCount: dthCategory.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 1.07,
              crossAxisSpacing: width*0.01,
              mainAxisSpacing: width*0.01,
              crossAxisCount: 4),
          itemBuilder: (context, index) {
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => OfferDetails(
                          code: dthCategory[index]['ProviderCode'].toString(),
                          name: dthCategory[index]['subcategory'].toString(),
                          iso: dthCategory[index]['CountryIso'].toString(),
                          dash: dthCategory[index]['dash'].toString(),
                          image: dthCategory[index]['sub_cat_logo'].toString(),
                        ),));
                      },
                      child: Container(
                        height: height*0.3,
                        width: width*0.18,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            image: DecorationImage(image: NetworkImage(dthCategory[index]["sub_cat_logo"]),fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(width*0.01)
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: height*0.01,),
                Text(dthCategory[index]["subcategory"],style: TextStyle(fontSize: width*0.02),)
              ],
            );
          },
        )
      ],
    ):Column(
      children: [
        Row(
          children: [
            SizedBox(width: width*0.05,),
            LocaleText("DTH",style: TextStyle(fontSize:width*0.06,fontWeight: FontWeight.w700),),
          ],
        ),
        SizedBox(
          height: width*0.013,
        ),
        GridView.builder(
          itemCount: dthCategory.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio:MediaQuery.of(context).size.width > 600?1:1.07,
              crossAxisSpacing: width*0.01,
              mainAxisSpacing: width*0.01,
              crossAxisCount: MediaQuery.of(context).size.width > 600?3:2),
          itemBuilder: (context, index) {
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(context, CupertinoPageRoute(builder: (context) => OfferDetails(
                            name: dthCategory[index]["subcategory"],
                            image: dthCategory[index]["sub_cat_logo"],
                            code:dthCategory[index]["ProviderCode"],
                            voucher:"1",
                            dash: dthCategory[index]["dash"],
                            iso:dthCategory[index]["CountryIso"]!=null?giftCategory[index]["CountryIso"]:""
                        )));
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.width > 600?height*0.14:height*0.172,
                        width: MediaQuery.of(context).size.width > 600?width*0.22:width*0.37,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            image: DecorationImage(image: NetworkImage(dthCategory[index]["sub_cat_logo"]),fit: BoxFit.fill),
                            borderRadius: BorderRadius.circular(width*0.03)
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: width*0.01,),
                Text(dthCategory[index]["subcategory"],style: TextStyle(fontSize:MediaQuery.of(context).size.width > 600?width*0.03: width*0.04),textAlign:
                TextAlign.center,)
              ],
            );
          },
        )
      ],
    );
  }
}

