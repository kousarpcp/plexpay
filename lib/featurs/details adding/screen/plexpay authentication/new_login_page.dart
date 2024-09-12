import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plexpay/featurs/details%20adding/screen/plexpay%20authentication/number_submit_page.dart';

import '../../../../Const/colorConst.dart';
import '../../../../Const/imageConst.dart';
import '../../../../Const/widgets.dart';
import '../../../../main.dart';
import 'add_details_page.dart';

class NewLoginPage extends StatefulWidget {
  const NewLoginPage({super.key});

  @override
  State<NewLoginPage> createState() => _NewLoginPageState();
}

class _NewLoginPageState extends State<NewLoginPage> {
  TextEditingController usernameController= TextEditingController();
  TextEditingController passwordController= TextEditingController();
  TextEditingController confirmuserController= TextEditingController();
  TextEditingController confirmpassController= TextEditingController();
  final formKey =GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              // SizedBox(
              //   height: width*0.1,
              // ),
              Center(
                child: Container(
                  height: width*0.7,
                  width: width*0.6,
                  child: Image(image: AssetImage(ImageConst.newlogin)),
                ),
              ),
              SizedBox(height: width*0.03,),
              Text("Welcome to Plexpay",style: TextStyle(
                  fontSize: width*0.08,
                  fontWeight: FontWeight.bold
              ),
              textAlign: TextAlign.center,),
              SizedBox(
                height: width*0.05,
              ),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    Container(
                      width: width*0.85,
                      height: width*0.11,
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        cursorColor: colorConst.blue,
                        cursorHeight: width*0.06,
                        controller: usernameController,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                            hoverColor: colorConst.blue,
                            labelText: "USERNAME",
                            labelStyle: TextStyle(
                                color: colorConst.blue.withOpacity(0.5),
                                fontSize: width*0.038
                            ),
                            floatingLabelStyle: TextStyle(
                                color: colorConst.blue
                            ),
                            contentPadding: EdgeInsets.only(bottom: width*0.012,left: width*0.05),

                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(width*0.05),
                                borderSide: BorderSide(
                                    color: colorConst.blue,
                                    width: width*0.005
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
                    gap,
                    Container(
                      width: width*0.85,
                      height: width*0.11,
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        cursorColor: colorConst.blue,
                        cursorHeight: width*0.06,
                        controller: passwordController,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                            hoverColor: colorConst.blue,
                            labelText: "PASSWORD",
                            labelStyle: TextStyle(
                                color: colorConst.blue.withOpacity(0.5),
                                fontSize: width*0.038
                            ),
                            floatingLabelStyle: TextStyle(
                                color: colorConst.blue
                            ),
                            contentPadding: EdgeInsets.only(bottom: width*0.012,left: width*0.05),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(width*0.05),
                                borderSide: BorderSide(
                                    color: colorConst.blue,
                                    width: width*0.005
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
                    Container(
                      width: width*0.85,
                      height: width*0.11,
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        cursorColor: colorConst.blue,
                        cursorHeight: width*0.06,
                        controller: confirmpassController,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                            hoverColor: colorConst.blue,
                            labelText: "CONFIRM PASSWORD",
                            labelStyle: TextStyle(
                                color: colorConst.blue.withOpacity(0.5),
                                fontSize: width*0.038
                            ),
                            floatingLabelStyle: TextStyle(
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
                  ],
                ),
              ),
              SizedBox(
                height: width*0.07,
              ),
              InkWell(
                onTap: () {
                  // if(otpController.text.isNotEmpty){
                    Navigator.push(context,CupertinoPageRoute(builder: (context) => AddDetailsPage(),));
                  // }else{
                  //   showToast("Enter your verification code");
                  // }
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
      ),
    );
  }
}
