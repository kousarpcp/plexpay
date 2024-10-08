import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:plexpay/Const/colorConst.dart';

import '../../../main.dart';
import '../../../Const/imageConst.dart';

class debitcredit extends StatefulWidget {
  const debitcredit({super.key});

  @override
  State<debitcredit> createState() => _debitcreditState();
}

class _debitcreditState extends State<debitcredit> {
  TextEditingController numberController =TextEditingController();
  TextEditingController numberController2 =TextEditingController();
  TextEditingController numberController3 =TextEditingController();
  TextEditingController numberController4=TextEditingController();
  TextEditingController nameController=TextEditingController();
  final formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(context).size.width > 650 ?
      Scaffold(
        resizeToAvoidBottomInset: false,
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
            height: height * 0.045,
            width: width * 0.05,
            child: Padding(
              padding: EdgeInsets.all(width * 0.01),
              child: SvgPicture.asset(
                ImageConst.back,
              ),
            ),
          ),
        ),
        title: Text(
          "Debit & Credit Card",
          style: TextStyle(fontSize: width * 0.025, fontWeight: FontWeight.w700),
        ),
      ),
      body: Form(
        key: formKey,
        child: Column(
          children: [
            SizedBox(
                height: height*0.015,
            ),
            Center(
              child: Container(
                height: height * 0.5,
                width: width * 0.932,
                decoration: BoxDecoration(
                    color: Colors.white,
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
                  children: [
                    SizedBox(
                      height: height*0.014,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: width*0.04,
                        ),
                        Text("Enter Card Number",style: TextStyle(fontWeight: FontWeight.w600,fontSize: width*0.022),),
                      ],
                    ),
                    SizedBox(
                      height: height*0.01,
                    ),
                    Container(
                      width: width*0.86,
                      height: height*0.097,
                      child: TextFormField(
                        controller:numberController,
                        keyboardType:TextInputType.number ,
                          textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(width*0.015)),
                          focusColor: Colors.grey,
                          hintText: "Enter Card Number",
                            hintStyle: TextStyle(
                              fontSize: width*0.019,
                              fontWeight: FontWeight.w400,
                            ),
                          enabledBorder: OutlineInputBorder(borderRadius:BorderRadius.circular(width*0.015),
                              borderSide: BorderSide(
                                color: Colors.grey
                              )
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(width*0.015),
                           borderSide: BorderSide(
                             color: colorConst.blue
                           )
                          )
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height*0.015,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: width*0.04,
                        ),
                        Container(
                          height: height*0.0385,
                          width: width*0.615,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Valid till",style: TextStyle(fontWeight: FontWeight.w600,fontSize: width*0.020),),
                              Text("CVV",style: TextStyle(fontWeight: FontWeight.w600,fontSize: width*0.020),),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height*0.02,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: width*0.04,
                        ),
                        Container(
                          height: height*0.07,
                          width: width*0.657,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: width*0.07,
                                    height: height*0.097,
                                    child: TextFormField(
                                      controller:numberController2,
                                      keyboardType:TextInputType.number ,
                                      textInputAction: TextInputAction.next,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly,
                                        LengthLimitingTextInputFormatter(2)
                                      ],
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(width*0.011)),
                                          focusColor: Colors.grey,
                                          hintText: "MM",
                                          contentPadding: EdgeInsets.only(top: height*0.02,left: height*0.035),
                                          hintStyle: TextStyle(
                                              fontSize: width*0.015,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.grey
                                          ),
                                          enabledBorder: OutlineInputBorder(borderRadius:BorderRadius.circular(width*0.011),
                                              borderSide: BorderSide(
                                                  color: Colors.grey
                                              )
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(width*0.011),
                                              borderSide: BorderSide(
                                                  color: colorConst.blue
                                              )
                                          )
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: width*0.03,
                                  ),
                                  Container(
                                    width: width*0.07,
                                    height: height*0.097,
                                    child: TextFormField(
                                      controller:numberController3,
                                      keyboardType:TextInputType.number ,
                                      textInputAction: TextInputAction.next,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly,
                                        LengthLimitingTextInputFormatter(2)
                                      ],
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(width*0.011)),
                                          focusColor: Colors.grey,
                                          contentPadding: EdgeInsets.only(top: height*0.02,left: height*0.035),
                                          hintText: "YY",
                                          hintStyle: TextStyle(
                                            fontSize: width*0.015,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.grey
                                          ),
                                          enabledBorder: OutlineInputBorder(borderRadius:BorderRadius.circular(width*0.011),
                                              borderSide: BorderSide(
                                                  color: Colors.grey
                                              )
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(width*0.011),
                                              borderSide: BorderSide(
                                                  color: colorConst.blue
                                              )
                                          )
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                width: width*0.082,
                                height: height*0.097,
                                child: TextFormField(
                                  controller:numberController4,
                                  keyboardType:TextInputType.number ,
                                  textInputAction: TextInputAction.next,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly,
                                    LengthLimitingTextInputFormatter(3)
                                  ],
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(width*0.011)),
                                      focusColor: Colors.grey,
                                      contentPadding: EdgeInsets.only(top: height*0.02,left: height*0.037),
                                      hintText: "CVV",
                                      hintStyle: TextStyle(
                                          fontSize: width*0.015,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.grey
                                      ),
                                      enabledBorder: OutlineInputBorder(borderRadius:BorderRadius.circular(width*0.011),
                                          borderSide: BorderSide(
                                              color: Colors.grey
                                          )
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(width*0.011),
                                          borderSide: BorderSide(
                                              color: colorConst.blue
                                          )
                                      )
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height*0.015,
                    ),
                    Container(
                      width: width*0.86,
                      height: height*0.097,
                      child: TextFormField(
                        controller:nameController,
                        keyboardType:TextInputType.name ,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(width*0.015)),
                            focusColor: Colors.grey,
                            hintText: "Add a nickname (optional)",
                            hintStyle: TextStyle(
                              fontSize: width*0.019,
                              fontWeight: FontWeight.w400,
                            ),
                            enabledBorder: OutlineInputBorder(borderRadius:BorderRadius.circular(width*0.015),
                                borderSide: BorderSide(
                                    color: Colors.grey
                                )
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(width*0.015),
                                borderSide: BorderSide(
                                    color: colorConst.blue
                                )
                            )
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height*0.012,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: width*0.038,
                        ),
                        Text("Eg. Shopping Card, Dad's Card",style: TextStyle(color: Colors.grey),),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ):
      Scaffold(
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
          "Debit & Credit Card",
          style: TextStyle(fontSize: width * 0.06, fontWeight: FontWeight.w700),
        ),
      ),
      body: Form(
        key: formKey,
        child: Column(
          children: [
            SizedBox(
                height: width*0.03,
            ),
            Center(
              child: Container(
                height: width * 0.74,
                width: width * 0.88,
                decoration: BoxDecoration(
                    color: Colors.white,
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
                  children: [
                    SizedBox(
                      height: width*0.027,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: width*0.05,
                        ),
                        Text("Enter Card Number",style: TextStyle(fontWeight: FontWeight.w600,fontSize: width*0.05),),
                      ],
                    ),
                    SizedBox(
                      height: width*0.02,
                    ),
                    Container(
                      width: width*0.8,
                      height: width*0.13,
                      child: TextFormField(
                        controller:numberController,
                        keyboardType:TextInputType.number ,
                          textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(width*0.02)),
                          focusColor: Colors.grey,
                          hintText: "Enter Card Number",
                            hintStyle: TextStyle(
                              fontSize: width*0.05,
                              fontWeight: FontWeight.w400,
                            ),
                          enabledBorder: OutlineInputBorder(borderRadius:BorderRadius.circular(width*0.02),
                              borderSide: BorderSide(
                                color: Colors.grey
                              )
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(width*0.02),
                           borderSide: BorderSide(
                             color: Colors.indigo
                           )
                          )
                        ),
                      ),
                    ),
                    SizedBox(
                      height: width*0.03,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: width*0.04,
                        ),
                        Container(
                          height: width*0.057,
                          width: width*0.615,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Valid till",style: TextStyle(fontWeight: FontWeight.w600,fontSize: width*0.05),),
                              Text("CVV",style: TextStyle(fontWeight: FontWeight.w600,fontSize: width*0.05),),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: width*0.04,
                        ),
                        Container(
                          height: width*0.14,
                          width: width*0.7,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: width*0.14,
                                    height: width*0.12,
                                    child: TextFormField(
                                      controller:numberController2,
                                      keyboardType:TextInputType.number ,
                                      textInputAction: TextInputAction.next,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly,
                                        LengthLimitingTextInputFormatter(2)
                                      ],
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(width*0.02)),
                                          focusColor: Colors.grey,
                                          hintText: "MM",
                                          hintStyle: TextStyle(
                                              fontSize: width*0.041,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.grey
                                          ),
                                          enabledBorder: OutlineInputBorder(borderRadius:BorderRadius.circular(width*0.02),
                                              borderSide: BorderSide(
                                                  color: Colors.grey
                                              )
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(width*0.02),
                                              borderSide: BorderSide(
                                                  color: Colors.indigo
                                              )
                                          )
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: width*0.03,
                                  ),
                                  Container(
                                    width: width*0.14,
                                    height: width*0.12,
                                    child: TextFormField(
                                      controller:numberController3,
                                      keyboardType:TextInputType.number ,
                                      textInputAction: TextInputAction.next,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly,
                                        LengthLimitingTextInputFormatter(2)
                                      ],
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(width*0.02)),
                                          focusColor: Colors.grey,
                                          hintText: "YY",
                                          hintStyle: TextStyle(
                                            fontSize: width*0.045,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.grey
                                          ),
                                          enabledBorder: OutlineInputBorder(borderRadius:BorderRadius.circular(width*0.02),
                                              borderSide: BorderSide(
                                                  color: Colors.grey
                                              )
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(width*0.02),
                                              borderSide: BorderSide(
                                                  color: Colors.indigo
                                              )
                                          )
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                width: width*0.17,
                                height: width*0.12,
                                child: TextFormField(
                                  controller:numberController4,
                                  keyboardType:TextInputType.number ,
                                  textInputAction: TextInputAction.next,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly,
                                    LengthLimitingTextInputFormatter(3)
                                  ],
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(width*0.02)),
                                      focusColor: Colors.grey,
                                      hintText: "CVV",
                                      hintStyle: TextStyle(
                                          fontSize: width*0.045,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.grey
                                      ),
                                      enabledBorder: OutlineInputBorder(borderRadius:BorderRadius.circular(width*0.02),
                                          borderSide: BorderSide(
                                              color: Colors.grey
                                          )
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(width*0.02),
                                          borderSide: BorderSide(
                                              color: Colors.indigo
                                          )
                                      )
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: width*0.03,
                    ),
                    Container(
                      width: width*0.8,
                      height: width*0.13,
                      child: TextFormField(
                        controller:nameController,
                        keyboardType:TextInputType.name ,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(width*0.02)),
                            focusColor: Colors.grey,
                            hintText: "Add a nickname (optional)",
                            hintStyle: TextStyle(
                              fontSize: width*0.05,
                              fontWeight: FontWeight.w400,
                            ),
                            enabledBorder: OutlineInputBorder(borderRadius:BorderRadius.circular(width*0.02),
                                borderSide: BorderSide(
                                    color: Colors.grey
                                )
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(width*0.02),
                                borderSide: BorderSide(
                                    color: Colors.indigo
                                )
                            )
                        ),
                      ),
                    ),
                    SizedBox(
                      height: width*0.023,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: width*0.05,
                        ),
                        Text("Eg. Shopping Card, Dad's Card",style: TextStyle(color: Colors.grey),),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
