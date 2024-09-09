import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:flutter_svg/svg.dart';
import 'package:plexpay/Const/colorConst.dart';
import 'package:plexpay/featurs/details%20adding/screen/plexbill_cart.dart';

import '../../../Const/imageConst.dart';
import '../../../main.dart';

class plexbill extends StatefulWidget {
  const plexbill({super.key});

  @override
  State<plexbill> createState() => _plexbillState();
}

class _plexbillState extends State<plexbill> {

  String? dropdownValue;

  dynamic added;
  List a = [];
  total(index) {
    for (int i = 0; i < product.length; i++) {
      if (product[i]["quantity"] > 0) {
        added = product[i];
        a.add(added);
      }
      // print(a);
      // print("oooooooooooooooooooooooooooooooo");
    }

    setState(() {});
  }
  List product = [
    {"image1": ImageConst.cart1, "text": "Etisalat UAE","quantity":0,"Price":50,"tax":5},
    {"image1": ImageConst.cart1, "text": "DU UAE","quantity":0,"Price":100,"tax":15},
    {"image1": ImageConst.cart5, "text": "Lebanese","quantity":0,"Price":20,"tax":2},
    {"image1": ImageConst.cart3, "text": "Adnoc","quantity":0,"Price":30,"tax":3},
    {"image1": ImageConst.cart3, "text": " Finance","quantity":0,"Price":50,"tax":5},
    {"image1": ImageConst.cart3, "text": "DU UAE","quantity":0,"Price":100,"tax":15},
    {"image1": ImageConst.cart3, "text": "Lebanese","quantity":0,"Price":20,"tax":2},
    {"image1": ImageConst.cart3, "text": "Adnoc","quantity":0,"Price":30,"tax":3},

  ];

  var customer=[
    "customer1",
    "customer2",
    "customer3",
  ];

  @override
  void initState() {

    // TODO: implement initState
    super.initState();
  }

