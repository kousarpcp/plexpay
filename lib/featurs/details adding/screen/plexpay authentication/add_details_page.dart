import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:plexpay/Const/colorConst.dart';
import 'package:plexpay/Const/widgets.dart';
import 'package:plexpay/featurs/details%20adding/screen/plexpay%20authentication/login_page.dart';

import '../../../../Const/imageConst.dart';
import '../../../../main.dart';

class AddDetailsPage extends StatefulWidget {
  const AddDetailsPage({super.key});

  @override
  State<AddDetailsPage> createState() => _AddDetailsPageState();
}

class _AddDetailsPageState extends State<AddDetailsPage> {
  TextEditingController numberController=TextEditingController();
  TextEditingController nationalityController=TextEditingController();
  TextEditingController idController=TextEditingController();
  TextEditingController expdateController=TextEditingController();
  TextEditingController stateController=TextEditingController();
  TextEditingController emailController=TextEditingController();
  TextEditingController nameController=TextEditingController();
  TextEditingController surnameController=TextEditingController();
  final formKey =GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(context, CupertinoPageRoute(builder:(context) => Login(),));
            },
            child: Text("Skip",style: TextStyle(
              fontSize: width*0.045,
              color: colorConst.blue,
            ),),
          ),
          SizedBox(
           width: width*0.05,
          )
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  height: width*0.5,
                  width: width*0.6,
                  child: Image(image: AssetImage(ImageConst.userregistration)),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: width*0.08,),
                  Text("Hello!\nAdd your details",style: TextStyle(
                    fontSize: width*0.08,
                    fontWeight: FontWeight.bold
                  ),),
                ],
              ),
              SizedBox(
                height: width*0.04,
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
                        controller: nameController,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                            hoverColor: colorConst.blue,
                            labelText: "FULL NAME",
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
                    gap,
                    Container(
                      width: width*0.85,
                      height: width*0.11,
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        cursorColor: colorConst.blue,
                        cursorHeight: width*0.06,
                        controller: surnameController,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                            hoverColor: colorConst.blue,
                            labelText: "SURNAME",
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
                    gap,
                    Container(
                      width: width*0.85,
                      height: width*0.11,
                      child: TextFormField(
                        keyboardType: TextInputType.phone,
                        cursorColor: colorConst.blue,
                        cursorHeight: width*0.06,
                        controller: numberController,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(9)
                        ],
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                            hoverColor: colorConst.blue,
                            prefix: Text("+971 "),
                            labelText: "MOBILE NUMBER",
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
                    gap,
                    Container(
                      width: width*0.85,
                      height: width*0.11,
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        cursorColor: colorConst.blue,
                        cursorHeight: width*0.06,
                        controller: emailController,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                            hoverColor: colorConst.blue,
                            labelText: "EMAIL ADDRESS",
                            labelStyle: TextStyle(
                                fontSize: width*0.038,
                              color: colorConst.blue.withOpacity(0.5),
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
                    gap,
                    Container(
                      width: width*0.85,
                      height: width*0.11,
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        cursorColor: colorConst.blue,
                        cursorHeight: width*0.06,
                        controller: nationalityController,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                            hoverColor: colorConst.blue,
                            labelText: "NATIONALITY",
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
                    gap,
                    Container(
                      width: width*0.85,
                      height: width*0.11,
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        cursorColor: colorConst.blue,
                        cursorHeight: width*0.06,
                        controller: idController,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                            hoverColor: colorConst.blue,
                            labelText: "ID NUMBER",
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
                    gap,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: width*0.4,
                          height: width*0.11,
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            cursorColor: colorConst.blue,
                            cursorHeight: width*0.06,
                            controller: expdateController,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                                hoverColor: colorConst.blue,
                                labelText: "ID EXPIRY DATE",
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
                        SizedBox(
                          width: width*0.04,
                        ),
                        Container(
                          width: width*0.4,
                          height: width*0.11,
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            cursorColor: colorConst.blue,
                            cursorHeight: width*0.06,
                            controller: stateController,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                                hoverColor: colorConst.blue,
                                labelText: "EMIRATE STATE",
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
                    gap,
                  ],
                ),
              ),
          
              SizedBox(
                height: width*0.04,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context, CupertinoPageRoute(builder: (context) => Login(),));
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
              SizedBox(
                height: width*0.04,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
