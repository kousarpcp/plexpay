import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:plexpay/Const/colorConst.dart';
import 'package:plexpay/Const/imageConst.dart';
import 'package:plexpay/Const/widgets.dart';
import 'package:plexpay/api/login_api.dart';
import 'package:plexpay/featurs/details%20adding/screen/BottomNavigation.dart';
import 'package:plexpay/featurs/details%20adding/screen/plexpay%20authentication/number_submit_page.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../Const/Snackbar_toast_helper.dart';
import '../../../../Const/shared_preference.dart';
import '../../../../main.dart';

var username;
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
  var isCheck = false;
  @override
  void initState() {
    // TODO: implement initState
    getHome();
    super.initState();
  }

 Future<dynamic> getHome() async {
    var ck = await getSharedPrefrence(chek);
    print("checkkkkkk");
    print(ck);
    if(ck=="true"){
      var us = await getSharedPrefrence(currentusername);
      var pws =await getSharedPrefrence(currentpassword);

      setState(() {
        userController.text=us;
        passwordController.text=pws;
        isCheck=true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(context).size.width > 650 ?
      SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        body: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: height*0.3,
                  width: width*1,
                  margin: EdgeInsets.only(
                      top: width*0.07
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      LocaleText("Welcome To!",style: TextStyle(
                          fontSize: width*0.027,
                          fontWeight: FontWeight.w900
                      ),),
                      Center(child: Image.asset(ImageConst.plexpay,width: width*0.23,)),

                    ],
                  ),
                ),
                Container(
                  height: height*0.15,
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
                      Padding(
                        padding:  EdgeInsets.only(left: width*0.005),
                        child: LocaleText("Username"),
                      ),
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
                            hintText: Locales.string(context, 'Enter your Username'),
                            hintStyle: TextStyle(
                              fontSize: width*0.018,
                            ),
                            prefixIcon: Icon(
                              Icons.person,
                              size: width*0.025,
                            ),
                            prefixIconColor: colorConst.blue,
                            filled: true,
                            fillColor: Colors.blueGrey.shade50,
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.red,
                                  strokeAlign: width*0.01
                                ),
                                borderRadius: BorderRadius.circular(width*0.018)
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: height*0.03,
                ),
                Container(
                  height: height*0.15,
                  width: width*1,
                  margin: EdgeInsets.only(
                    right: width*0.05,
                    left: width*0.05,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding:  EdgeInsets.only(left: width*0.005),
                        child: LocaleText("Password"),
                      ),
                      Container(
                        width: width*1,
                        // height: height*0.075,
                        // color: Colors.yellow,
                        child: TextFormField(
                          controller: passwordController,
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          obscureText: tap?true:false,
                          obscuringCharacter: "*",
                          cursorColor: colorConst.blue,
                          decoration: InputDecoration(
                            constraints: BoxConstraints(
                              // maxHeight: height*0.07,
                                minHeight: height*0.065,
                                maxWidth: width*1,
                                minWidth: width*1
                            ),
                            hintText: Locales.string(context, 'Enter your Password'),
                            hintStyle: TextStyle(
                              fontSize: width*0.018,
                            ),
                            suffixIcon: InkWell(
                              onTap: () {
                                tap=!tap;
                                setState(() {

                                });
                              },
                              child: tap?Icon(
                                Icons.visibility_off,
                                size: width*0.025,
                              ):
                              Icon(
                                Icons.visibility,
                                size: width*0.025,
                              ),
                            ),
                            suffixIconColor: colorConst.blue,
                            prefixIcon: Icon(
                              CupertinoIcons.lock,
                              size: width*0.025,
                            ),
                            prefixIconColor: colorConst.blue,
                            filled: true,
                            fillColor: Colors.blueGrey.shade50,
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                                borderRadius: BorderRadius.circular(width*0.018)
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                gap,
                Padding(
                  padding:  EdgeInsets.only(left: width*0.035),
                  child: Container(
                    padding:  EdgeInsets.symmetric(horizontal: 30),
                    child:   Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                      SizedBox(
                          height: 24.0,
                          width: 24.0,
                          child: Theme(
                            data: ThemeData(
                                unselectedWidgetColor: colorConst.blue // Your color
                            ),
                            child: Checkbox(
                                activeColor: colorConst.blue,
                                value: isCheck,
                                onChanged: (v)async{
                                  setState(() {
                                    isCheck=v!;


                                  });

                                  if(isCheck==true&&userController.text.isNotEmpty&&passwordController.text.isNotEmpty){
                                    var un = await sharedPrefrence(currentusername, userController.text.toString() );
                                    var pass = await sharedPrefrence(currentpassword, passwordController.text.toString());
                                    var ck = await sharedPrefrence(chek, "true");
                                  }else{
                                    var un = await sharedPrefrence(userController, null );
                                    var pass = await sharedPrefrence(passwordController, null);
                                    var ck = await sharedPrefrence(chek, null);

                                  }
                                }),
                          )),
                      SizedBox(width: 10.0),
                      LocaleText("Remember Me",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize:12,
                            fontWeight: FontWeight.bold,))
                    ]),
                  ),
                ),
                gap,
                InkWell(
                  onTap: () async {

                    if(userController.text.isNotEmpty&&
                    passwordController.text.isNotEmpty)
                    {
                      var rsp=await loginApi(userController.text.toString(),passwordController.text.toString());

                      print("rspppp");
                      print(rsp);
                      if (rsp['success'] == true) {
                        var id = await sharedPrefrence("userId", rsp['user_id']);
                        var token = await sharedPrefrence("token", rsp['access_token']);

                        var name = await sharedPrefrence(shopname, rsp['name']);
                        username=name;
                        Navigator.pushAndRemoveUntil(context, CupertinoPageRoute(builder: (context) => BottomNavigation(),), (route) => false);
                        showToast("Login Success!");
                        print("wrking");
                        print(rsp['user_id']);
                        print(rsp['access_token']);

                      } else {
                        showToast("Invalid Credentials!");
                        setState(() {
                        });
                      }



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
                    width: width*0.55,
                    height: height*0.07,
                    decoration: BoxDecoration(
                      borderRadius:  BorderRadius.circular(width*0.022),
                      color: colorConst.blue
                    ),
                    child: Center(child: Text("Login",style: TextStyle(
                        color: Colors.white,fontSize: width*0.02
                    ),)),
                  ),
                ),
                SizedBox(
                  height: height*0.02,
                ),
                Text("Don't have an account?",style: TextStyle(
                  fontSize: width*0.013
                ),),
                SizedBox(
                  height: height*0.01,
                ),
                InkWell(
                  onTap: () {
                    // Navigator.push(context, CupertinoPageRoute(builder: (context) => NumberSubmitPage(),));
                  },
                  child: Container(
                    width: width*0.55,
                    height: height*0.07,
                    decoration: BoxDecoration(
                        borderRadius:  BorderRadius.circular(width*0.022),
                        color: colorConst.blue
                    ),
                    child: Center(child: Text("Sign up",style: TextStyle(
                        color: Colors.white,fontSize: width*0.02
                    ),)),
                  ),
                ),
                SizedBox(
                  height: height*0.05,
                )

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
    ):
     SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        body: Form(
          key: formKey,
          child: SingleChildScrollView(
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
                      LocaleText("Welcome To!",style: TextStyle(
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
                      LocaleText("Username"),
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
                            hintText: Locales.string(context, 'Enter your Username'),
                            hintStyle: TextStyle(
                              fontSize: MediaQuery.of(context).size.width > 600?width*0.03:width*0.04,
                            ),
                            prefixIcon: Icon(
                              Icons.person,
                              size: MediaQuery.of(context).size.width > 600?width*0.05:width*0.06,
                            ),
                            prefixIconColor: colorConst.blue,
                            filled: true,
                            fillColor: Colors.blueGrey.shade50,
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.red,
                                  strokeAlign: width*0.01
                                ),
                                borderRadius: BorderRadius.circular(width*0.03)
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: height*0.02,
                ),
                Container(
                  height: height*0.11,
                  width: width*1,
                  margin: EdgeInsets.only(
                    right: width*0.05,
                    left: width*0.05,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      LocaleText("Password"),
                      Container(
                        width: width*1,
                        // height: height*0.075,
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
                            hintText: Locales.string(context, 'Enter your Password'),
                            hintStyle: TextStyle(
                              fontSize: MediaQuery.of(context).size.width > 600?width*0.03:width*0.04,
                            ),
                            suffixIcon: InkWell(
                              onTap: () {
                                tap=!tap;
                                setState(() {

                                });
                              },
                              child: tap?Icon(
                                Icons.visibility_off,
                                size: MediaQuery.of(context).size.width > 600?width*0.05:width*0.06,
                              ):
                              Icon(
                                Icons.visibility,
                                size: MediaQuery.of(context).size.width > 600?width*0.05:width*0.06,
                              ),
                            ),
                            suffixIconColor: colorConst.blue,
                            prefixIcon: Icon(
                              CupertinoIcons.lock,
                              size: MediaQuery.of(context).size.width > 600?width*0.05:width*0.06,
                            ),
                            prefixIconColor: colorConst.blue,
                            filled: true,
                            fillColor: Colors.blueGrey.shade50,
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
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
                  padding:  EdgeInsets.symmetric(horizontal: width*0.09),
                  child:   Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                    SizedBox(
                        height: height*0.03,
                        width: width*0.07,
                        child: Theme(
                          data: ThemeData(
                              unselectedWidgetColor: colorConst.blue // Your color
                          ),
                          child: Checkbox(
                              activeColor: colorConst.blue,
                              value: isCheck,
                              onChanged: (v)async{
                                setState(() {
                                  isCheck=v!;


                                });

                                if(isCheck==true&&userController.text.isNotEmpty&&passwordController.text.isNotEmpty){
                                  var un = await sharedPrefrence(currentusername, userController.text.toString() );
                                  var pass = await sharedPrefrence(currentpassword, passwordController.text.toString());
                                  var ck = await sharedPrefrence(chek, "true");
                                }else{
                                  var un = await sharedPrefrence(userController, null );
                                  var pass = await sharedPrefrence(passwordController, null);
                                  var ck = await sharedPrefrence(chek, null);

                                }
                              }),
                        )),
                    SizedBox(width: MediaQuery.of(context).size.width > 600?width*0.015:width*0.03),
                    LocaleText("Remember Me",
                        style: TextStyle(
                          color: Colors.black,
                          // fontSize: width*0.035,
                          fontWeight: FontWeight.bold,))
                  ]),
                ),
                gap,
                InkWell(
                  onTap: () async {

                    if(userController.text.isNotEmpty&&
                    passwordController.text.isNotEmpty)
                    {
                      var rsp=await loginApi(userController.text.toString(),passwordController.text.toString());

                      print("rspppp");
                      print(rsp);
                      if (rsp['success'] == true) {
                        var id = await sharedPrefrence("userId", rsp['user_id']);
                        var token = await sharedPrefrence("token", rsp['access_token']);

                        var name = await sharedPrefrence(shopname, rsp['name']);
                        username=name;
                        Navigator.pushAndRemoveUntil(context, CupertinoPageRoute(builder: (context) => BottomNavigation(),), (route) => false);
                        showToast("Login Success!");
                        print("wrking");
                        print(rsp['user_id']);
                        print(rsp['access_token']);

                      } else {
                        showToast("Invalid Credentials!");
                        setState(() {
                        });
                      }



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
                    child: Center(child: Text("Login",style: TextStyle(
                        color: Colors.white
                    ),)),
                  ),
                ),
                SizedBox(
                  height: height*0.032,
                ),
                Text("Don't have an account?",style: TextStyle(
                  fontSize: width*0.035
                ),),
                SizedBox(
                  height: height*0.01,
                ),
                InkWell(
                  onTap: () {
                    // Navigator.push(context, CupertinoPageRoute(builder: (context) => NumberSubmitPage(),));
                  },
                  child: Container(
                    width: width*0.8,
                    height: height*0.065,
                    decoration: BoxDecoration(
                        borderRadius:  BorderRadius.circular(width*0.1),
                        color: colorConst.blue
                    ),
                    child: Center(child: Text("Sign up",style: TextStyle(
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
