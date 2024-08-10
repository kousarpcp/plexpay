import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plexpay/Const/colorConst.dart';
import 'package:plexpay/Const/imageConst.dart';
import 'package:plexpay/Const/widgets.dart';
import 'package:plexpay/featurs/details%20adding/screen/BottomNavigation.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../main.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool tap=true;
  bool tick=false;
  final formKey =GlobalKey<FormState>();
  TextEditingController userController =TextEditingController();
  TextEditingController passwordController =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Container(
          padding: EdgeInsets.all(width*0.03),
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(ImageConst.login),fit: BoxFit.cover,opacity: width*0.005)
          ),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Container(
                  height: height*0.3,
                  width: width*1,
                  margin: EdgeInsets.only(
                      top: width*0.15
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Welcome To!",style: TextStyle(
                          fontSize: width*0.07,
                          fontWeight: FontWeight.w900
                      ),),
                      Center(child: Image.asset(ImageConst.plexpay,width: width*0.5,)),

                    ],
                  ),
                ),
                Container(
                  // height: width*0.22,
                  width: width*1,
                  margin: EdgeInsets.only(
                    right: width*0.05,
                    left: width*0.05,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("Username"),
                      Container(
                        width: width*1,
                        // height: height*0.07,
                        // color: Colors.yellow,
                        child: TextFormField(
                          controller: userController,
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          autocorrect: true,
                          cursorColor: colorConst.blue,
                          decoration: InputDecoration(
                            constraints: BoxConstraints(
                              // maxHeight: height*0.07,
                                minHeight: height*0.06,
                                maxWidth: width*1,
                                minWidth: width*1
                            ),
                            hintText: "Enter your Username",
                            hintStyle: TextStyle(
                              fontSize: width*0.04,
                            ),
                            prefixIcon: Icon(
                              Icons.person,
                              size: width*0.06,
                            ),
                            prefixIconColor: colorConst.blue,
                            filled: true,
                            fillColor: Colors.blueGrey.shade50,
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(width*0.03)
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                gap,
                Container(
                  height: width*0.22,
                  width: width*1,
                  margin: EdgeInsets.only(
                    right: width*0.05,
                    left: width*0.05,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("Password"),
                      Container(
                        width: width*1,
                        height: height*0.07,
                        // color: Colors.yellow,
                        child: TextFormField(
                          controller: passwordController,
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          obscureText: tap?true:false,
                          obscuringCharacter: "*",
                          cursorColor: colorConst.blue,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(
                                top: width*0.005
                            ),
                            hintText: "Enter your Password",
                            hintStyle: TextStyle(
                              fontSize: width*0.04,
                            ),
                            suffixIcon: InkWell(
                              onTap: () {
                                tap=!tap;
                                setState(() {

                                });
                              },
                              child: tap?Icon(
                                Icons.visibility_off,
                                size: width*0.06,
                              ):
                              Icon(
                                Icons.visibility,
                                size: width*0.06,
                              ),
                            ),
                            suffixIconColor: colorConst.blue,
                            prefixIcon: Icon(
                              CupertinoIcons.lock,
                              size: width*0.06,
                            ),
                            prefixIconColor: colorConst.blue,
                            filled: true,
                            fillColor: Colors.blueGrey.shade50,
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(width*0.02)
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                gap,
                InkWell(
                  onTap: () async {

                    if(userController.text.isNotEmpty&&
                    passwordController.text.isNotEmpty)
                    {
                      SharedPreferences _prefs = await SharedPreferences.getInstance();
                      _prefs.setBool("login", true);

                      Navigator.pushAndRemoveUntil(context, CupertinoPageRoute(builder: (context) => BottomNavigation(),), (route) => false);
                    }else{
                      if(userController.text ==""){
                        QuickAlert.show(
                          barrierDismissible: false,
                          confirmBtnColor: Colors.red.shade600,
                          context: context,
                          type: QuickAlertType.error,
                          title: 'Oops...',
                          text: 'Sorry, please Enter your Username',
                        );
                        return;
                      }
                      if(passwordController.text ==""){
                        QuickAlert.show(
                          barrierDismissible: false,
                          confirmBtnColor: Colors.red.shade600,
                          context: context,
                          type: QuickAlertType.error,
                          title: 'Oops...',
                          text: 'Sorry, please Enter your password',
                        );
                        return;
                      }
                    }
                  },
                  child: Container(
                    width: width*0.8,
                    height: height*0.065,
                    decoration: BoxDecoration(
                      borderRadius:  BorderRadius.circular(width*0.1),
                      color: colorConst.blue
                    ),
                    child: Center(child: Text("Sign in",style: TextStyle(
                        color: Colors.white
                    ),)),
                  ),
                ),


                // TextFormField(
                //   controller: userController,
                //   textInputAction: TextInputAction.next,
                //   keyboardType: TextInputType.text,
                //
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}