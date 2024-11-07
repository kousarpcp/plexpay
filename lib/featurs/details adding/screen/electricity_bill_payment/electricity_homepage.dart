import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:plexpay/Const/colorConst.dart';
import 'package:plexpay/Const/imageConst.dart';
import 'package:plexpay/Const/widgets.dart';

import '../../../../Const/Snackbar_toast_helper.dart';
import '../../../../api/kseb_bill_API.dart';
import '../../../../main.dart';
import 'elc_paynow.dart';

class ElcHome extends StatefulWidget {
  final String name;
  final String image;
  final String code;
  final String iso;
  final String dash;
  const ElcHome({super.key,
    required this.name,
    required this.image,
    required this.code,
    required this.iso,
    required this.dash
  });

  @override
  State<ElcHome> createState() => _ElcHomeState();
}

class _ElcHomeState extends State<ElcHome> {
  var isLoading = false;

  Future<String> getBill(id) async {
    setState(() {
      isLoading = true;
    });

    var rsp = await ksebBillApi(id,widget.iso,widget.code);
    //
    print("catogerrrrry");
    print(rsp);


    if (rsp['status'] == true) {

      Navigator.pushReplacement(
        context,
        CupertinoPageRoute(builder: (context) => ElcPaynow(data: rsp,ProviderCode: widget.code,CountryIso:widget.iso,image:widget.image,consumer: consumerController.text,)),
      );


    }else{

      showToast(rsp['message'].toString());
    }


    setState(() {
      isLoading = false;
    });

    return " ";
  }
  var _validate = false;
  TextEditingController consumerController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(context).size.width > 650?
      Scaffold(
        resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
        elevation: 0,
        title: Text(
          "Electricity Bill Payment",
          style: TextStyle(fontSize: width * 0.025, fontWeight: FontWeight.w700),
        ),
      ),
      body: isLoading==true?Container(
        margin: EdgeInsets.only(
            bottom: width*0.03,
            left: width*0.03,
            right: width*0.03
        ),
        child: Center(child: Lottie.asset(ImageConst.loading1))
        ,
      ):Padding(
        padding:  EdgeInsets.all(width*0.03),
        child: Column(
          children: [
            TextFormField(
              keyboardType: TextInputType.number,
              controller: consumerController,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(13)
              ],
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1,
                  fontSize: width*0.018,
                  color: Colors.black),
              decoration:  InputDecoration(
                errorText: _validate ? 'Consumer Number Can\'t Be Empty' : null,
                labelText: "Consumer Number",
                labelStyle: TextStyle(
                    color: colorConst.blue,
                    fontSize: MediaQuery.of(context).size.height * 0.025),
                fillColor: Colors.white,
                focusedBorder: OutlineInputBorder(
                  borderRadius:  BorderRadius.circular(10),
                  borderSide:  BorderSide(
                      width: 1,
                      color: colorConst.blue
                  ),
                ),
                border:  OutlineInputBorder(
                  borderRadius:  BorderRadius.circular(10),
                  borderSide:  BorderSide(
                      width: 1,
                      color: colorConst.blue
                  ),
                ),
                //fillColor: Colors.green
              ),
            ),
            gap,
            Text(
              "Please enter a valid consumer number.",
              style: TextStyle(color: Colors.black, fontSize: width*0.013),
            )
          ],
        ),
      ),
      bottomNavigationBar:  InkWell(
        onTap: (){
          if(consumerController.text.isNotEmpty){
            setState(() {
              _validate = false;
            });

            getBill(consumerController.text.toString());

          }else{
            setState(() {
              _validate = true;

            });
          }

        },
        child: isLoading==true?SizedBox():Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(
              bottom: width*0.03,
              left: width*0.03,
              right: width*0.03
          ),
          height: height*0.1,
          decoration: BoxDecoration(
              color: colorConst.blue, borderRadius: BorderRadius.circular(width*0.012)),
          child: Text(
            "Pay",
            style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w600),
          ),
        ),
      ),
    ):
    Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
        elevation: 0,
        title: Text(
          "Electricity Bill Payment",
          style: TextStyle(fontSize: width * 0.055, fontWeight: FontWeight.w700),
        ),
      ),
      body: isLoading==true?Container(
        margin: EdgeInsets.only(
            bottom: width*0.05,
            left: width*0.05,
            right: width*0.05
        ),
        child: Center(child: Lottie.asset(ImageConst.loading1))
        ,
      ):Padding(
        padding:  EdgeInsets.all(width*0.05),
        child: Column(
          children: [
            TextFormField(
              keyboardType: TextInputType.number,
              controller: consumerController,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(13)
              ],
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1,
                  fontSize: width*0.045,
                  color: Colors.black),
              decoration:  InputDecoration(
                errorText: _validate ? 'Consumer Number Can\'t Be Empty' : null,
                labelText: "Consumer Number",
                labelStyle: TextStyle(
                    color: colorConst.blue,
                    fontSize: MediaQuery.of(context).size.height * 0.025),
                fillColor: Colors.white,
                focusedBorder: OutlineInputBorder(
                  borderRadius:  BorderRadius.circular(10),
                  borderSide:  BorderSide(
                      width: 1,
                      color: colorConst.blue
                  ),
                ),
                border:  OutlineInputBorder(
                  borderRadius:  BorderRadius.circular(10),
                  borderSide:  BorderSide(
                      width: 1,
                      color: colorConst.blue
                  ),
                ),
                //fillColor: Colors.green
              ),
            ),
            gap,
            Text(
              "Please enter a valid consumer number.",
              style: TextStyle(color: Colors.black, fontSize: width*0.04),
            )
          ],
        ),
      ),
      bottomNavigationBar:  InkWell(
        onTap: (){
          if(consumerController.text.isNotEmpty){
            setState(() {
              _validate = false;
            });

            getBill(consumerController.text.toString());

          }else{
            setState(() {
              _validate = true;

            });
          }

        },
        child: isLoading==true?SizedBox():Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(
              bottom: width*0.05,
              left: width*0.05,
              right: width*0.05
          ),
          height: width*0.14,
          decoration: BoxDecoration(
              color: colorConst.blue, borderRadius: BorderRadius.circular(width*0.03)),
          child: Text(
            "Pay",
            style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
