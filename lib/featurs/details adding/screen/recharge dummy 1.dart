import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../Api/FetchAmountConversionApi.dart';
// import '../Api/FetctAmountConversion.dart';
import '../Api/RechargeLocalApi.dart';
import '../Const/SharedPref.dart';
import '../Const/Snackbar_toast_helper.dart';
// import '../Helper/Resources.dart';
// import '../screen/PrintPage.dart';
// import 'package:plexpay/Api/RechargeApi.dart';
// import 'package:plexpay/Api/RechargeLocalApi.dart';
// import 'package:plexpay/Api/fetctAmountConversion.dart';
// import 'package:plexpay/Api/planInfoApi.dart';
// import 'package:plexpay/Const/sharedPref.dart';
// import 'package:plexpay/Const/snackbar_toast_helper.dart';
// import 'package:plexpay/Helper/resources.dart';
// import 'package:plexpay/Screens/PaymentSuccess.dart';
// import 'package:plexpay/Screens/PrintPage.dart';

class ConfirmRechargeCustom extends StatefulWidget {
  final String id;
  final String num;
  final String amt;
  final String? title;
  final String? inr;

  const ConfirmRechargeCustom({required Key key, required this.id,required this.num,required this.amt, this.title,this.inr}) : super(key: key);
  @override
  _ConfirmRechargeState createState() => _ConfirmRechargeState();
}

class _ConfirmRechargeState extends State<ConfirmRechargeCustom> {
  var arrProdList = [];
  var arrBannerList = [];
  var isLoading = true;
  var isTap = false;
  var SendValue ;


  TextEditingController accController = TextEditingController();
  var dash = "0";

  Future<bool> _onBackPressed() async {
    return await showDialog(
      context: context,
      builder: (context) => AlertDialog(

      ),
    ) ?? false;
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    print("xoxoxo");
    print(widget.num);
    this.getHome();
    if(widget.inr!=null){
      this.getConversion();
    }
    setState(() {


    });
  }
  getConversion() async {
    var rsp = await fetchAmountConversionApi(widget.amt);

    setState(() {
      SendValue=rsp['SendValue'].toString();

    });
  }
  Future<String> getHome() async {
    var ds = await getSharedPrefrence("dash");
    setState(() {
      dash = ds;
    });



    setState(() {
      isLoading = false;
    });

    return " ";
  }

  AlertDialog() {

    if (isTap==true) {
      showToast("Recharge is processing , don't quit the page!");
    } else {
      Navigator.pop(context);
    }
  }
  @override
  Widget build(BuildContext context) {
    final ss = MediaQuery.of(context).size;

    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading:  isTap == true?Container():IconButton(
              onPressed: () {
                _onBackPressed();
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
                size: 20,
              )),
        ),
        body:
        // isLoading == true
        //     ? Container(
        //   child: Center(child: CircularProgressIndicator()),
        // )
        //     :
        Container(
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.height * 0.4,
                color: Colors.white,
                child: Lottie.asset(
                  'assets/images/confirm.json',
                  height: MediaQuery.of(context).size.height * 0.38,
                  repeat: false,
                ),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  color: Colors.grey[200],
                  child: Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                    child: Column(
                      children: [
                        Text(
                          "Confirm your Recharge? ",
                          style: TextStyle(
                              fontSize: ss.height * 0.036,
                              color: Colors.blue,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        widget.title!=null?Text(
                          "Receivable amount : "+widget.title.toString(),
                          style: TextStyle(
                              fontSize: ss.height * 0.025,
                              color: Colors.blue,
                              fontWeight: FontWeight.bold),
                        ):Container(),
                        SendValue!=null?Text(
                          "Send amount : AED "+SendValue.toString(),
                          style: TextStyle(
                              fontSize: ss.height * 0.025,
                              color: Colors.blue,
                              fontWeight: FontWeight.bold),
                        ):Container(),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          "Please confirm your recharge of number "+widget.num.toString() +" of "+ widget.amt +(widget.inr!=null?" INR":" AED "),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: ss.height * 0.026,
                              color: Colors.blue[700],
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.5),
                        ),
                        SizedBox(
                          height: ss.height * 0.05,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            isTap == true?Container():GestureDetector(
                              onTap: (){
                                _onBackPressed();
                              },
                              child: Container(
                                height: ss.height * 0.07,
                                width: ss.width * 0.28,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: (Colors.grey),
                                        spreadRadius: 1,
                                        blurRadius: 1,
                                        offset: Offset(0, 1),
                                      ),
                                    ],
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(color: Colors.black12)),
                                child: Text(
                                  "Cancel",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue[800],
                                      fontSize: ss.height * 0.025),
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



                                  setState(() {
                                    setState(() {
                                      isTap = false;
                                    });
                                  });

                                });
                                setState(() {
                                  isTap = true;
                                });

                                var rsp = await RechargeLocalApi(widget.id,widget.num,widget.amt);
                                if (rsp != 0 && rsp['status'] == true) {

                                  // Navigator.pushReplacement(
                                  //   context,
                                  //   MaterialPageRoute(builder: (context) =>Print(id: rsp['transaction_id'].toString(),type: "HOME",)),
                                  // );
                                  showToast(rsp['message'].toString());
                                } else {
                                  showToast(rsp['message'].toString());
                                }


                                setState(() {
                                  isTap = false;
                                });
                              },
                              child: Container(
                                height: ss.height * 0.07,
                                width: ss.width * 0.28,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    // gradient: grad,
                                    boxShadow: [
                                      BoxShadow(
                                        color: (Colors.grey),
                                        spreadRadius: 1,
                                        blurRadius: 1,
                                        offset: Offset(0, 1),
                                      ),
                                    ],
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(color: Colors.black12)),
                                child: Text(
                                  "Confirm",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: ss.height * 0.025),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
// button()
}
