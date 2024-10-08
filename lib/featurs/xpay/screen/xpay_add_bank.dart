import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../Const/colorConst.dart';
import '../../../Const/widgets.dart';
import '../../../main.dart';

class AddBank extends StatefulWidget {
  const AddBank({super.key});

  @override
  State<AddBank> createState() => _AddBankState();
}

class _AddBankState extends State<AddBank> {
  TextEditingController accountnumberController=TextEditingController();
  TextEditingController accountnameController=TextEditingController();
  TextEditingController banknameController=TextEditingController();
  TextEditingController branchnameController=TextEditingController();
  TextEditingController codeController=TextEditingController();
  TextEditingController mobilenumberController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(context).size.width > 650?
      Scaffold(
      resizeToAvoidBottomInset: false,
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
                height: height*0.26,
              ),
              Text("ADD BANK",style: TextStyle(
                color: colorConst.blue,
                fontWeight: FontWeight.bold,
                fontSize: width*0.04
              ),),
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
                      controller: accountnumberController,
                      keyboardType: TextInputType.phone,
                      style: TextStyle(
                          color: colorConst.blue,
                          fontSize: width*0.02,
                          wordSpacing: width*0.01
                      ),
                      cursorColor: colorConst.blue,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(bottom: width*0.01),
                          prefixText: "   ACCOUNT NO: ",
                          prefixStyle: TextStyle(
                              fontSize: width*0.02,
                              color: colorConst.blue
                          ),
                          labelText: "   ACCOUNT NO: ",
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
                      controller: accountnameController,
                      keyboardType: TextInputType.text,

                      style: TextStyle(
                          color: colorConst.blue,
                          fontSize: width*0.02,
                          wordSpacing: width*0.01
                      ),
                      cursorColor: colorConst.blue,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(bottom: width*0.01),
                          prefixText: "   ACCOUNT NAME: ",
                          prefixStyle: TextStyle(
                              fontSize: width*0.02,
                              color: colorConst.blue
                          ),
                          labelText: "   ACCOUNT NAME: ",
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
                      controller: banknameController,
                      keyboardType: TextInputType.text,

                      style: TextStyle(
                          color: colorConst.blue,
                          fontSize: width*0.02,
                          wordSpacing: width*0.01
                      ),
                      cursorColor: colorConst.blue,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(bottom: width*0.01),
                          prefixText: "   BANK NAME: ",
                          prefixStyle: TextStyle(
                              fontSize: width*0.02,
                              color: colorConst.blue
                          ),
                          labelText: "   BANK NAME: ",
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
                      controller: branchnameController,
                      keyboardType: TextInputType.text,

                      style: TextStyle(
                          color: colorConst.blue,
                          fontSize: width*0.02,
                          wordSpacing: width*0.01
                      ),
                      cursorColor: colorConst.blue,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(bottom: width*0.01),
                          prefixText: "   BRANCH NAME: ",
                          prefixStyle: TextStyle(
                              fontSize: width*0.02,
                              color: colorConst.blue
                          ),
                          labelText: "   BRANCH NAME: ",
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
                      controller: codeController,
                      keyboardType: TextInputType.text,

                      style: TextStyle(
                          color: colorConst.blue,
                          fontSize: width*0.02,
                          wordSpacing: width*0.01
                      ),
                      cursorColor: colorConst.blue,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(bottom: width*0.01),
                          prefixText: "   IFSC CODE: ",
                          prefixStyle: TextStyle(
                              fontSize: width*0.02,
                              color: colorConst.blue
                          ),
                          labelText: "   IFSC CODE: ",
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
                      controller: mobilenumberController,
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
                          prefixText: "   MOBILE NUMBER: +971 ",
                          prefixStyle: TextStyle(
                              fontSize: width*0.02,
                              color: colorConst.blue
                          ),
                          labelText: "   MOBILE NUMBER: ",
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
                ],
              ),

              SizedBox(
                height: height*0.05,
              ),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  width: width*0.3,
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
              ),
              SizedBox(
                height: height*0.03,
              ),
            ],
          ),
        ),
      ),
    ):
      Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          height: width*2.5,
          child: Center(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: width*0.26,
                ),
                Text("ADD BANK",style: TextStyle(
                  color: colorConst.blue,
                  fontWeight: FontWeight.bold,
                  fontSize: width*0.08
                ),),
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
                        controller: accountnumberController,
                        keyboardType: TextInputType.phone,
                        style: TextStyle(
                            color: colorConst.blue,
                            fontSize: width*0.05,
                            wordSpacing: width*0.01
                        ),
                        cursorColor: colorConst.blue,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(bottom: width*0.01),
                            prefixText: "   ACCOUNT NO: ",
                            prefixStyle: TextStyle(
                                fontSize: width*0.05,
                                color: colorConst.blue
                            ),
                            labelText: "   ACCOUNT NO: ",
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
                    gap,
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
                        controller: accountnameController,
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
                            prefixText: "   ACCOUNT NAME: ",
                            prefixStyle: TextStyle(
                                fontSize: width*0.05,
                                color: colorConst.blue
                            ),
                            labelText: "   ACCOUNT NAME: ",
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
                    gap,
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
                        controller: banknameController,
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
                            prefixText: "   BANK NAME: ",
                            prefixStyle: TextStyle(
                                fontSize: width*0.05,
                                color: colorConst.blue
                            ),
                            labelText: "   BANK NAME: ",
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
                    gap,
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
                        controller: branchnameController,
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
                            prefixText: "   BRANCH NAME: ",
                            prefixStyle: TextStyle(
                                fontSize: width*0.05,
                                color: colorConst.blue
                            ),
                            labelText: "   BRANCH NAME: ",
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
                    gap,
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
                        controller: codeController,
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
                            prefixText: "   IFSC CODE: ",
                            prefixStyle: TextStyle(
                                fontSize: width*0.05,
                                color: colorConst.blue
                            ),
                            labelText: "   IFSC CODE: ",
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
                    gap,
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
                        controller: mobilenumberController,
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
                            prefixText: "   MOBILE NUMBER: +971 ",
                            prefixStyle: TextStyle(
                                fontSize: width*0.05,
                                color: colorConst.blue
                            ),
                            labelText: "   MOBILE NUMBER: ",
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
                  ],
                ),

                SizedBox(
                  height: width*0.05,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: width*0.3,
                    height: width*0.12,
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
