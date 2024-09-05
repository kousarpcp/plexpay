

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:plexpay/api/plexbillLogin_postApi.dart';
import 'package:plexpay/featurs/details%20adding/screen/plexBill_homePage.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Const/Snackbar_toast_helper.dart';
import '../../../Const/colorConst.dart';
import '../../../Const/imageConst.dart';
import '../../../Const/shared_preference.dart';
import '../../../Const/widgets.dart';
import '../../../api/plexbillLogin_getApi.dart';
import '../../../main.dart';
import 'login_page.dart';
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
  // var token;
  @override
  void initState() {
    // getToken();

    // TODO: implement initState
  }
  // Future<String?> getToken() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   token= prefs.getString('token');
  // }
   getHome() async {
     // var rs = await plexbillLoginPostApi(userController.text.toString(), passwordController.text.toString(),token.toString() );
    var rsps = await plexbillLoginGetApi();
    print(globaltoken);
    print("mmmmmmm");
    print("dsssssssssss");
    print(rsps);
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
        rsps;
      });

    }
  }
  @override
  // void dispose() {
  //   userController.dispose();
  //   passwordController.dispose();
  //   super.dispose();
  // }
  Widget build(BuildContext context) {
    return Scaffold(
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
                          getHome();
                          print(globaltoken);
                          print(userController.text);
                          print(passwordController.text);
                          print(globaltoken);
                          print("eeeeeeeeeeeeeee");
                          var rsp=await plexbillLoginPostApi(userController.text,passwordController.text);
                          print(globaltoken);
                          print("jjjjjjjjjjjjjjjjjjj");
                          print("rspppp");
                          print(rsp);
                          if ( rsp['success'] == true) {
                            var id = await sharedPrefrence(
                                "userId", rsp['id']);
                            id=id;
                            var token =
                                await sharedPrefrence(
                                "token", rsp['token']);
                            token=globaltoken;

                            var name = await sharedPrefrence(
                                shopname, rsp['username']);
                            username = username;
                            Navigator.pushAndRemoveUntil(context, CupertinoPageRoute(builder: (context) => Plexbill_home(),), (route) => false);
                           // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>Plexbill_home() ,));
                            showToast("Login Success!");
                            print("wrking");
                            print(rsp['user_id']);
                            print(rsp['token']);
                          }

                          else {
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
