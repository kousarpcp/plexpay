import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plexpay/Const/colorConst.dart';
import 'package:plexpay/Const/imageConst.dart';

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
  TextEditingController productController=TextEditingController();
  TextEditingController DescriptionController=TextEditingController();
  TextEditingController BuyCostController=TextEditingController();
  TextEditingController PurchaseVATController=TextEditingController();
  TextEditingController SellCostController=TextEditingController();
  TextEditingController VATController=TextEditingController();
  TextEditingController RateController=TextEditingController();
  TextEditingController InclusiveRateController=TextEditingController();
  TextEditingController InclusiveVATAmountController=TextEditingController();

  String rate = "0.00";


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
  String? dropdownValue= "Select Unit";

  List<String> product=[
    "Select Unit",
    "Numbers",
    "Kg",
  ];

  var bikes=[
    "unicorn",
    "pulsar",
    "activa",
    "MT",
    "HIMALAYAN",
  ];

  TextEditingController yearController = TextEditingController();
  TextEditingController monthController = TextEditingController();
  TextEditingController dayController = TextEditingController();

  @override
  void initState() {
    super.initState();

    // Add listeners to calculate rate whenever buy cost or VAT changes
    BuyCostController.addListener(calculateRate);
    PurchaseVATController.addListener(calculateRate);

    // Add listeners to calculate inclusive rate and VAT amount whenever sell cost or VAT changes
    SellCostController.addListener(calculateInclusiveValues);
    VATController.addListener(calculateInclusiveValues);
  }

  @override
  void dispose() {
    // Dispose controllers when not needed
    BuyCostController.dispose();
    PurchaseVATController.dispose();
    RateController.dispose();

    // Dispose controllers when not needed
    SellCostController.dispose();
    VATController.dispose();
    InclusiveRateController.dispose();
    InclusiveVATAmountController.dispose();
    super.dispose();
  }

  void calculateRate() {
    double buyCost = double.tryParse(BuyCostController.text) ?? 0;
    double purchaseVat = double.tryParse(PurchaseVATController.text) ?? 0;
    double rate = buyCost + (buyCost * purchaseVat / 100);
    RateController.text = rate.toStringAsFixed(2); // Display rate with 2 decimal places
  }

  void calculateInclusiveValues() {
    double sellCost = double.tryParse(SellCostController.text) ?? 0;
    double vatPercent = double.tryParse(VATController.text) ?? 0;

    // Calculate Inclusive Rate
    double inclusiveRate = sellCost / (1 + (vatPercent / 100));
    InclusiveRateController.text = inclusiveRate.toStringAsFixed(2);

    // Calculate Inclusive VAT Amount
    double inclusiveVATAmount = sellCost - inclusiveRate;
    InclusiveVATAmountController.text = inclusiveVATAmount.toStringAsFixed(2);
  }



  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(context).size.width > 650?
      Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          "Purchase",
          style: TextStyle(
              fontSize: width * 0.028, fontWeight: FontWeight.w600),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: height*0.012,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: width*0.032,
                    ),
                    Text("Purchase Data",style: TextStyle(fontSize: width*0.025,fontWeight: FontWeight.w500),),
                  ],
                ),
                Row(
                  children: [
                    Text("Invoice Date"),
                    SizedBox(
                      width: width*0.012,
                    ),
                    Container(
                      height: height*0.05,
                      width: width*0.043,
                      decoration: BoxDecoration(
                          color: colorConst.lightgrey1,
                        borderRadius: BorderRadius.circular(width*0.002)
                      ),
                      child: TextFormField(
                        controller: dayController,
                        keyboardType:TextInputType.number ,
                        textInputAction: TextInputAction.next,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(2)
                        ],
                        decoration: InputDecoration(
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(width*0.002)),
                            focusColor: colorConst.lightgrey1,
                            contentPadding: EdgeInsets.only(top: width*0.000001,left: width*0.009999),
                            hintText: "DD",
                            hintStyle: TextStyle(
                              fontSize: width*0.015,
                              color: Colors.black87,
                              fontWeight: FontWeight.w400,
                            ),
                            enabledBorder: OutlineInputBorder(borderRadius:BorderRadius.circular(width*0.002),
                                borderSide: BorderSide(
                                    color: colorConst.lightgrey1
                                )
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(width*0.002),
                                borderSide: BorderSide(
                                    color: colorConst.lightgrey1
                                )
                            )
                        ),

                      )
                      // Center(child: Text("DD")),
                    ),
                    SizedBox(
                      width: width*0.01,
                    ),
                    Container(
                      height: height*0.05,
                      width: width*0.043,
                      decoration: BoxDecoration(
                          color: colorConst.lightgrey1,
                          borderRadius: BorderRadius.circular(width*0.002)
                      ),
                      child: TextFormField(
                        controller: monthController,
                        keyboardType:TextInputType.number,
                        textInputAction: TextInputAction.next,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(2)
                        ],
                        decoration: InputDecoration(
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(width*0.002)),
                            focusColor: colorConst.lightgrey1,
                            contentPadding: EdgeInsets.only(top: width*0.000001,left: width*0.009),
                            hintText: "MM",
                            hintStyle: TextStyle(
                              fontSize: width*0.015,
                              color: Colors.black87,
                              fontWeight: FontWeight.w400,
                            ),
                            enabledBorder: OutlineInputBorder(borderRadius:BorderRadius.circular(width*0.002),
                                borderSide: BorderSide(
                                    color: colorConst.lightgrey1
                                )
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(width*0.002),
                                borderSide: BorderSide(
                                    color: colorConst.lightgrey1
                                )
                            )
                        ),

                      )
                      // Center(child: Text("MM")),
                    ),
                    SizedBox(
                      width: width*0.01,
                    ),
                    Container(
                      height: height*0.05,
                      width: width*0.06,
                      decoration: BoxDecoration(
                          color: colorConst.lightgrey1,
                          borderRadius: BorderRadius.circular(width*0.002)
                      ),
                      child: TextFormField(
                        controller: yearController,
                        keyboardType:TextInputType.number ,
                        textInputAction: TextInputAction.next,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(4)
                        ],
                        decoration: InputDecoration(
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(width*0.002)),
                            focusColor: colorConst.lightgrey1,
                            contentPadding: EdgeInsets.only(top: width*0.000001,left: width*0.012),
                            hintText: "YYYY",
                            hintStyle: TextStyle(
                              fontSize: width*0.016,
                              color: Colors.black87,
                              fontWeight: FontWeight.w400,
                            ),
                            enabledBorder: OutlineInputBorder(borderRadius:BorderRadius.circular(width*0.002),
                                borderSide: BorderSide(
                                    color: colorConst.lightgrey1
                                )
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(width*0.002),
                                borderSide: BorderSide(
                                    color: colorConst.lightgrey1
                                )
                            )
                        ),

                      )
                    ),
                    SizedBox(
                      width: width*0.012,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: height*0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: width*0.03,
                    ),
                    Container(
                      height: height*0.055,
                      width: width*0.28,
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
                                width: width*0.023,
                              ),
                              Center(child: Text("Bill Number",style: TextStyle(fontSize: width*0.015,fontWeight: FontWeight.w600),))
                            ],
                          ),
                          Positioned(
                            left: width*0.12,
                            child: Container(
                              height: height*0.07,
                              width: width*0.2,
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

                                  contentPadding: EdgeInsets.only(bottom: width*0.0186,left: width*0.02),
                                  hintText:  ' Bill No',
                                  hintStyle: TextStyle(
                                    fontSize: width*0.015,
                                    color: colorConst.grey
                                  ),

                                ),
                              ),
                            ),
                          )
                        ],
                      ) ,
                    ),
                  ],
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        showCupertinoModalPopup(
                          barrierDismissible: false,
                            barrierColor: Colors.white,
                            context: context,
                            builder: (context) {
                              return CupertinoActionSheet(
                                title: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text("Add New Product",style: TextStyle(color:Colors.black,fontSize: width*0.014),),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Material(
                                          child: InkWell(
                                            onTap: () {
                                              Navigator.pop(context);
                                            },

                                              child: Icon(Icons.close_rounded),),
                                          color: Colors.white,
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: height*0.03,
                                    ),
                                    Divider(
                                      thickness: width*0.0001,
                                      color: Colors.black,
                                    ),
                                    Row(
                                      children: [
                                        Text("Product Name"),
                                      ],
                                    ),
                                    Container(
                                      height: height*0.07,
                                      width: width*0.9,
                                      decoration: BoxDecoration(
                                          color: colorConst.lightgrey1,
                                        border: Border.all(width: width*0.001,color: Colors.black45),
                                        borderRadius: BorderRadius.circular(width*0.01),
                                      ),
                                      child: Material(
                                        color: Colors.transparent,
                                        child: TextFormField(
                                          controller: productController,
                                          autovalidateMode: AutovalidateMode.onUserInteraction,
                                          keyboardType: TextInputType.text,
                                          textInputAction: TextInputAction.next,
                                          decoration: InputDecoration(
                                             contentPadding: EdgeInsets.only(bottom: width*0.07,left: width*0.01),
                                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(width*0.01)),
                                              focusColor: colorConst.lightgrey1,
                                              enabledBorder: OutlineInputBorder(borderRadius:BorderRadius.circular(width*0.01),
                                                  borderSide: BorderSide(
                                                      color: colorConst.lightgrey1
                                                  )
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(width*0.01),
                                                  borderSide: BorderSide(
                                                      color: colorConst.lightgrey1
                                                  )
                                              )
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: height*0.02,
                                    ),
                                    Row(
                                      children: [
                                        Text("Product Description"),
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: height*0.1,
                                          width: width*0.9,
                                          decoration: BoxDecoration(
                                            color: colorConst.lightgrey1,
                                            border: Border.all(width: width*0.001,color: Colors.black45),
                                            borderRadius: BorderRadius.circular(width*0.01),
                                          ),
                                          child: Material(
                                            color: Colors.transparent,
                                            child: TextFormField(
                                              controller: DescriptionController,
                                              autovalidateMode: AutovalidateMode.onUserInteraction,
                                              keyboardType: TextInputType.multiline,  // Allow multiline input
                                              textInputAction: TextInputAction.newline,  // Pressing enter creates a new line
                                              maxLines: null,  // Allows the text to grow to multiple lines
                                              decoration: InputDecoration(
                                                  contentPadding: EdgeInsets.only(left: width*0.01),
                                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(width*0.01)),
                                                  focusColor: colorConst.lightgrey1,
                                                  enabledBorder: OutlineInputBorder(borderRadius:BorderRadius.circular(width*0.01),
                                                      borderSide: BorderSide(
                                                          color: colorConst.lightgrey1
                                                      )
                                                  ),
                                                  focusedBorder: OutlineInputBorder(
                                                      borderRadius: BorderRadius.circular(width*0.01),
                                                      borderSide: BorderSide(
                                                          color: colorConst.lightgrey1
                                                      )
                                                  )
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: height*0.02,
                                    ),
                                    Row(
                                      children: [
                                        Text("Unit"),
                                      ],
                                    ),
                                    Container(
                                      height: height*0.07,
                                      width: width*0.88,
                                        decoration: BoxDecoration(
                                          color: colorConst.lightgrey1,
                                          border: Border.all(width: width*0.001,color: Colors.black45),
                                          // borderRadius: BorderRadius.circular(width*0.01),
                                        ),
                                      child:GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            dropdownValue = "Numbers"; // Set any item you want to display initially
                                          });
                                        },
                                        child: AnimatedContainer(
                                          duration: Duration(milliseconds: 250), // Adjust this to change animation speed
                                          curve: Curves.easeInOut,
                                          child: Material(
                                            child: DropdownButton<String>(
                                              dropdownColor: Colors.white,
                                              focusNode: FocusScopeNode(),
                                              isExpanded: true,
                                              padding: EdgeInsets.only(left: width*0.01,right: width*0.01),
                                              hint:  Text("Select The Items"),// Use const here
                                              icon:  Row(
                                                children: [
                                                  Icon(Icons.keyboard_arrow_down_outlined),
                                                ],
                                              ),
                                              borderRadius: BorderRadius.circular(width*0.02),
                                              underline: SizedBox(),// Use const here
                                              value: dropdownValue,
                                              items: product.map((String value) {
                                                return DropdownMenuItem<String>(
                                                  value: value,
                                                  child: Text(value),
                                                );
                                              }).toList(),
                                              onChanged: (String? newValue) {
                                                setState(() {
                                                  dropdownValue = newValue;  // Simply set to the selected value
                                                });
                                              },
                                            ),
                                          ),
                                        ),
                                      )



                                    ),
                                    SizedBox(
                                      height: height*0.02,
                                    ),
                                    Row(
                                      children: [
                                        Text("Buy Cost"),
                                        SizedBox(
                                          width: width*0.122,
                                        ),
                                        Text("Purchase VAT"),
                                        SizedBox(
                                          width: width*0.097,
                                        ),
                                        Text("Rate"),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          height: height*0.07,
                                          width: width*0.163,
                                          decoration: BoxDecoration(
                                            color: colorConst.lightgrey1,
                                            border: Border.all(width: width*0.001,color: Colors.black45),
                                            borderRadius: BorderRadius.circular(width*0.01),
                                          ),
                                          child: Material(
                                            color: Colors.transparent,
                                            child: TextFormField(
                                              controller: BuyCostController,
                                              autovalidateMode: AutovalidateMode.onUserInteraction,
                                              keyboardType: TextInputType.number,
                                              textInputAction: TextInputAction.next,
                                              inputFormatters: [
                                                LengthLimitingTextInputFormatter(5)
                                              ],
                                              decoration: InputDecoration(
                                                  contentPadding: EdgeInsets.only(bottom: width*0.07,left: width*0.01),
                                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(width*0.01)),
                                                  focusColor: colorConst.lightgrey1,
                                                  enabledBorder: OutlineInputBorder(borderRadius:BorderRadius.circular(width*0.01),
                                                      borderSide: BorderSide(
                                                          color: colorConst.lightgrey1
                                                      )
                                                  ),
                                                  focusedBorder: OutlineInputBorder(
                                                      borderRadius: BorderRadius.circular(width*0.01),
                                                      borderSide: BorderSide(
                                                          color: colorConst.lightgrey1
                                                      )
                                                  )
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: width*0.01,
                                        ),
                                        Container(
                                          height: height*0.07,
                                          width: width*0.17,
                                          decoration: BoxDecoration(
                                            color: colorConst.lightgrey1,
                                            border: Border.all(width: width*0.001,color: Colors.black45),
                                            borderRadius: BorderRadius.circular(width*0.01),
                                          ),
                                          child: Material(
                                            color: Colors.transparent,
                                            child: TextFormField(
                                              controller: PurchaseVATController,
                                              autovalidateMode: AutovalidateMode.onUserInteraction,
                                              keyboardType: TextInputType.number,
                                              textInputAction: TextInputAction.next,
                                              inputFormatters: [
                                                LengthLimitingTextInputFormatter(5)
                                              ],
                                              decoration: InputDecoration(
                                                  contentPadding: EdgeInsets.only(bottom: width*0.07,left: width*0.01),
                                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(width*0.01)),
                                                  focusColor: colorConst.lightgrey1,
                                                  enabledBorder: OutlineInputBorder(borderRadius:BorderRadius.circular(width*0.01),
                                                      borderSide: BorderSide(
                                                          color: colorConst.lightgrey1
                                                      )
                                                  ),
                                                  focusedBorder: OutlineInputBorder(
                                                      borderRadius: BorderRadius.circular(width*0.01),
                                                      borderSide: BorderSide(
                                                          color: colorConst.lightgrey1
                                                      )
                                                  )
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: width*0.01,
                                        ),
                                        Container(
                                          height: height*0.07,
                                          width: width*0.17,
                                          decoration: BoxDecoration(
                                            color: colorConst.lightgrey1,
                                            border: Border.all(width: width*0.001,color: Colors.black45),
                                            borderRadius: BorderRadius.circular(width*0.01),
                                          ),
                                          child: Material(
                                            color: Colors.transparent,
                                            child: TextFormField(
                                              controller: RateController,
                                                readOnly: true,
                                                decoration: InputDecoration(
                                                  contentPadding: EdgeInsets.only(bottom: width * 0.07, left: width * 0.01),
                                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(width * 0.01)),
                                                  focusColor: colorConst.lightgrey1,
                                                  enabledBorder: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(width * 0.01),
                                                    borderSide: BorderSide(color: colorConst.lightgrey1),
                                                  ),
                                                  focusedBorder: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(width * 0.01),
                                                    borderSide: BorderSide(color: colorConst.lightgrey1),
                                                  ),
                                                ),
                                            ),
                                          )

                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: height*0.02,
                                    ),
                                    Row(
                                      children: [
                                        Text("Sell Cost"),
                                        SizedBox(width: width*0.222,),
                                        Text("VAT"),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          height: height*0.07,
                                          width: width*0.25,
                                          decoration: BoxDecoration(
                                            color: colorConst.lightgrey1,
                                            border: Border.all(width: width*0.001,color: Colors.black45),
                                            borderRadius: BorderRadius.circular(width*0.01),
                                          ),
                                          child: Material(
                                            color: Colors.transparent,
                                            child: TextFormField(
                                              controller: SellCostController,
                                              autovalidateMode: AutovalidateMode.onUserInteraction,
                                              keyboardType: TextInputType.number,  // Allow multiline input
                                              textInputAction: TextInputAction.newline,
                                              inputFormatters: [
                                                LengthLimitingTextInputFormatter(5)
                                              ],// Pressing enter creates a new line
                                              maxLines: null,  // Allows the text to grow to multiple lines
                                              decoration: InputDecoration(
                                                  contentPadding: EdgeInsets.only(left: width*0.01),
                                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(width*0.01)),
                                                  focusColor: colorConst.lightgrey1,
                                                  enabledBorder: OutlineInputBorder(borderRadius:BorderRadius.circular(width*0.01),
                                                      borderSide: BorderSide(
                                                          color: colorConst.lightgrey1
                                                      )
                                                  ),
                                                  focusedBorder: OutlineInputBorder(
                                                      borderRadius: BorderRadius.circular(width*0.01),
                                                      borderSide: BorderSide(
                                                          color: colorConst.lightgrey1
                                                      )
                                                  )
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: width*0.024,
                                        ),
                                        Container(
                                          height: height*0.07,
                                          width: width*0.25,
                                          decoration: BoxDecoration(
                                            color: colorConst.lightgrey1,
                                            border: Border.all(width: width*0.001,color: Colors.black45),
                                            borderRadius: BorderRadius.circular(width*0.01),
                                          ),
                                          child: Material(
                                            color: Colors.transparent,
                                            child: TextFormField(
                                              controller: VATController,
                                              autovalidateMode: AutovalidateMode.onUserInteraction,
                                              keyboardType: TextInputType.number,  // Allow multiline input
                                              textInputAction: TextInputAction.newline,
                                              inputFormatters: [
                                                LengthLimitingTextInputFormatter(5)
                                              ],// Pressing en// Pressing enter creates a new line
                                              maxLines: null,  // Allows the text to grow to multiple lines
                                              decoration: InputDecoration(
                                                  contentPadding: EdgeInsets.only(left: width*0.01),
                                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(width*0.01)),
                                                  focusColor: colorConst.lightgrey1,
                                                  enabledBorder: OutlineInputBorder(borderRadius:BorderRadius.circular(width*0.01),
                                                      borderSide: BorderSide(
                                                          color: colorConst.lightgrey1
                                                      )
                                                  ),
                                                  focusedBorder: OutlineInputBorder(
                                                      borderRadius: BorderRadius.circular(width*0.01),
                                                      borderSide: BorderSide(
                                                          color: colorConst.lightgrey1
                                                      )
                                                  )
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: height*0.02,
                                    ),
                                    Row(
                                      children: [
                                        Text("Inclusive Rate"),
                                        SizedBox(width: width*0.194,),
                                        Text("Inclusive VAT Amount"),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          height: height*0.07,
                                          width: width*0.25,
                                          decoration: BoxDecoration(
                                            color: colorConst.lightgrey1,
                                            border: Border.all(width: width*0.001,color: Colors.black45),
                                            borderRadius: BorderRadius.circular(width*0.01),
                                          ),
                                          child: Material(
                                            color: Colors.transparent,
                                            child: TextFormField(
                                              controller: InclusiveRateController,
                                              readOnly: true,
                                              decoration: InputDecoration(
                                                contentPadding: EdgeInsets.only(left: width * 0.01),
                                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(width * 0.01)),
                                                enabledBorder: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(width * 0.01),
                                                  borderSide: BorderSide(color: Colors.grey[200]!),
                                                ),
                                                focusedBorder: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(width * 0.01),
                                                  borderSide: BorderSide(color: Colors.grey[200]!),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: width*0.024,
                                        ),
                                        Container(
                                          height: height*0.07,
                                          width: width*0.25,
                                          decoration: BoxDecoration(
                                            color: colorConst.lightgrey1,
                                            border: Border.all(width: width*0.001,color: Colors.black45),
                                            borderRadius: BorderRadius.circular(width*0.01),
                                          ),
                                          child: Material(
                                            color: Colors.transparent,
                                            child: TextFormField(
                                              controller: InclusiveVATAmountController,
                                                readOnly: true,
                                                decoration: InputDecoration(
                                                  contentPadding: EdgeInsets.only(left: width * 0.01),
                                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(width * 0.01)),
                                                  enabledBorder: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(width * 0.01),
                                                    borderSide: BorderSide(color: Colors.grey[200]!),
                                                  ),
                                                  focusedBorder: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(width * 0.01),
                                                    borderSide: BorderSide(color: Colors.grey[200]!),
                                                  ),
                                                ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: height*0.02,
                                    ),
                                    Row(
                                      children: [
                                        Text("Category")
                                      ],
                                    ),
                                    Container(
                                      height: height*0.07,
                                      width: width*1,
                                      decoration: BoxDecoration(
                                        color: colorConst.lightgrey1,
                                        border: Border.all(width: width*0.001,color: Colors.black45),
                                        borderRadius: BorderRadius.circular(width*0.01),
                                      ),
                                    ),
                                    SizedBox(
                                      height: height*0.04,
                                    ),
                                    Container(
                                      height: height*0.07,
                                      width: width*0.2,
                                      decoration: BoxDecoration(
                                        color: colorConst.lightgrey1,
                                        border: Border.all(width: width*0.001,color: Colors.black45),
                                        borderRadius: BorderRadius.circular(width*0.01),
                                      ),
                                      child: Center(child: Text("ADD",style: TextStyle(fontSize: width*0.015,fontWeight: FontWeight.w600,color: CupertinoColors.black),)),
                                    ),

                                  ],
                                ) ,
                                actions: [],
                              );
                            },
                        );
                      },
                      child: Container(
                        height: height*0.055,
                        width: width*0.166,
                        decoration: BoxDecoration(
                            color: colorConst.blue,
                          borderRadius: BorderRadius.circular(width*0.002)
                        ),
                        child: Center(child: Text("Add New Product",style: TextStyle(fontSize: width*0.015,color: Colors.white),)),
                      ),
                    ),
                    SizedBox(
                      width: width*0.012,
                    )
                  ],
                ),
              ],
            ),
            SizedBox(
              height: height*0.02,
            ),
            Row(
              children: [
                SizedBox(
                  width: width*0.03,
                ),
                Container(
                  height: height*0.055,
                  width: width*0.28,
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
                            width: width*0.013,
                          ),
                          Center(child: Text("Supplier Name",style: TextStyle(fontSize: width*0.015,fontWeight: FontWeight.w600),))
                        ],
                      ),
                      Positioned(
                        left: width*0.12,
                        child: Container(
                          height: height*0.07,
                          width: width*0.2,
                          color: Colors.white,
                          child: TextFormField(
                            controller: supplierController,
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                            autovalidateMode: AutovalidateMode.onUserInteraction,

                            // autocorrect: true,
                            // cursorColor: colorConst.blue,
                            decoration: InputDecoration(
        
                              contentPadding: EdgeInsets.only(bottom: width*0.0186,left: width*0.02),
                              hintText:  ' Supplier Name',
                              hintStyle: TextStyle(
                                  fontSize: width*0.015,
                                  color: colorConst.grey
                              ),
        
                            ),
                          ),
                        ),
                      )
                    ],
                  ) ,
                ),
              ],
            ),
            SizedBox(
              height: height*0.07,
            ),
            InkWell(
              onTap: () {
                showCupertinoModalPopup(
                  barrierDismissible: false,
                  barrierColor: Colors.white,
                  context: context,
                  builder: (context) {
                    return CupertinoActionSheet(
                      title: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Material(
                                child: InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Icon(Icons.close_rounded),),
                                color: Colors.white,
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Text("Product Name"),
                            ],
                          ),
                          Container(
                            height: height*0.07,
                            width: width*0.9,
                            decoration: BoxDecoration(
                              color: colorConst.lightgrey1,
                              border: Border.all(width: width*0.001,color: Colors.black45),
                              borderRadius: BorderRadius.circular(width*0.01),
                            ),
                            child: Material(
                              color: Colors.transparent,
                              child: TextFormField(
                                controller: productController,
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(bottom: width*0.07,left: width*0.01),
                                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(width*0.01)),
                                    focusColor: colorConst.lightgrey1,
                                    enabledBorder: OutlineInputBorder(borderRadius:BorderRadius.circular(width*0.01),
                                        borderSide: BorderSide(
                                            color: colorConst.lightgrey1
                                        )
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(width*0.01),
                                        borderSide: BorderSide(
                                            color: colorConst.lightgrey1
                                        )
                                    )
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: height*0.02,
                          ),
                          Row(
                            children: [
                              Text("Unit"),
                            ],
                          ),
                          Container(
                              height: height*0.07,
                              width: width*0.9,
                              decoration: BoxDecoration(
                                color: colorConst.lightgrey1,
                                border: Border.all(width: width*0.001,color: Colors.black45),
                                borderRadius: BorderRadius.circular(width*0.01),
                              ),



                          ),
                          SizedBox(
                            height: height*0.02,
                          ),
                          Row(
                            children: [
                              Text("Buy Cost"),
                              SizedBox(
                                width: width*0.122,
                              ),
                              Text("Mode"),
                              SizedBox(
                                width: width*0.146,
                              ),
                              Text("Rate"),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                height: height*0.07,
                                width: width*0.163,
                                decoration: BoxDecoration(
                                  color: colorConst.lightgrey1,
                                  border: Border.all(width: width*0.001,color: Colors.black45),
                                  borderRadius: BorderRadius.circular(width*0.01),
                                ),
                                child: Material(
                                  color: Colors.transparent,
                                  child: TextFormField(
                                    controller: BuyCostController,
                                    autovalidateMode: AutovalidateMode.onUserInteraction,
                                    keyboardType: TextInputType.number,
                                    textInputAction: TextInputAction.next,
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(5)
                                    ],
                                    decoration: InputDecoration(
                                        contentPadding: EdgeInsets.only(bottom: width*0.07,left: width*0.01),
                                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(width*0.01)),
                                        focusColor: colorConst.lightgrey1,
                                        enabledBorder: OutlineInputBorder(borderRadius:BorderRadius.circular(width*0.01),
                                            borderSide: BorderSide(
                                                color: colorConst.lightgrey1
                                            )
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(width*0.01),
                                            borderSide: BorderSide(
                                                color: colorConst.lightgrey1
                                            )
                                        )
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: width*0.01,
                              ),
                              Container(
                                height: height*0.07,
                                width: width*0.17,
                                decoration: BoxDecoration(
                                  color: colorConst.lightgrey1,
                                  border: Border.all(width: width*0.001,color: Colors.black45),
                                  borderRadius: BorderRadius.circular(width*0.01),
                                ),
                                child: Material(
                                  color: Colors.transparent,
                                  child: TextFormField(
                                    controller: PurchaseVATController,
                                    autovalidateMode: AutovalidateMode.onUserInteraction,
                                    keyboardType: TextInputType.number,
                                    textInputAction: TextInputAction.next,
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(5)
                                    ],
                                    decoration: InputDecoration(
                                        contentPadding: EdgeInsets.only(bottom: width*0.07,left: width*0.01),
                                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(width*0.01)),
                                        focusColor: colorConst.lightgrey1,
                                        enabledBorder: OutlineInputBorder(borderRadius:BorderRadius.circular(width*0.01),
                                            borderSide: BorderSide(
                                                color: colorConst.lightgrey1
                                            )
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(width*0.01),
                                            borderSide: BorderSide(
                                                color: colorConst.lightgrey1
                                            )
                                        )
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: width*0.01,
                              ),
                              Container(
                                height: height*0.07,
                                width: width*0.17,
                                decoration: BoxDecoration(
                                  color: colorConst.lightgrey1,
                                  border: Border.all(width: width*0.001,color: Colors.black45),
                                  borderRadius: BorderRadius.circular(width*0.01),
                                ),

                              ),
                            ],
                          ),
                          SizedBox(
                            height: height*0.02,
                          ),
                          Row(
                            children: [
                              Text("Selling Cost"),
                              SizedBox(width: width*0.21,),
                              Text("VAT"),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                height: height*0.07,
                                width: width*0.25,
                                decoration: BoxDecoration(
                                  color: colorConst.lightgrey1,
                                  border: Border.all(width: width*0.001,color: Colors.black45),
                                  borderRadius: BorderRadius.circular(width*0.01),
                                ),
                                child: Material(
                                  color: Colors.transparent,
                                  child: TextFormField(
                                    controller: SellCostController,
                                    autovalidateMode: AutovalidateMode.onUserInteraction,
                                    keyboardType: TextInputType.number,  // Allow multiline input
                                    textInputAction: TextInputAction.newline,
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(5)
                                    ],// Pressing enter creates a new line
                                    maxLines: null,  // Allows the text to grow to multiple lines
                                    decoration: InputDecoration(
                                        contentPadding: EdgeInsets.only(left: width*0.01),
                                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(width*0.01)),
                                        focusColor: colorConst.lightgrey1,
                                        enabledBorder: OutlineInputBorder(borderRadius:BorderRadius.circular(width*0.01),
                                            borderSide: BorderSide(
                                                color: colorConst.lightgrey1
                                            )
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(width*0.01),
                                            borderSide: BorderSide(
                                                color: colorConst.lightgrey1
                                            )
                                        )
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: width*0.024,
                              ),
                              Container(
                                height: height*0.07,
                                width: width*0.25,
                                decoration: BoxDecoration(
                                  color: colorConst.lightgrey1,
                                  border: Border.all(width: width*0.001,color: Colors.black45),
                                  borderRadius: BorderRadius.circular(width*0.01),
                                ),
                                child: Material(
                                  color: Colors.transparent,
                                  child: TextFormField(
                                    controller: VATController,
                                    autovalidateMode: AutovalidateMode.onUserInteraction,
                                    keyboardType: TextInputType.number,  // Allow multiline input
                                    textInputAction: TextInputAction.newline,
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(5)
                                    ],// Pressing enter creates a new line
                                    maxLines: null,  // Allows the text to grow to multiple lines
                                    decoration: InputDecoration(
                                        contentPadding: EdgeInsets.only(left: width*0.01),
                                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(width*0.01)),
                                        focusColor: colorConst.lightgrey1,
                                        enabledBorder: OutlineInputBorder(borderRadius:BorderRadius.circular(width*0.01),
                                            borderSide: BorderSide(
                                                color: colorConst.lightgrey1
                                            )
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(width*0.01),
                                            borderSide: BorderSide(
                                                color: colorConst.lightgrey1
                                            )
                                        )
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: height*0.02,
                          ),
                          Row(
                            children: [
                              Text("Total( Without VAT)"),
                              SizedBox(width: width*0.158,),
                              Text("Total( With VAT)	"),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                height: height*0.07,
                                width: width*0.25,
                                decoration: BoxDecoration(
                                  color: colorConst.lightgrey1,
                                  border: Border.all(width: width*0.001,color: Colors.black45),
                                  borderRadius: BorderRadius.circular(width*0.01),
                                ),
                              ),
                              SizedBox(
                                width: width*0.024,
                              ),
                              Container(
                                height: height*0.07,
                                width: width*0.25,
                                decoration: BoxDecoration(
                                  color: colorConst.lightgrey1,
                                  border: Border.all(width: width*0.001,color: Colors.black45),
                                  borderRadius: BorderRadius.circular(width*0.01),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: height*0.02,
                          ),
                          SizedBox(
                            height: height*0.04,
                          ),
                          Container(
                            height: height*0.07,
                            width: width*0.2,
                            decoration: BoxDecoration(
                              color: colorConst.lightgrey1,
                              border: Border.all(width: width*0.001,color: Colors.black45),
                              borderRadius: BorderRadius.circular(width*0.01),
                            ),
                            child: Center(child: Text("Confirm",style: TextStyle(fontSize: width*0.015,fontWeight: FontWeight.w600,color: CupertinoColors.black),)),
                          ),

                        ],
                      ) ,
                      actions: [],
                    );
                  },
                );
              },
              child: Container(
                height: height*0.1,
                width: width*0.4,
                decoration: BoxDecoration(
                  color: Colors.white,
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(child: Text("Purchase",style: TextStyle(fontSize: width*0.02),)),
                    Icon(Icons.add)
                  ],
                ),
              ),
            ),
            SizedBox(
              height: height*0.05,
            ),
            Container(
              height: height * 0.05,
              width: width * 0.823,
              child: Row(
                children: [
                  SizedBox(
                    width: width*0.01,
                  ),
                  SvgPicture.asset(ImageConst.tagbill,width: width*0.017,),
                  SizedBox(width: width*0.01,),
                  Text("Bill",style: TextStyle(fontSize: 15),)
                ],
              ),
              color: colorConst.lightgrey1,
              // child:,
            ),
            SizedBox(
              height: height*0.01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: height * 0.08,
                  width: width * 0.24,
                  decoration: BoxDecoration(
                    color: colorConst.lightgrey1,
                    border: Border.all(width: width*0.001,color: Colors.black45),
                  ),
                  child:Center(child: Text("Product",style: TextStyle(fontSize: width*0.016,fontWeight: FontWeight.w600),)),
                ),
                SizedBox(
                  width: width*0.002,
                ),
                Container(
                  height: height * 0.08,
                  width: width * 0.05,
                  decoration: BoxDecoration(
                    color: colorConst.lightgrey1,
                    border: Border.all(width: width*0.001,color: Colors.black45),
                  ),
                  child:Padding(
                    padding:  EdgeInsets.only(left: width*0.01),
                    child: Center(child: Text("Buy Cost",style: TextStyle(fontSize: width*0.014,fontWeight: FontWeight.w600),)),
                  ),
                ),
                SizedBox(
                  width: width*0.002,
                ),
                Container(
                  height: height * 0.08,
                  width: width * 0.07,
                  decoration: BoxDecoration(
                    color: colorConst.lightgrey1,
                    border: Border.all(width: width*0.001,color: Colors.black45),
                  ),
                  child:Center(child: Text("VAT(%)",style: TextStyle(fontSize: width*0.014,fontWeight: FontWeight.w600),)),
                ),
                SizedBox(
                  width: width*0.002,
                ),
                Container(
                  height: height * 0.08,
                  width: width * 0.05,
                  decoration: BoxDecoration(
                    color: colorConst.lightgrey1,
                    border: Border.all(width: width*0.001,color: Colors.black45),
                  ),
                  child:Center(child: Text("Rate",style: TextStyle(fontSize: width*0.014,fontWeight: FontWeight.w600),)),
                ),
                SizedBox(
                  width: width*0.002,
                ),
                Container(
                  height: height * 0.08,
                  width: width * 0.07,
                  decoration: BoxDecoration(
                    color: colorConst.lightgrey1,
                    border: Border.all(width: width*0.001,color: Colors.black45),
                  ),
                  child:Padding(
                    padding:  EdgeInsets.only(left: width*0.012),
                    child: Center(child: Text("Selling Cost",style: TextStyle(fontSize: width*0.014,fontWeight: FontWeight.w600),)),
                  ),
                ),
                SizedBox(
                  width: width*0.002,
                ),
                Container(
                  height: height * 0.08,
                  width: width * 0.12,
                  decoration: BoxDecoration(
                    color: colorConst.lightgrey1,
                    border: Border.all(width: width*0.001,color: Colors.black45),
                  ),
                  child:Center(child: Text("Mode",style: TextStyle(fontSize: width*0.0145,fontWeight: FontWeight.w600),)),
                ),
                SizedBox(
                  width: width*0.002,
                ),
                Container(
                  height: height * 0.08,
                  width: width * 0.05,
                  decoration: BoxDecoration(
                    color: colorConst.lightgrey1,
                    border: Border.all(width: width*0.001,color: Colors.black45),
                  ),
                  child:Center(child: Text("Unit",style: TextStyle(fontSize: width*0.015,fontWeight: FontWeight.w600),)),
                ),
                SizedBox(
                  width: width*0.002,
                ),
                Container(
                  height: height * 0.08,
                  width: width * 0.09,
                  decoration: BoxDecoration(
                    color: colorConst.lightgrey1,
                    border: Border.all(width: width*0.001,color: Colors.black45),
                  ),
                  child:Padding(
                    padding:  EdgeInsets.only(left: width*0.01),
                    child: Center(child: Text("Total( Without VAT)",style: TextStyle(fontSize: width*0.0147,fontWeight: FontWeight.w600),)),
                  ),
                ),
                SizedBox(
                  width: width*0.002,
                ),
                Container(
                  height: height * 0.08,
                  width: width * 0.07,
                  decoration: BoxDecoration(
                    color: colorConst.lightgrey1,
                    border: Border.all(width: width*0.001,color: Colors.black45),
                  ),
                  child:Padding(
                    padding:  EdgeInsets.only(left: width*0.002),
                    child: Padding(
                      padding:  EdgeInsets.all(width*0.001),
                      child: Center(child: Text("Total( With VAT)	",style: TextStyle(fontSize: width*0.014,fontWeight: FontWeight.w600),)),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: height*0.01,
            ),
        ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: height * 0.05,
                      width: width * 0.24,
                      decoration: BoxDecoration(
                      color: colorConst.lightgrey1,
                      border: Border.all(width: width*0.001,color: Colors.black45),
                    ),
                      // child:,
                    ),
                    SizedBox(
                      width: width*0.002,
                    ),
                    Container(
                      height: height * 0.05,
                      width: width * 0.05,
                      decoration: BoxDecoration(
                        color: colorConst.lightgrey1,
                        border: Border.all(width: width*0.001,color: Colors.black45),
                      ),
                      // child:,
                    ),
                    SizedBox(
                      width: width*0.002,
                    ),
                    Container(
                      height: height * 0.05,
                      width: width * 0.07,
                      decoration: BoxDecoration(
                        color: colorConst.lightgrey1,
                        border: Border.all(width: width*0.001,color: Colors.black45),
                      ),
                      // child:,
                    ),
                    SizedBox(
                      width: width*0.002,
                    ),
                    Container(
                      height: height * 0.05,
                      width: width * 0.05,
                      decoration: BoxDecoration(
                        color: colorConst.lightgrey1,
                        border: Border.all(width: width*0.001,color: Colors.black45),
                      ),
                      // child:,
                    ),
                    SizedBox(
                      width: width*0.002,
                    ),
                    Container(
                      height: height * 0.05,
                      width: width * 0.07,
                      decoration: BoxDecoration(
                        color: colorConst.lightgrey1,
                        border: Border.all(width: width*0.001,color: Colors.black45),
                      ),
                      // child:,
                    ),
                    SizedBox(
                      width: width*0.002,
                    ),
                    Container(
                      height: height * 0.05,
                      width: width * 0.12,
                      decoration: BoxDecoration(
                        color: colorConst.lightgrey1,
                        border: Border.all(width: width*0.001,color: Colors.black45),
                      ),
                      // child:,
                    ),
                    SizedBox(
                      width: width*0.002,
                    ),
                    Container(
                      height: height * 0.05,
                      width: width * 0.05,
                      decoration: BoxDecoration(
                        color: colorConst.lightgrey1,
                        border: Border.all(width: width*0.001,color: Colors.black45),
                      ),
                      // child:,
                    ),
                    SizedBox(
                      width: width*0.002,
                    ),
                    Container(
                      height: height * 0.05,
                      width: width * 0.09,
                      decoration: BoxDecoration(
                        color: colorConst.lightgrey1,
                        border: Border.all(width: width*0.001,color: Colors.black45),
                      ),
                      // child:,
                    ),
                    SizedBox(
                      width: width*0.002,
                    ),
                    Container(
                      height: height * 0.05,
                      width: width * 0.07,
                      decoration: BoxDecoration(
                        color: colorConst.lightgrey1,
                        border: Border.all(width: width*0.001,color: Colors.black45),
                      ),
                      // child:,
                    ),
                  ],
                ),
              ],
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(
              height: height * 0.01,
            );
          },
          itemCount: 7,
        ),
            SizedBox(
              height: height*0.03,
            )
          ],
        ),
      ),
    )
      :Scaffold(
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
