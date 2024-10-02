import 'package:flutter/material.dart';
import 'package:plexpay/Const/colorConst.dart';
import 'package:plexpay/Const/snackbar_toast_helper.dart';

import '../../../../api/change_password_API.dart';
import '../../../../main.dart';


class ChangePIN extends StatefulWidget {
  @override
  _ChangePINState createState() => _ChangePINState();
}

class _ChangePINState extends State<ChangePIN> {

  TextEditingController passController = TextEditingController();
  TextEditingController nwpassController = TextEditingController();
  TextEditingController repassController = TextEditingController();
  var onClick= false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        // leading: IconButton(
        //     onPressed: () {
        //       Navigator.pop(context);
        //     },
        //     icon: Icon(
        //       Icons.arrow_back_ios_outlined,
        //       color: Colors.black,
        //     )),
        title: Row(
          children: [
            Padding(
                padding: const EdgeInsets.all(5.0),
                child: Icon(
                  Icons.edit,
                  color: colorConst.blue,
                  size: width*0.04,
                )),
            SizedBox(
              width: 5,
            ),
            Text(
              "Change Password",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 20),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(15),
          child: Wrap(
            runSpacing: 10,
            crossAxisAlignment: WrapCrossAlignment.center,
            alignment: WrapAlignment.center,
            children: [

              SizedBox(
                height: MediaQuery.of(context).size.height / 9,
              ),
              textfield1("Current Password"),
              textfield2("New Password"),
              textfield3("Confirm New Password"),
              button("UPDATE NOW")
            ],
          ),
        ),
      ),
    );
  }

  Widget textfield1(String label) {
    return TextFormField(
      controller: passController,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.black26, fontSize: 15),
        fillColor: colorConst.blue,
        border:  OutlineInputBorder(
          borderRadius:  BorderRadius.circular(width*0.03),
          borderSide:  BorderSide(),
        ),
      ),
    );
  }
  Widget textfield2(String label) {
    return TextFormField(
      controller: nwpassController,

      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.black26, fontSize: 15),
        fillColor: colorConst.blue,
        border:  OutlineInputBorder(
          borderRadius:  BorderRadius.circular(width*0.03),
          borderSide:  BorderSide(),
        ),
      ),
    );
  }
  Widget textfield3(String label) {
    return TextFormField(
      controller: repassController,

      decoration:  InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.black26, fontSize: 15),
        fillColor: colorConst.blue,
        border:  OutlineInputBorder(
          borderRadius:  BorderRadius.circular(width*0.03),
          borderSide:  BorderSide(),
        ),
      ),
    );
  }

  Widget button(String label) {
    return onClick==true?Container(
      height: 50,
      child: Center(child: CircularProgressIndicator())
      ,
    ):GestureDetector(
      onTap: () async{

        if(nwpassController.text.toString()!=repassController.text.toString()){
          showToastError("Password Incorrect!");
        }else{
          setState(() {
            onClick=true;
          });

          var rsp = await changePassApi(passController.text.toString(),nwpassController.text.toString());
          print("rspppp");
          print(rsp);
          if(rsp['success']==true){
            showToastError("Password Updated!");
            setState(() {
              onClick=false;
            });
            Navigator.pop(context);
          }else{
            showToastError("Password update failed!");
            setState(() {
              onClick=false;
            });
          }
        }
      },
      child: Container(
        margin: EdgeInsets.all(width*0.06),
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Text(
            label,
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
        // width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(width*0.06), color: colorConst.blue),
      ),
    );
  }
}
