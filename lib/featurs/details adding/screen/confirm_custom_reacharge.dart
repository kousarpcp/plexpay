import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:plexpay/Api/RechargeApi.dart';
import 'package:plexpay/Api/planInfoApi.dart';
import 'package:plexpay/Const/colorConst.dart';
import 'package:plexpay/Const/snackbar_toast_helper.dart';
import 'package:plexpay/api/recharge_local_API.dart';

import '../../../Const/imageConst.dart';
import '../../../api/amount_convertion_API.dart';
import '../../../main.dart';
import 'Recharge bill genarate.dart';

class ConfirmRechargeCustom extends StatefulWidget {
  final code;
  final number;
  final amount;
  final dash;
  final inr;
  final title;


  const ConfirmRechargeCustom({ super.key,this.inr, this.code, this.number, this.amount, this.dash, this.title});
  @override
  _ConfirmRechargeState createState() => _ConfirmRechargeState();
}

class _ConfirmRechargeState extends State<ConfirmRechargeCustom> {
  var arrProdList = [];
  var arrBannerList = [];
  var isLoading = false;
  var isTap = false;
  var SendValue ;


  TextEditingController accController = TextEditingController();
  var dash = "0";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    print("xoxoxo");
    print(widget.number);

    if(widget.inr!=null){
      this.getConversion();
    }
    setState(() {


    });
  }
  Future<String> getConversion() async {
    var rsp = await fetchAmountConversionApi(widget.amount);

    setState(() {
      SendValue=rsp['SendValue'].toString();

    });
    return "";
  }

  @override
  Widget build(BuildContext context) {
    final ss = MediaQuery.of(context).size;

    return
      Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body:isLoading==true?Container(
        margin: EdgeInsets.only(
            bottom: width*0.05,
            left: width*0.05,
            right: width*0.05
        ),
        child: Center(child: Lottie.asset(ImageConst.loading1))
        ,
      ): Container(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              height: MediaQuery.of(context).size.height * 0.5351,
              color: Colors.white,
              child: Lottie.asset(
                "assets/images/Animation - 1721449650090.json",
              ),
            ),
            Container(
              height: height * 0.35,
              width: width * 1,
              decoration: BoxDecoration(
                  color: colorConst.lightgrey1,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(width * 0.06),
                      topLeft: Radius.circular(width * 0.06))),
              child: Padding(
                padding:  EdgeInsets.all(width*0.03),
                child: Column(
                  children: [
                    SizedBox(
                      height: width*0.04,
                    ),
                    Text(
                      "Confirm your Recharge? ",
                      style: TextStyle(
                          fontSize: ss.height * 0.036,
                          color: colorConst.blue,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    widget.title!=null?Text(
                      "Receivable amount : "+widget.title.toString(),
                      style: TextStyle(
                          fontSize: ss.height * 0.025,
                          color: colorConst.blue,
                          fontWeight: FontWeight.bold),
                    ):Container(),
                    SendValue!=null?Text(
                      "Send amount : AED "+SendValue.toString(),
                      style: TextStyle(
                          fontSize: ss.height * 0.025,
                          color: colorConst.blue,
                          fontWeight: FontWeight.bold),
                    ):Container(),
                    SizedBox(
                      height: 7,
                    ),
                    Text(
                      "Please confirm your recharge of number "+widget.number.toString() +" of "+ widget.amount +(widget.inr!=null?" INR":" AED "),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: ss.height * 0.026,
                          color: Colors.blue[700],
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.5),
                    ),
                    SizedBox(
                      height: ss.height * 0.113,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: (){
                            Navigator.pop(context);
                          },
                          child: Container(
                            height: width * 0.1,
                            width: width * 0.27,
                            decoration: BoxDecoration(
                                border:
                                Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(
                                    width * 0.018)),
                            child: Center(
                              child: Text(
                                "Cancel",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue[800],
                                    fontSize: ss.height * 0.025),
                              ),
                            ),
                          ),
                        ),
                        isTap == true
                            ? Container(
                          height: 50,
                          child: Center(child: CircularProgressIndicator()),
                        )
                            : GestureDetector(
                          onTap: () async {
                            Future.delayed(const Duration(minutes: 1), () {



                            });


                            var rsp = await RechargeLocalApi(widget.code,widget.number,widget.amount,widget.dash);
                            if (rsp != 0 && rsp['status'] == true) {

                              Future.delayed(
                                  const Duration(seconds: 1), () {
                              }).then((value) {
                                Navigator.pushAndRemoveUntil(context, CupertinoPageRoute(builder: (context) => bill(
                                  id: rsp['transaction_id'].toString(),type: "HOME",
                                ),),ModalRoute.withName("/"));
                              },);
                            } else {
                              showToast("Recharge failed!!");
                              Navigator.pop(context);
                            }
                          },
                          child: isTap?CircularProgressIndicator():
                           Container(
                            height: width * 0.1,
                            width: width * 0.27,
                            decoration: BoxDecoration(
                                color: colorConst.blue,
                                borderRadius: BorderRadius.circular(
                                    width * 0.018)),
                            child: Center(
                              child: Text(
                                "Confirm",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: ss.height * 0.025),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
// button()
}
