import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:plexpay/Const/colorConst.dart';
import 'package:plexpay/Const/imageConst.dart';
import 'package:plexpay/featurs/details%20adding/screen/plexpay%20authentication/otpPage.dart';

import '../../../../Const/widgets.dart';
import '../../../../main.dart';

class NumberSubmitPage extends StatefulWidget {
  const NumberSubmitPage({super.key});

  @override
  State<NumberSubmitPage> createState() => _NumberSubmitPageState();
}

class _NumberSubmitPageState extends State<NumberSubmitPage> {
  TextEditingController numController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        // leading: InkWell(
        //   onTap: () {
        //     Navigator.pop(context);
        //   },
        //     child: Icon(CupertinoIcons.back)),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(width*0.04),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: height*0.06),
              Center(
                child: Container(
                  height: width*0.6,
                  width: width*0.6,
                  child: Image(image: AssetImage(ImageConst.numberpagepng)),
                ),
              ),
              SizedBox(
                height: width*0.1,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("OTP Verification",style: TextStyle(
                    fontSize: width*0.05,
                    fontWeight: FontWeight.bold
                  ),),
                  Text("Enter phone number to send \none time Password",style: TextStyle(
                    fontWeight:FontWeight.w100,
                    color: colorConst.grey,
                    fontSize: width*0.042
                  ),),
                  gap,
                  Container(
                    width: width*0.8,
                    height: width*0.13,
                    child: TextFormField(
                      keyboardType: TextInputType.phone,
                      cursorColor: colorConst.blue,
                      cursorHeight: width*0.06,
                      controller: numController,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(9)
                      ],
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        hoverColor: colorConst.blue,
                        prefix: Text("+971 "),
                        labelText: "Enter your phone number",
                        labelStyle: TextStyle(
                          color: colorConst.blue
                        ),
                        contentPadding: EdgeInsets.only(bottom: width*0.012,left: width*0.05),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(width*0.05),
                          borderSide: BorderSide(
                            color: colorConst.blue
                          )
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: colorConst.blue,
                            width: width*0.005
                          ),
                          borderRadius: BorderRadius.circular(width*0.05)
                        )
                      ),
                    ),
                  ),
                  SizedBox(
                    height: width*0.08,
                  ),
                  InkWell(
                    onTap: () {
                      if(numController.text.length==9){
                        Navigator.push(context, CupertinoPageRoute(builder: (context) => Otppage(),));
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
                        child: Text("Continue",style: TextStyle(
                          color: Colors.white,
                          fontSize: width*0.045
                        ),),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
