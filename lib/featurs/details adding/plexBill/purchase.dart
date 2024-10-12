import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:plexpay/Const/colorConst.dart';

import '../../../main.dart';

class purchase extends StatefulWidget {
  const purchase({super.key});

  @override
  State<purchase> createState() => _purchaseState();
}

class _purchaseState extends State<purchase> {
  TextEditingController numController=TextEditingController();
  TextEditingController supplierController=TextEditingController();
  TextEditingController numberController=TextEditingController();

  var start = DateTime.now().year.toString() +
      "-" +
      DateTime.now().month.toString() +
      "-" +
      DateTime.now().day.toString();
  var end = DateTime.now().year.toString() +
      "-" +
      DateTime.now().month.toString() +
      "-" +
      DateTime.now().day.toString();


  Future selectDateRange(BuildContext context) async {
    DateTimeRange? pickedRange = (await showDateRangePicker(
      context: context,
      initialDateRange: DateTimeRange(
        start: DateTime.now(),
        end: DateTime.now(),
      ),
      firstDate: DateTime(DateTime.now().year + -5),
      lastDate: DateTime(DateTime.now().year + 2),
      helpText: 'Select Date Range',
      cancelText: 'CANCEL',
      confirmText: 'OK',
      saveText: 'SAVE',
      errorFormatText: 'Invalid format.',
      errorInvalidText: 'Out of range.',
      errorInvalidRangeText: 'Invalid range.',
      fieldStartHintText: 'Start Date',
      fieldEndLabelText: 'End Date',
    ));

    if (pickedRange != null) {
      setState(() {
        start = pickedRange.start.year.toString() +
            "-" +
            pickedRange.start.month.toString() +
            "-" +
            pickedRange.start.day.toString();
        end = pickedRange.end.year.toString() +
            "-" +
            pickedRange.end.month.toString() +
            "-" +
            pickedRange.end.day.toString();
      });


      print(pickedRange.start.day);
      print(pickedRange.start.month);
      print(pickedRange.start.year);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          "Purchase",
          style: TextStyle(
              fontSize: width * 0.06, fontWeight: FontWeight.w700),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: height*0.012,
          ),
          Row(
            children: [
              SizedBox(
                width: width*0.06,
              ),
              Text("Purchase Data",style: TextStyle(fontSize: width*0.06,fontWeight: FontWeight.w700),),
            ],
          ),
          SizedBox(
            height: height*0.02,
          ),
          Container(
            height: height*0.055,
            width: width*0.77,
            decoration: BoxDecoration(
              color: colorConst.lightgrey1,
              border: Border.all(width: width*0.001),
              boxShadow: [
                BoxShadow(
                    blurStyle: BlurStyle.normal,
                    color: Colors.black.withOpacity(0.09),
                    offset: Offset(0, 2),
                    spreadRadius: 1,
                    blurRadius: 9),
              ],
            ),

            child:Stack(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: width*0.045,
                    ),
                    Center(child: Text("Bill Number",style: TextStyle(fontSize: width*0.05),))
                  ],
                ),
                Positioned(
                  left: width*0.32,
                  child: Container(
                    height: height*0.055,
                    width: width*0.46,
                    color: Colors.white,
                    child: TextFormField(
                      controller: numController,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(5)
                      ],
                      // autocorrect: true,
                      // cursorColor: colorConst.blue,
                      decoration: InputDecoration(

                        contentPadding: EdgeInsets.only(bottom: width*0.02,left: width*0.02),
                        hintText:  ' Bill No',
                        hintStyle: TextStyle(
                          fontSize: width*0.05,
                          color: colorConst.grey
                        ),

                      ),
                    ),
                  ),
                )
              ],
            ) ,
          ),
          SizedBox(
            height: height*0.02,
          ),
          Container(
            height: height*0.055,
            width: width*0.77,
            decoration: BoxDecoration(
              color: colorConst.lightgrey1,
              border: Border.all(width: width*0.001),
              boxShadow: [
                BoxShadow(
                    blurStyle: BlurStyle.normal,
                    color: Colors.black.withOpacity(0.09),
                    offset: Offset(0, 2),
                    spreadRadius: 1,
                    blurRadius: 9),
              ],
            ),

            child:Stack(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: width*0.041,
                    ),
                    Center(child: Text("Supplier Name",style: TextStyle(fontSize: width*0.05),))
                  ],
                ),
                Positioned(
                  left: width*0.32,
                  child: Container(
                    height: height*0.055,
                    width: width*0.46,
                    color: Colors.white,
                    child: TextFormField(
                      controller: supplierController,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      autovalidateMode: AutovalidateMode.onUserInteraction,

                      // autocorrect: true,
                      // cursorColor: colorConst.blue,
                      decoration: InputDecoration(

                        contentPadding: EdgeInsets.only(bottom: width*0.02,left: width*0.02),
                        hintText:  ' Supplier Name',
                        hintStyle: TextStyle(
                            fontSize: width*0.05,
                            color: colorConst.grey
                        ),

                      ),
                    ),
                  ),
                )
              ],
            ) ,
          ),
          SizedBox(
            height: height*0.02,
          ),
          Container(
            height: height*0.055,
            width: width*0.77,
            decoration: BoxDecoration(
              color: colorConst.lightgrey1,
              border: Border.all(width: width*0.001),
              boxShadow: [
                BoxShadow(
                    blurStyle: BlurStyle.normal,
                    color: Colors.black.withOpacity(0.09),
                    offset: Offset(0, 2),
                    spreadRadius: 1,
                    blurRadius: 9),
              ],
            ),

            child:Stack(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: width*0.041,
                    ),
                    Center(child: Text("Invoice Date",style: TextStyle(fontSize: width*0.05),))
                  ],
                ),
                Positioned(
                  left: width*0.32,
                  child: Container(
                    height: height*0.055,
                    width: width*0.46,
                    color: Colors.white,
                    child: TextFormField(
                      controller: numberController,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(8)
                      ],
                      // autocorrect: true,
                      // cursorColor: colorConst.blue,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(top:width*0.017 ,left: width*0.02),
                        hintText:  ' dd/mm/yyyy',
                        hintStyle: TextStyle(
                            fontSize: width*0.05,
                            color: colorConst.grey
                        ),
                        suffixIcon: InkWell(
                          onTap: () {
                            selectDateRange(context);
                          },
                            child: Icon(Icons.calendar_month_outlined,size: width*0.047,)),
                      ),
                    ),
                  ),
                )
              ],
            ) ,
          )
        ],
      ),
    );
  }
}
