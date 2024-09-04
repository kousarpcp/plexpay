
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:plexpay/Const/colorConst.dart';
import 'package:plexpay/featurs/details%20adding/screen/Recharge%20bill%20genarate.dart';

import '../../../../Const/Snackbar_toast_helper.dart';
import '../../../../Const/imageConst.dart';
import '../../../../api/amount_convertion_API.dart';
import '../../../../api/kseb_recharge_API.dart';
import '../../../../main.dart';

class ElcPaynow extends StatefulWidget {
  final data;
  final consumer;
  final ProviderCode;
  final CountryIso;
  final image;
  const ElcPaynow({
    super.key,
    this.data,
    this.consumer,
    this.ProviderCode,
    this.CountryIso,
    this.image
  });

  @override
  State<ElcPaynow> createState() => _ElcPaynowState();
}

class _ElcPaynowState extends State<ElcPaynow> {
  var name ;
  var number ;
  var image ;
  var amount ;
  var isLoading = false;
  var isTap = false;
  var lock = true;
  var SendValue ;
  var customername ;
  var BillAmount ;
  var dueDate ;

  TextEditingController amountController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    print("xoxoxo");
    print(widget.data['plan_info']);
    //  this.getHome();

    setState(() {

      lock=false;
      image =widget.image;
      amountController.text = widget.data['plan_info']['BillAmount'].toString();
      number=widget.consumer.toString();

      customername=widget.data['plan_info']['customername'].toString();
      BillAmount=widget.data['plan_info']['BillAmount'].toString();
      dueDate=widget.data['plan_info']['dueDate'].toString();

      isLoading = false;
      getConversion();
    });


  }
  Future<String> ksebBill(response) async {
    setState(() {
      isTap = true;
    });




    var rsp = await ksebRechargeApi(widget.consumer.toString(),response['plan_info']['BillAmount'].toString(),widget.CountryIso,widget.ProviderCode);
    print("billlllllllllll");
    print(rsp);


    if ( rsp['status'] == true) {

      Navigator.pushReplacement(
        context,
        // MaterialPageRoute(builder: (context) => bill(id: rsp['transaction_id'].toString())),);
        MaterialPageRoute(builder: (context) => bill(id: rsp['transaction_id'].toString(),)),);

      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(builder: (context) => PaymentSuccess()),
      // );
      showToast(rsp['message'].toString());

    }else{
      showToast(rsp['message'].toString());

    }






    setState(() {
      isTap = false;
    });

    return " ";

  }

  Future<String> getConversion() async {
    var rsp = await fetchAmountConversionApi(widget.data['plan_info']['BillAmount'].toString());

    setState(() {
      SendValue=rsp['SendValue'].toString();

    });
    return "";
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body:isLoading==true?Container(
          child: Center(child: CircularProgressIndicator())):  Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(width*0.1),
              height: width*0.3,
              width: width * 0.3,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(width*0.03),
                  border: Border.all(color: Colors.black12),

                  image: DecorationImage(
                      image: NetworkImage(
                          image),fit: BoxFit.fill
                  )),
            ),
            Container(
              height: width*0.2,
              width: width*0.7,
              child: Text(
                customername,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: colorConst.blue,
                    fontSize: height * 0.03, fontWeight: FontWeight.w600),
              ),
            ),
            Text(
              "Bill Amount : "+BillAmount,
              style: TextStyle(
                  fontSize: height * 0.025, fontWeight: FontWeight.w600),
            ),

            Text(
              "Due Date : "+dueDate,
              style: TextStyle(
                  fontSize: height * 0.025, fontWeight: FontWeight.w600),
            ),
            Text(
              "Consumer Number : "+widget.consumer,
              style: TextStyle(
                  fontSize: height * 0.025, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: height * 0.02,
            ),

            SendValue!=null?Text(
              "Send amount : AED "+SendValue.toString(),
              style: TextStyle(
                  fontSize: height * 0.025,
                  color: colorConst.blue,
                  fontWeight: FontWeight.bold),
            ):Container(),
            SizedBox(
              height: height * 0.02,
            ),
          ],
        ),
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          ksebBill(widget.data);
        },
        child: isLoading==true?Container(
          margin: EdgeInsets.only(
              bottom: width*0.05,
              left: width*0.05,
              right: width*0.05
          ),
          child: Center(child: Lottie.asset(ImageConst.loading1))
          ,
        ):Container(
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