  TextEditingController customerController=TextEditingController();
  TextEditingController trnController=TextEditingController();
  TextEditingController phoneController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        height: width * 0.13,
        width: width * 0.999,
        color: colorConst.blue,
        child: Column(
          children: [
            Divider(
              thickness: width * 0.005,
              color: Colors.white,
              endIndent: width * 0.01,
              indent: width * 0.01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context, MaterialPageRoute(
                      builder: (context) => cart( category: [], ),));
                  },
                  child: LocaleText(
                    "Next",
                    style: TextStyle(
                        fontWeight: FontWeight.w500, fontSize: width * 0.07,color: Colors.white),
                  ),
                ),
                SizedBox(
                  width: width*0.04,
                )
              ],
            )
          ],
        ),
      ),
      backgroundColor: colorConst.blue,
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
        title: LocaleText(
          "PlexBill",
          style:
          TextStyle(fontSize: width * 0.06, fontWeight: FontWeight.w700),
        ),
        actions: [
          InkWell(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(
                  builder: (context) => cart( category: [],),));
              },
              child: Stack(
                children: [
                  Padding(
                    padding:  EdgeInsets.only(left: width*0.042,),
                    child: CircleAvatar(
                      radius: width*0.026,
                      backgroundColor: Colors.red,
                      child: Center(child: Text(a.length.toString())),
                    ),
                  ),
                Icon(Icons.shopping_cart_outlined,size: width*0.063,),
                ],
              )
          ),
          SizedBox(
            width: width*0.03,
          )
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Center(
              child: Container(
                height: width * 0.45,
                width: width * 0.9,
                decoration: BoxDecoration(
                    color: colorConst.blue,
                    boxShadow: [
                      BoxShadow(
                          blurStyle: BlurStyle.normal,
                          color: Colors.black.withOpacity(0.09),
                          offset: Offset(0, 2),
                          spreadRadius: 1,
                          blurRadius: 9)
                    ],
                    borderRadius: BorderRadius.circular(width * 0.03)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Center(
                              child: Container(
                                height: width * 0.13,
                                width: width * 0.4,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(width * 0.03)),
                                child: TextFormField(
                                  controller: customerController,
                                  autovalidateMode: AutovalidateMode.onUserInteraction,
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                    hintText: "       Customer ID",
                                      contentPadding: EdgeInsets.all(width*0.03),
                                      hintStyle: TextStyle(
                                        fontSize: width * 0.052,
                                        fontWeight: FontWeight.w600,
                                      color: Colors.black
                                    ),
                                    border: UnderlineInputBorder(
                                      borderRadius: BorderRadius.circular(width*0.03)
                                    )
                                  ),
                                )
                              ),
                            ),
                            Center(
                              child: Container(
                                height: width * 0.13,
                                width: width * 0.4,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(width * 0.03)),
                                child:  DropdownButton(
                                    dropdownColor: Colors.white,
                                    isExpanded: true,
                                    hint: Center(child: Text("Select Customer",style: TextStyle(fontSize: width*0.046,fontWeight: FontWeight.w800),)),
        
                                    icon:Icon(Icons.keyboard_arrow_down_outlined) ,
                                    value: dropdownValue,
                                    items: customer.map((String? value) {
                                      return DropdownMenuItem(
                                        child: Center(child: Text(value!,style: TextStyle(fontSize: width*0.05,fontWeight: FontWeight.w600),)),
                                        value: value,);
                                    }).toList(),
                                    onChanged: (newValue) {
                                      setState(() {
                                        dropdownValue=newValue;
        
                                      });
                                    }
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: width * 0.05,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Center(
                              child: Container(
                                height: width * 0.13,
                                width: width * 0.4,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(width * 0.03)),
                                child: TextFormField(
                                  controller: phoneController,
                                  autovalidateMode: AutovalidateMode.onUserInteraction,
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                      hintText: "    Phone Number",
                                      contentPadding: EdgeInsets.all(width*0.03),
                                      hintStyle: TextStyle(
                                          fontSize: width * 0.052,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black
                                      ),
                                      border: UnderlineInputBorder(
                                          borderRadius: BorderRadius.circular(width*0.03)
                                      )
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: width * 0.13,
                              width: width * 0.4,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(width * 0.03)),
                              child: TextFormField(
                                controller: trnController,
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                    hintText: "      TRN Number",
                                    contentPadding: EdgeInsets.all(width*0.03),
                                    hintStyle: TextStyle(
                                        fontSize: width * 0.052,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black
                                    ),
                                    border: UnderlineInputBorder(
                                        borderRadius: BorderRadius.circular(width*0.03)
                                    )
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Row(
              children: [
                SizedBox(
                  width: width*0.05,
                ),
                Text("Products",style: TextStyle(fontSize: 27,fontWeight: FontWeight.w500,color: Colors.white),),
              ],
            ),
            SizedBox(
              height: width*0.02,
            ),
                GridView.builder(
                  itemCount: product.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 0.6,
                      crossAxisSpacing: width*0.01,
                      mainAxisSpacing: width*0.01,
                      crossAxisCount: 4),
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            // Navigator.push(
                            //     context,
                            //     CupertinoPageRoute(
                            //       builder: (context) => OfferDetails(
                            //         name:images[index]["text"],
                            //         image:images[index]["image1"]
                            //       ),
                            //     ));
                          },
                          child: Container(
                            height: width*0.17,
                            width: width*0.17,
                            decoration: BoxDecoration(
                              // color: Colors.blue,
                                borderRadius: BorderRadius.circular(width * 0.03),
                                border: Border.all(width: width * 0.0001),
                                image: DecorationImage(
                                    image: AssetImage(product[index]["image1"]))),
                            // child: Image.asset(images[index]["image1"],fit: BoxFit.fill,),
                          ),
                        ),
                        SizedBox(
                          height: width * 0.01,
                        ),
                        Text(
                          product[index]["text"],
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: width * 0.03,color: Colors.white),
                        ),
                        // Text(product[index]["Price"].toString()),
                        SizedBox(
                          height: width*0.02,
                        ),
                        product[index]["quantity"] != 0
                            ? Container(
                          height: width * 0.08,
                          width: width * 0.17,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                              BorderRadius.circular(
                                  width * 0.023)),
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment
                                .spaceBetween,
                            children: [
                              InkWell(
                                  onTap: () {
                                    product[index]
                                    ["quantity"] --;
                                    // totalprice();
                                    setState(() {});
                                  },
                                  child: const Icon(
                                    Icons.remove,
                                    color: Colors.black,
                                    size:20,
                                  )),
                              Text(
                                product[index]["quantity"]
                                    .toString(),
                                style: TextStyle(
                                    color: Colors.black,fontSize: 18),
                              ),
                              InkWell(
                                  onTap: () {
                                    product[index]
                                    ["quantity"] ++;
                                    // totalprice();
                                    setState(() {});
                                  },
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.black,
                                    size: width*0.05,
                                  )),
                            ],
                          ),
                        )
                            : InkWell(
                          onTap: () {
                            product[index]["quantity"] ++;
                            total(index);
                            // totalprice();
                            setState(() {});
                          },
                          child: Container(
                            height: width * 0.08,
                            width: width * 0.17,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                              BorderRadius.circular(
                                  width * 0.023),
                            ),
                            child: Center(
                                child: Text(
                                  "Add item",
                                  style: TextStyle(
                                      color: Colors.black),
                                )),
                          ),
                        )
                      ],
                    );
                  },
                ),
          ],
        ),
      ),
    );
  }
}
