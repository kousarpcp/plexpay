import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plexpay/featurs/details%20adding/screen/plexBill_homePage.dart';

import '../../../Const/colorConst.dart';
import '../../../Const/imageConst.dart';
import '../../../Const/widgets.dart';
import '../../../main.dart';

class plexbill_login extends StatefulWidget {
  const plexbill_login({super.key});
  @override
  State<plexbill_login> createState() => _plexbill_loginState();
}
class _plexbill_loginState extends State<plexbill_login> {
  bool tap=true;
  final formKey =GlobalKey<FormState>();
  TextEditingController userController =TextEditingController();
  TextEditingController passwordController =TextEditingController();
  var isCheck = false;
  @override
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
                                }),
                          )),
                      SizedBox(width: 10.0),
                      Text("Remember Me",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,))
                    ]),
                  ),
                  gap,
                  InkWell(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(context, CupertinoPageRoute(builder: (context) => Plexbill_home(),), (route) => false);
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
            )
        
          ],
        ),
      ),
    );
  }
}
