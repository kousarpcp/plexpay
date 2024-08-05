import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../Api/PlanInfoApi.dart';
import '../Api/RechargeApi.dart';
import '../Api/VoucherIntRecharge.dart';
import '../Const/SharedPref.dart';
import '../Const/Snackbar_toast_helper.dart';
// import '../Helper/Resources.dart';
// import '../screen/PrintPage.dart';
// import 'package:plexpay/Api/RechargeApi.dart';
// import 'package:plexpay/Api/planInfoApi.dart';
// import 'package:plexpay/Api/voucherIntRecharge.dart';
// import 'package:plexpay/Const/sharedPref.dart';
// import 'package:plexpay/Const/snackbar_toast_helper.dart';
// import 'package:plexpay/Helper/resources.dart';
// import 'package:plexpay/Screens/PaymentSuccess.dart';
// import 'package:plexpay/Screens/PrintPage.dart';

class ConfirmRecharge extends StatefulWidget {
  final id;
  final num;
  final amt;
  final voucher;

  const ConfirmRecharge({required Key key, this.id,this.num,this.amt,this.voucher}) : super(key: key);
  @override
  _ConfirmRechargeState createState() => _ConfirmRechargeState();
}

class _ConfirmRechargeState extends State<ConfirmRecharge> {
  var arrProdList = [];
  var arrBannerList = [];
  var isLoading = true;
  var isTap = false;
  var ProviderLogo;
  var ProviderCode;
  var ProviderName;
  var DialInfo;
  var SkuCode;
  var CoupenTitle;
  var SendValue;
  var SendCurrencyIso;
  var OurCommission;
  var Our_SendValue;
  var ReceiveValue;
  var ReceiveCurrencyIso;
  var Country_Iso;

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

    print("rc typeee");
    print(widget.voucher);
    this.getHome();

    setState(() {


    });
  }

  Future<String> getHome() async {
    var ds = await getSharedPrefrence("dash");
    setState(() {
      dash = ds;
    });

    print("rechaaaaarge");
    print(widget.id);
    var rsp = await planInfoApi(widget.id,widget.voucher);
    print("rechaaaaarge");
    print(rsp);

    if (rsp != 0 && rsp['status'] == true) {
      setState(() {
        ProviderLogo = rsp['provider_info']['ProviderLogo'].toString();
        ProviderCode = rsp['provider_info']['ProviderCode'].toString();
        ProviderName = rsp['provider_info']['ProviderName'].toString();
        DialInfo = rsp['provider_info']['DialInfo'].toString();
        Country_Iso = rsp['provider_info']['Country_Iso'].toString();


        SkuCode = rsp['plan_info'][0]['SkuCode'].toString();
        CoupenTitle = rsp['plan_info'][0]['CoupenTitle'].toString();
        SendValue = rsp['plan_info'][0]['SendValue'].toString();
        SendCurrencyIso = rsp['plan_info'][0]['SendCurrencyIso'].toString();
        OurCommission = rsp['plan_info'][0]['OurCommission'].toString();
        Our_SendValue = rsp['plan_info'][0]['Our_SendValue'].toString();
        ReceiveValue = rsp['plan_info'][0]['ReceiveValue'].toString();
        ReceiveCurrencyIso =
            rsp['plan_info'][0]['ReceiveCurrencyIso'].toString();
      });
    }

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
          leading: isTap == true?Container(): IconButton(
              onPressed: isTap==true?null:() {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
                size: 20,
              )),
        ),
        body:isLoading == true
            ? Container(
          child: Center(child: CircularProgressIndicator()),
        )
            :  Container(
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

                        Text(
                          CoupenTitle!=null?CoupenTitle:"" ,
                          style: TextStyle(
                              fontSize: ss.height * 0.028,
                              color: Colors.blue[700],
                              fontWeight: FontWeight.bold),
                        ),
                        dash=="1"?Text(
                          SendCurrencyIso +" "+Our_SendValue ,
                          style: TextStyle(
                              fontSize: ss.height * 0.028,
                              color: Colors.blue[700],
                              fontWeight: FontWeight.bold),
                        ):Container(),
                        SizedBox(
                          height: ss.height * 0.03,
                        ),
                        Text(
                          dash=="0"?"Please confirm your recharge of number "+widget.num.toString() +" of "+ ReceiveCurrencyIso +" "+Our_SendValue+" by "+ ProviderName:  "Please confirm your recharge of number "+widget.num.toString() +" of "+ ReceiveCurrencyIso +" "+ReceiveValue+" by "+ ProviderName,
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
                            isTap == true?Container():  GestureDetector(
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
                            isTap == true ? Container(
                              height: 50,
                              child: Center(child: CircularProgressIndicator()),
                            ) : GestureDetector(
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
                                var rsp;

                                if(widget.voucher=="1"){
                                  print("itssss int vouchwer");
                                  rsp = await  voucherIntRecharge(SkuCode,ProviderCode,SendValue,Our_SendValue,ReceiveValue);

                                }else{
                                  print("itssss int rc");

                                  rsp = await RechargeApi(SkuCode,ProviderCode,widget.num.toString(),SendValue,ReceiveValue,Our_SendValue,Country_Iso,CoupenTitle);

                                }


                                if (rsp != 0 && rsp['status'] == true) {

                                  // Navigator.pushReplacement(
                                    // context,
                                    // MaterialPageRoute(builder: (context) => Print(id: rsp['transaction_id'].toString(),type: "HOME",)),
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
