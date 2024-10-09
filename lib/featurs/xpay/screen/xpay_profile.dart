import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:plexpay/Const/colorConst.dart';
import 'package:plexpay/Const/widgets.dart';

import '../../../main.dart';

class XpayProfile extends StatefulWidget {
  const XpayProfile({super.key});

  @override
  State<XpayProfile> createState() => _XpayProfileState();
}

class _XpayProfileState extends State<XpayProfile> {
  TextEditingController numberController=TextEditingController();
  TextEditingController nationalityController=TextEditingController();
  TextEditingController idController=TextEditingController();
  TextEditingController expdateController=TextEditingController();
  TextEditingController stateController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(context).size.width > 650?
      Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Center(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: height*0.14,
              ),
              CircleAvatar(
                    backgroundColor: colorConst.blue,
                    radius: width*0.045,
                    child: Center(
                      child: Icon(
                        Icons.person,
                        size: width*0.05,
                        color: Colors.white,
                      ),
                    ),
                  ),
              gap,
              Column(
                children: [
                  Container(
                    height: height*0.1,
                    width: width*0.8,
                    margin: EdgeInsets.all(width*0.01),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(width*0.018),
                        border: Border.all(
                            width: width*0.002,
                            color: colorConst.blue
                        )
                    ),
                    child: TextFormField(
                      controller: numberController,
                      keyboardType: TextInputType.phone,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(9)
                      ],
                      style: TextStyle(
                          color: colorConst.blue,
                          fontSize: width*0.02,
                          wordSpacing: width*0.01
                      ),
                      cursorColor: colorConst.blue,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(bottom: width*0.01,top: width*0.01,left: width*0.01),
                          prefixText: "   Mobile Number: +971 ",
                          prefixStyle: TextStyle(
                              fontSize: width*0.02,
                              color: colorConst.blue
                          ),

                          labelText: "   Mobile Number: ",
                          labelStyle: TextStyle(
                              fontSize: width*0.02,
                              color: colorConst.blue
                          ),
                          alignLabelWithHint: true,
                          floatingLabelStyle: TextStyle(
                              color: Colors.transparent
                          ),
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none
                          )
                      ),
                    ),
                  ),
                  Container(
                    height: height*0.1,
                    width: width*0.8,
                    margin: EdgeInsets.all(width*0.01),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(width*0.018),
                        border: Border.all(
                            width: width*0.002,
                            color: colorConst.blue
                        )
                    ),
                    child: TextFormField(
                      controller: nationalityController,
                      keyboardType: TextInputType.text,

                      style: TextStyle(
                          color: colorConst.blue,
                          fontSize: width*0.02,
                          wordSpacing: width*0.01
                      ),
                      cursorColor: colorConst.blue,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(bottom: width*0.01,top: width*0.01,left: width*0.01),
                          prefixText: "   Nationality: ",
                          prefixStyle: TextStyle(
                              fontSize: width*0.02,
                              color: colorConst.blue
                          ),
                          labelText: "   Nationality: ",
                          labelStyle: TextStyle(
                              fontSize: width*0.02,
                              color: colorConst.blue
                          ),
                          alignLabelWithHint: true,
                          floatingLabelStyle: TextStyle(
                              color: Colors.transparent
                          ),
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none
                          )
                      ),
                    ),
                  ),
                  Container(
                    height: height*0.1,
                    width: width*0.8,
                    margin: EdgeInsets.all(width*0.01),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(width*0.018),
                        border: Border.all(
                            width: width*0.002,
                            color: colorConst.blue
                        )
                    ),
                    child: TextFormField(
                      controller: idController,
                      keyboardType: TextInputType.text,

                      style: TextStyle(
                          color: colorConst.blue,
                          fontSize: width*0.02,
                          wordSpacing: width*0.01
                      ),
                      cursorColor: colorConst.blue,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(bottom: width*0.01,top: width*0.01,left: width*0.01),
                          prefixText: "   Emirates ID: ",
                          prefixStyle: TextStyle(
                              fontSize: width*0.02,
                              color: colorConst.blue
                          ),
                          labelText: "   Emirates ID: ",
                          labelStyle: TextStyle(
                              fontSize: width*0.02,
                              color: colorConst.blue
                          ),
                          alignLabelWithHint: true,
                          floatingLabelStyle: TextStyle(
                              color: Colors.transparent
                          ),
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none
                          )
                      ),
                    ),
                  ),
                  Container(
                    height: height*0.1,
                    width: width*0.8,
                    margin: EdgeInsets.all(width*0.01),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(width*0.018),
                        border: Border.all(
                            width: width*0.002,
                            color: colorConst.blue
                        )
                    ),
                    child: TextFormField(
                      controller: expdateController,
                      keyboardType: TextInputType.text,

                      style: TextStyle(
                          color: colorConst.blue,
                          fontSize: width*0.02,
                          wordSpacing: width*0.01
                      ),
                      cursorColor: colorConst.blue,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(bottom: width*0.01,top: width*0.01,left: width*0.01),
                          prefixText: "   ID expiry Date: ",
                          prefixStyle: TextStyle(
                              fontSize: width*0.02,
                              color: colorConst.blue
                          ),
                          labelText: "   ID expiry Date: ",
                          labelStyle: TextStyle(
                              fontSize: width*0.02,
                              color: colorConst.blue
                          ),
                          alignLabelWithHint: true,
                          floatingLabelStyle: TextStyle(
                              color: Colors.transparent
                          ),
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none
                          )
                      ),
                    ),
                  ),
                  Container(
                    height: height*0.1,
                    width: width*0.8,
                    margin: EdgeInsets.all(width*0.01),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(width*0.018),
                        border: Border.all(
                            width: width*0.002,
                            color: colorConst.blue
                        )
                    ),
                    child: TextFormField(
                      controller: stateController,
                      keyboardType: TextInputType.text,

                      style: TextStyle(
                          color: colorConst.blue,
                          fontSize: width*0.02,
                          wordSpacing: width*0.01
                      ),
                      cursorColor: colorConst.blue,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(bottom: width*0.01,top: width*0.01,left: width*0.01),
                          prefixText: "   Emirate state: ",
                          prefixStyle: TextStyle(
                              fontSize: width*0.02,
                              color: colorConst.blue
                          ),
                          labelText: "   Emirate state: ",
                          labelStyle: TextStyle(
                              fontSize: width*0.02,
                              color: colorConst.blue
                          ),
                          alignLabelWithHint: true,
                          floatingLabelStyle: TextStyle(
                              color: Colors.transparent
                          ),
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none
                          )
                      ),
                    ),
                  ),
                  Container(
                      height: height*0.1,
                      width: width*0.8,
                      margin: EdgeInsets.all(width*0.01),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(width*0.018),
                          border: Border.all(
                              width: width*0.002,
                              color: colorConst.blue
                          ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("    upload ID photo",style: TextStyle(
                              fontSize: width*0.02,
                              color: colorConst.blue
                          ),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.photo_camera,color: Colors.black,
                              ),
                              SizedBox(
                                width: width*0.03,
                              )
                            ],
                          ),
                        ],
                      )
                  ),
                ],
              ),

              SizedBox(
                height: height*0.06,
              ),
              Container(
                width: width*0.2,
                height: height*0.1,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(width*0.018),
                    color: colorConst.blue
                ),
                child:Center(
                  child: Text("SUBMIT",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 16
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height*0.02,
              )
            ],
          ),
        ),
      ),
    ):
      Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Center(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: width*0.22,
              ),
              CircleAvatar(
                    backgroundColor: colorConst.blue,
                    radius: width*0.1,
                    child: Center(
                      child: Icon(
                        Icons.person,
                        size: width*0.12,
                        color: Colors.white,
                      ),
                    ),
                  ),
              gap,
              Column(
                children: [
                  Container(
                    height: width*0.12,
                    width: width*0.85,
                    margin: EdgeInsets.all(width*0.02),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(width*0.03),
                        border: Border.all(
                            width: width*0.004,
                            color: colorConst.blue
                        )
                    ),
                    child: TextFormField(
                      controller: numberController,
                      keyboardType: TextInputType.phone,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(9)
                      ],
                      style: TextStyle(
                          color: colorConst.blue,
                          fontSize: width*0.05,
                          wordSpacing: width*0.01
                      ),
                      cursorColor: colorConst.blue,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(bottom: width*0.01),
                          prefixText: "   Mobile Number: +971 ",
                          prefixStyle: TextStyle(
                              fontSize: width*0.05,
                              color: colorConst.blue
                          ),
                          labelText: "   Mobile Number: ",
                          labelStyle: TextStyle(
                              fontSize: width*0.05,
                              color: colorConst.blue
                          ),
                          alignLabelWithHint: true,
                          floatingLabelStyle: TextStyle(
                              color: Colors.transparent
                          ),
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none
                          )
                      ),
                    ),
                  ),
                  Container(
                    height: width*0.12,
                    width: width*0.85,
                    margin: EdgeInsets.all(width*0.02),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(width*0.03),
                        border: Border.all(
                            width: width*0.004,
                            color: colorConst.blue
                        )
                    ),
                    child: TextFormField(
                      controller: nationalityController,
                      keyboardType: TextInputType.text,

                      style: TextStyle(
                          color: colorConst.blue,
                          fontSize: width*0.05,
                          wordSpacing: width*0.01
                      ),
                      cursorColor: colorConst.blue,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(bottom: width*0.01),
                          prefixText: "   Nationality: ",
                          prefixStyle: TextStyle(
                              fontSize: width*0.05,
                              color: colorConst.blue
                          ),
                          labelText: "   Nationality: ",
                          labelStyle: TextStyle(
                              fontSize: width*0.05,
                              color: colorConst.blue
                          ),
                          alignLabelWithHint: true,
                          floatingLabelStyle: TextStyle(
                              color: Colors.transparent
                          ),
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none
                          )
                      ),
                    ),
                  ),
                  Container(
                    height: width*0.12,
                    width: width*0.85,
                    margin: EdgeInsets.all(width*0.02),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(width*0.03),
                        border: Border.all(
                            width: width*0.004,
                            color: colorConst.blue
                        )
                    ),
                    child: TextFormField(
                      controller: idController,
                      keyboardType: TextInputType.text,

                      style: TextStyle(
                          color: colorConst.blue,
                          fontSize: width*0.05,
                          wordSpacing: width*0.01
                      ),
                      cursorColor: colorConst.blue,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(bottom: width*0.01),
                          prefixText: "   Emirates ID: ",
                          prefixStyle: TextStyle(
                              fontSize: width*0.05,
                              color: colorConst.blue
                          ),
                          labelText: "   Emirates ID: ",
                          labelStyle: TextStyle(
                              fontSize: width*0.05,
                              color: colorConst.blue
                          ),
                          alignLabelWithHint: true,
                          floatingLabelStyle: TextStyle(
                              color: Colors.transparent
                          ),
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none
                          )
                      ),
                    ),
                  ),
                  Container(
                    height: width*0.12,
                    width: width*0.85,
                    margin: EdgeInsets.all(width*0.02),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(width*0.03),
                        border: Border.all(
                            width: width*0.004,
                            color: colorConst.blue
                        )
                    ),
                    child: TextFormField(
                      controller: expdateController,
                      keyboardType: TextInputType.text,

                      style: TextStyle(
                          color: colorConst.blue,
                          fontSize: width*0.05,
                          wordSpacing: width*0.01
                      ),
                      cursorColor: colorConst.blue,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(bottom: width*0.01),
                          prefixText: "   ID expiry Date: ",
                          prefixStyle: TextStyle(
                              fontSize: width*0.05,
                              color: colorConst.blue
                          ),
                          labelText: "   ID expiry Date: ",
                          labelStyle: TextStyle(
                              fontSize: width*0.05,
                              color: colorConst.blue
                          ),
                          alignLabelWithHint: true,
                          floatingLabelStyle: TextStyle(
                              color: Colors.transparent
                          ),
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none
                          )
                      ),
                    ),
                  ),
                  Container(
                    height: width*0.12,
                    width: width*0.85,
                    margin: EdgeInsets.all(width*0.02),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(width*0.03),
                        border: Border.all(
                            width: width*0.004,
                            color: colorConst.blue
                        )
                    ),
                    child: TextFormField(
                      controller: stateController,
                      keyboardType: TextInputType.text,

                      style: TextStyle(
                          color: colorConst.blue,
                          fontSize: width*0.05,
                          wordSpacing: width*0.01
                      ),
                      cursorColor: colorConst.blue,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(bottom: width*0.01),
                          prefixText: "   Emirate state: ",
                          prefixStyle: TextStyle(
                              fontSize: width*0.05,
                              color: colorConst.blue
                          ),
                          labelText: "   Emirate state: ",
                          labelStyle: TextStyle(
                              fontSize: width*0.05,
                              color: colorConst.blue
                          ),
                          alignLabelWithHint: true,
                          floatingLabelStyle: TextStyle(
                              color: Colors.transparent
                          ),
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none
                          )
                      ),
                    ),
                  ),
                  Container(
                      height: width*0.12,
                      width: width*0.85,
                      margin: EdgeInsets.all(width*0.02),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(width*0.03),
                          border: Border.all(
                              width: width*0.004,
                              color: colorConst.blue
                          )
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("  upload ID photo",style: TextStyle(
                              fontSize: width*0.05,
                              color: colorConst.blue
                          ),),
                          Row(
                            children: [
                              Icon(
                                Icons.photo_camera,color: Colors.black,
                              ),
                              SizedBox(
                                width: width*0.03,
                              )
                            ],
                          ),
                        ],
                      )
                  ),
                ],
              ),

              SizedBox(
                height: width*0.06,
              ),
              Container(
                width: width*0.3,
                height: width*0.1,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(width*0.03),
                    color: colorConst.blue
                ),
                child:Center(
                  child: Text("SUBMIT",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 16
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height*0.03,
              )
            ],
          ),
        ),
      ),

    );
  }
}
