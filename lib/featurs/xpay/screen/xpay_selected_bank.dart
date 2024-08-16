import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../Const/colorConst.dart';
import '../../../Const/widgets.dart';
import '../../../main.dart';

class SelectedBank extends StatefulWidget {
  const SelectedBank({super.key});

  @override
  State<SelectedBank> createState() => _SelectedBankState();
}

class _SelectedBankState extends State<SelectedBank> {
  TextEditingController accountnumberController=TextEditingController();
  TextEditingController accountnameController=TextEditingController();
  TextEditingController banknameController=TextEditingController();
  TextEditingController branchnameController=TextEditingController();
  TextEditingController codeController=TextEditingController();
  TextEditingController mobilenumberController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
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
            Container(
              width: width*0.8,
              height: width*0.8,
              decoration: BoxDecoration(
                color: colorConst.blue,
                borderRadius: BorderRadius.circular(width*0.03),
              ),
            )
          ],
        ),
      ),
    );
  }
}
