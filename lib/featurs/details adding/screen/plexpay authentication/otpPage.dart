import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:plexpay/Const/Snackbar_toast_helper.dart';
import 'package:plexpay/Const/imageConst.dart';
import 'package:plexpay/Const/widgets.dart';
import 'package:plexpay/featurs/details%20adding/screen/plexpay%20authentication/add_details_page.dart';
import 'package:plexpay/featurs/details%20adding/screen/plexpay%20authentication/new_login_page.dart';

import '../../../../Const/colorConst.dart';
import '../../../../main.dart';

class Otppage extends StatefulWidget {
  const Otppage({super.key});

  @override
  State<Otppage> createState() => _OtppageState();
}

class _OtppageState extends State<Otppage> {
  TextEditingController otpController=TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Center(
            child: Container(
              child: Column(
                children: [
                  SizedBox(
                    height: width*0.15,
                  ),
                  Text("Verification Code",style: TextStyle(
                      fontSize: width*0.06,
                      fontWeight: FontWeight.bold
                  ),),
                  Text("We have sent the verification code \nto your email address",style: TextStyle(
                      fontWeight:FontWeight.w100,
                      color: colorConst.grey,
                      fontSize: width*0.042
                  ), textAlign: TextAlign.center,),
                  SizedBox(
                    height: width*0.05,
                  ),
                  Pinput(
                    length: 4,
                    autofocus: true,
                    controller: otpController,
                    focusedPinTheme: PinTheme(
                      textStyle: TextStyle(
                          color: colorConst.blue
                      ),
                      width: width*0.12,
                      height: width*0.13,
                      decoration: BoxDecoration(

                          borderRadius: BorderRadius.circular(width*0.03),
                          border: Border.all(
                            width: width*0.005,
                            color: colorConst.blue,
                          )
                      ),
                    ),
                    defaultPinTheme: PinTheme(
                      height: width*0.15,
                      width: width*0.115,
                      textStyle: TextStyle(
                          color: colorConst.blue
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(width*0.03),
                          border: Border.all(
                            color: colorConst.blue,
                          )
                      ),
                    ),
                  ),
                  gap,
                  GestureDetector(
                    onTap: () {
                      otpController.clear();
                      setState(() {
                      });
                    },
                    child: Text("re-send OTP",style: TextStyle(
                        color: colorConst.blue
                    ),),
                  ),
                  SizedBox(
                    height: width*0.17,
                  ),
                  InkWell(
                    onTap: () {
                      if(otpController.text.isNotEmpty){
                        Navigator.pushReplacement(context,CupertinoPageRoute(builder: (context) => NewLoginPage(),));
                      }else{
                        showToast("Enter your verification code");
                      }
                    },
                    child: Container(
                      width: width*0.8,
                      height: width*0.15,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(width*0.08),
                          color: colorConst.blue
                      ),
                      child: Center(
                        child: Text("Confirm",style: TextStyle(
                            color: Colors.white,
                            fontSize: width*0.045
                        ),),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )

        ],
      ),
    );
  }
}
