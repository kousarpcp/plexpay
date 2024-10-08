

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:plexpay/featurs/details%20adding/plexBill/plexBill_homePage.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Const/Snackbar_toast_helper.dart';
import '../../../Const/colorConst.dart';
import '../../../Const/imageConst.dart';
import '../../../Const/shared_preference.dart';
import '../../../Const/shared_preference1.dart';
import '../../../Const/widgets.dart';
import '../../../api/plexbillLogin_postApi.dart';
import '../../../main.dart';

class plexbill_login extends StatefulWidget {
  const plexbill_login({super.key});
  @override
  State<plexbill_login> createState() => _plexbill_loginState();
}
class _plexbill_loginState extends State<plexbill_login> {

  bool tap=true;
  bool tick=false;
  final formKey =GlobalKey<FormState>();
  TextEditingController userController =TextEditingController();
  TextEditingController passwordController =TextEditingController();
  var isCheck = false;
  var token;
  @override
  void initState() {


    // TODO: implement initState
  }
  // Future<String?> getToken() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   token= prefs.getString('token');
  // }

  @override
  // void dispose() {
  //   userController.dispose();
  //   passwordController.dispose();
  //   super.dispose();
  // }
  Widget build(BuildContext context) {
    return MediaQuery.of(context).size.width > 650 ?
      Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Form(
              key: formKey,
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
                    height: MediaQuery.of(context).size.height>520?height*0.15:height*0.22,
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
                                  minHeight: height*0.065,
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
                  gap,
                  Container(
                    height: MediaQuery.of(context).size.height>520?height*0.15:height*0.22,
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
                          // height: height*0.1,
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
                              hintText:Locales.string(context, 'Enter your Password') ,
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
                                      var un = await plexbilllogin("username", userController.text.toString() );
                                      var pass = await plexbilllogin("password", passwordController.text.toString());
                                      var ck = await plexbilllogin(chek1, "true");
                                    }else{
                                      var un = await plexbilllogin(userController, null );
                                      var pass = await plexbilllogin(passwordController, null);
                                      var ck = await plexbilllogin(chek1, null);

                                    }
                                  }),
                            )),
                        SizedBox(width: 10.0),
                        LocaleText("Remember Me",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
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
                          print("Username: ${userController.text}");
                          print("Password: ${passwordController.text}");
                          print("eeeeeeeeeeeeeee");
                          var rsp=await plexbillLoginApi(userController.text,passwordController.text,);
                          print(token);
                          print("jjjjjjjjjjjjjjjjjjj");
                          print("rspppp");
                          print(rsp);
                          if ( rsp['users']!=null) {
                            print("jjjjjjjjjjjjjjjjjjj");
                            print(rsp);
                            var id = await plexbilllogin("userId1", rsp['userdatas'][0]["username"]);
                            var username= await plexbilllogin("username",rsp["userdatas"][0]["username"] );
                            var password= await plexbilllogin("password",passwordController.text );

                            print("wwwwwwwwwwwwwwwwwwwwwwwwwww");
                            print("Login success");
                            Navigator.pushAndRemoveUntil(context, CupertinoPageRoute(builder: (context) => Plexbill_home(),), (route) => false);
                           // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>Plexbill_home() ,));
                            showToast("Login Success!");
                            print("wrking");

                          }

                          else {
                            // print("Login failed. Response: $rsp");
                            showToast("Invalid Credentials!");

                          }

                        }

                      else{
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
                      width: width*0.3,
                      height: MediaQuery.of(context).size.height>520?height*0.07:height*0.1,
                      decoration: BoxDecoration(
                          borderRadius:  BorderRadius.circular(width*0.01),
                          color: colorConst.blue
                      ),
                      child: Center(child: LocaleText("Sign in",style: TextStyle(
                          color: Colors.white,fontSize: width*0.02
                      ),)),
                    ),
                  ),
                  SizedBox(
                    height: height*0.06,
                  )

                  // TextFormField(
                  //   controller: userController,
                  //   textInputAction: TextInputAction.next,
                  //   keyboardType: TextInputType.text,
                  //
                  // )
                ],
              ),
            )

          ],
        ),
      ),
    ):
      Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Form(
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
                        LocaleText("Password"),
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
                              hintText:Locales.string(context, 'Enter your Password') ,
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
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
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
                                    var un = await plexbilllogin("username", userController.text.toString() );
                                    var pass = await plexbilllogin("password", passwordController.text.toString());
                                    var ck = await plexbilllogin(chek1, "true");
                                  }else{
                                    var un = await plexbilllogin(userController, null );
                                    var pass = await plexbilllogin(passwordController, null);
                                    var ck = await plexbilllogin(chek1, null);

                                  }
                                }),
                          )),
                      SizedBox(width: 10.0),
                      LocaleText("Remember Me",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,))
                    ]),
                  ),
                  gap,
                  InkWell(
                    onTap: () async {
                      if(userController.text.isNotEmpty&&
                          passwordController.text.isNotEmpty)
                        {
                          print("Username: ${userController.text}");
                          print("Password: ${passwordController.text}");
                          print("eeeeeeeeeeeeeee");
                          var rsp=await plexbillLoginApi(userController.text,passwordController.text,);
                          print(token);
                          print("jjjjjjjjjjjjjjjjjjj");
                          print("rspppp");
                          print(rsp);
                          if ( rsp['users']!=null) {
                            print("jjjjjjjjjjjjjjjjjjj");
                            print(rsp);
                            var id = await plexbilllogin("userId1", rsp['userdatas'][0]["username"]);
                            var username= await plexbilllogin("username",rsp["userdatas"][0]["username"] );
                            var password= await plexbilllogin("password",passwordController.text );

                            print("wwwwwwwwwwwwwwwwwwwwwwwwwww");
                            print("Login success");
                            Navigator.pushAndRemoveUntil(context, CupertinoPageRoute(builder: (context) => Plexbill_home(),), (route) => false);
                           // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>Plexbill_home() ,));
                            showToast("Login Success!");
                            print("wrking");

                          }

                          else {
                            // print("Login failed. Response: $rsp");
                            showToast("Invalid Credentials!");

                          }

                        }

                      else{
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
                      height: height*0.065,
                      decoration: BoxDecoration(
                          borderRadius:  BorderRadius.circular(width*0.022),
                          color: colorConst.blue
                      ),
                      child: Center(child: LocaleText("Sign in",style: TextStyle(
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
            )

          ],
        ),
      ),
    );
  }
}
