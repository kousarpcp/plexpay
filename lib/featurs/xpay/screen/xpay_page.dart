import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pinput/pinput.dart';
import 'package:plexpay/Const/colorConst.dart';
import 'package:plexpay/Const/widgets.dart';
import 'package:plexpay/featurs/xpay/screen/xpay_home.dart';

import '../../../Const/imageConst.dart';
import '../../../main.dart';

class XpayPage extends StatefulWidget {
  const XpayPage({super.key});

  @override
  State<XpayPage> createState() => _XpayPageState();
}

class _XpayPageState extends State<XpayPage> {
  bool tap=false;
  TextEditingController numController=TextEditingController();
  TextEditingController otpController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: width*0.6,
            height: width*0.4,
            child: Image(image: AssetImage(ImageConst.xpay)),
          ),
          Center(
            child: Container(
              height: width*0.15,
              width: width*0.8,
              margin: EdgeInsets.all(width*0.04),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(width*0.03),
                border: Border.all(
                  width: width*0.004,
                  color: colorConst.blue
                )
              ),
              child: TextFormField(
                controller: numController,
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
                textInputAction: TextInputAction.send,
                decoration: InputDecoration(
                  prefixText: "  +971 ",
                    prefixStyle: TextStyle(
                      fontSize: width*0.05,
                      color: colorConst.blue
                    ),
                  labelText: "    Enter Your Mobile Number",
                  labelStyle: TextStyle(
                    color: colorConst.blue,
                  ),
                  floatingLabelStyle: TextStyle(
                    color: Colors.transparent
                  ),
                  hintText: "Enter Your Mobile Number",
                  hintStyle: TextStyle(
                    color: colorConst.blue
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none
                  )
                ),
              ),
            ),
          ),
          gap,
          GestureDetector(
            onTap: () {
              setState(() {
                if(numController.text.length==9){
                  tap=true;
                }
              });
            },
            child: !tap?Container(
              width: width*0.3,
              height: width*0.1,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(width*0.03),
                color: Colors.lightBlueAccent
              ),
              child:Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("SEND OTP",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 16
                    ),
                  ),
                  SizedBox(
                    width: width*0.01,
                  ),
                  Icon(
                    Icons.send,
                    color: Colors.white,
                    size: 17,
                  )
                ],
              ),
            ): Column(
              children: [
                Text("Enter OTP",style: TextStyle(
                  color: colorConst.blue,
                  fontSize: width*0.04,
                  fontWeight: FontWeight.bold
                ),),
                Pinput(
                  length: 4,
                  controller: otpController,
                  focusedPinTheme: PinTheme(
                    textStyle: TextStyle(
                      color: Colors.white
                    ),
                    width: width*0.12,
                    height: width*0.13,
                    decoration: BoxDecoration(
                        color: colorConst.blue,
                        borderRadius: BorderRadius.circular(width*0.03),
                        border: Border.all(
                          color: Colors.transparent,
                        )
                    ),
                  ),
                  defaultPinTheme: PinTheme(
                    height: width*0.15,
                    width: width*0.115,
                    textStyle: TextStyle(
                      color: Colors.white
                    ),
                    decoration: BoxDecoration(
                      color: colorConst.blue,
                      borderRadius: BorderRadius.circular(width*0.03),
                    ),
                  ),
                ),
                gap,
                gap,
                InkWell(
                  onTap: () {
                    Navigator.push(context, CupertinoPageRoute(builder: (context) => XpayHome(number:numController.text),));
                  },
                  child: Container(
                    width: width*0.3,
                    height: width*0.1,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(width*0.03),
                        color: Colors.lightBlueAccent
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
                gap,
                GestureDetector(
                  onTap: () {
                    tap=false;
                    otpController.clear();
                    setState(() {
                    });
                  },
                  child: Text("re-send OTP",style: TextStyle(
                    color: colorConst.blue
                  ),),
                )
              ],
            )
          )
        ],
      ),
    );
  }
}
