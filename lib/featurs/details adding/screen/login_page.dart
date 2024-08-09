import 'package:flutter/material.dart';
import 'package:plexpay/Const/colorConst.dart';

import '../../../main.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController userController =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Center(child: Text("Welcome !",style: TextStyle(fontSize: width*0.09,fontWeight: FontWeight.w600),)),
            Container(
              width: width*0.85,
              height: width*0.15,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(width*0.03)
              ),
              
              child: TextFormField(
                controller:userController ,

                // textCapitalization: TextCapitalization.sentences,
                keyboardType:TextInputType.text ,
                textInputAction: TextInputAction.next,
                // maxLines:6,
                // minLines: 2,
                // maxLength: 4,
                // obscureText: true,
                // obscuringCharacter: "*",

                style: TextStyle(
                    fontSize: width*0.05,
                    fontWeight: FontWeight.w600
                ),
                // autovalidateMode: AutovalidateMode.onUserInteraction,
                // validator: (value) {
                //   if(!emailValidation.hasMatch(value!)){
                //     return"enter valid email";
                //   }else{
                //     return null;
                //   }
                // },
                decoration: InputDecoration(
                  fillColor: Colors.blue,
                  // suffix: Icon(Icons.email),
                  // suffixText:"kousar",
                  // labelText: "Username",
                  labelStyle: TextStyle(
                      fontSize: width*0.05,
                      fontWeight: FontWeight.w500,color: Colors.black
                  ),
                  // hintText: "Please Enter Your Name/Email",
                  hintStyle: TextStyle(
                    fontSize: width*0.05,
                    fontWeight: FontWeight.w600,
                  ),
                  border: OutlineInputBorder(
                    // borderSide: BorderSide(
                    //   color: colorConst.lightgrey,
                    // ),
                    borderRadius: BorderRadius.circular(width*0.03),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: colorConst.lightgrey,
                    ),
                    borderRadius: BorderRadius.circular(width*0.03),
                  ),

                ),
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
    );
  }
}
