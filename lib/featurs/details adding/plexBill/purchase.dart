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
  TextEditingController nameController=TextEditingController();
  TextEditingController numController=TextEditingController();
  TextEditingController supplierController=TextEditingController();
  TextEditingController numberController=TextEditingController();
  TextEditingController ProductController=TextEditingController();
  TextEditingController DescriptionController=TextEditingController();
  TextEditingController BuyCostController=TextEditingController();
  TextEditingController PurchaseVATController=TextEditingController();
  TextEditingController SellCostController=TextEditingController();
  TextEditingController VATController=TextEditingController();
  TextEditingController RateController=TextEditingController();
  TextEditingController InclusiveRateController=TextEditingController();
  TextEditingController InclusiveVATAmountController=TextEditingController();
  TextEditingController CategoryController=TextEditingController();

  // TextEditingController productController=TextEditingController();
  TextEditingController unitController=TextEditingController();
  TextEditingController buycostController=TextEditingController();
  TextEditingController rateController=TextEditingController();
  TextEditingController sellingcostController=TextEditingController();
  TextEditingController vatController=TextEditingController();
  TextEditingController totalController=TextEditingController();
  TextEditingController totalwithvatController=TextEditingController();

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
  String? dropdownValue1= "Select Category";

  List<String> product=[
    "Select Unit",
    "Numbers",
    "Kg",
  ];

  var category=[
    "Select Category",
    "Food",
  ];

  var mode=[
    "Select Mode",
    "Quantity",
    "Box",
    "Dozen",
  ];

  TextEditingController yearController = TextEditingController();
  TextEditingController monthController = TextEditingController();
  TextEditingController dayController = TextEditingController();

  void _updateRate() {
    final buyCost = double.tryParse(buycostController.text) ?? 0.0;
    final vat = double.tryParse(vatController.text) ?? 0.0;

    // Calculate rate
    final rate = buyCost + (buyCost * vat / 100);

    // Update rateController text
    rateController.text = rate.toStringAsFixed(2); // Adjust decimal places as needed
  }


  @override
  void initState() {
    super.initState();

    // Add listeners to calculate the rate whenever buy cost or VAT changes
    buycostController.addListener(_updateRate);
    vatController.addListener(_updateRate);


    // Add listeners to calculate rate whenever buy cost or VAT changes
    BuyCostController.addListener(calculateRate);
    PurchaseVATController.addListener(calculateRate);

    // Add listeners to calculate inclusive rate and VAT amount whenever sell cost or VAT changes
    SellCostController.addListener(calculateInclusiveValues);
    VATController.addListener(calculateInclusiveValues);
  }
  final ValueNotifier<String?> dropdownNotifier = ValueNotifier<String?>(null);
  final ValueNotifier<String?> dropdownNotifier1 = ValueNotifier<String?>(null);

  @override

  void dispose() {
    nameController.dispose();
    dropdownNotifier.dispose();
    CategoryController.dispose();
    dropdownNotifier1.dispose();
    buycostController.dispose();
    vatController.dispose();
    rateController.dispose();

    super.dispose();
  }

  // void dispose() {
  //   // Dispose controllers when not needed
  //   BuyCostController.dispose();
  //   PurchaseVATController.dispose();
  //   RateController.dispose();
  //
  //   // Dispose controllers when not needed
  //   SellCostController.dispose();
  //   VATController.dispose();
  //   InclusiveRateController.dispose();
  //   InclusiveVATAmountController.dispose();
  //   numController.dispose();
  //   supplierController.dispose();
  //   numberController.dispose();
  //   productController.dispose();
  //   DescriptionController.dispose();
  //   BuyCostController.dispose();
  //   PurchaseVATController.dispose();
  //   SellCostController.dispose();
  //   VATController.dispose();
  //   RateController.dispose();
  //   InclusiveRateController.dispose();
  //   InclusiveVATAmountController.dispose();
  //   super.dispose();
  // }

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
  List<dynamic> favourites = [];
// Define a map to store data




  void didChangeDependencies() {
    super.didChangeDependencies();
    favourites.clear();  // Clear the list each time the sheet is opened
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
                                          controller: ProductController,
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
                                              ),

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
                                      child: Material(
                                        child: TextFormField(
                                          controller: nameController,
                                          autovalidateMode: AutovalidateMode.onUserInteraction,
                                          textInputAction: TextInputAction.next,
                                          keyboardType: TextInputType.text,
                                          style: TextStyle(
                                              fontSize: width*0.016, fontWeight: FontWeight.w500),
                                          decoration: InputDecoration(
                                              suffixIcon: Container(
                                                height: width * 0.012,
                                                width: width * 0.12,

                                                child:ValueListenableBuilder<String?>(
                              valueListenable: dropdownNotifier,
                              builder: (context, value, child) {
                                return  DropdownButton(
                                    dropdownColor: Colors.white,
                                    isExpanded: true,
                                    // hint: Center(child: Text("Select Customer",style: TextStyle(fontSize: width*0.046,fontWeight: FontWeight.w800),)),

                                    icon: Padding(
                                      padding:  EdgeInsets.only(left: width*0.065),
                                      child: Row(
                                        children: [
                                          Center(
                                              child: Icon(
                                                Icons
                                                    .keyboard_arrow_down_outlined,
                                              )),
                                          SizedBox(
                                            width: width * 0.03,
                                          )
                                        ],
                                      ),
                                    ),
                                    underline: SizedBox(),
                                    value: dropdownValue,
                                    items: product
                                        .map<DropdownMenuItem<String>>(
                                            (String? value) {
                                          return DropdownMenuItem(
                                            child: Center(
                                                child: Text(
                                                  value!,
                                                  style: TextStyle(
                                                    fontSize: width * 0.016,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                )),
                                            value: value,
                                          );
                                        }).toList(),
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        dropdownNotifier.value = newValue;
                                        nameController.text = newValue ?? '';
                                      });
                                    }
                                );
                              }
                              )


                                              ),
                                              hintText: "Select Unit",
                                              contentPadding: EdgeInsets.only(bottom:height * 0.028,left: width*0.014),
                                              hintStyle: TextStyle(
                                                  fontSize: width * 0.016,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black),
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(width * 0.01))),
                                        ),
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
                                      width: width*0.88,
                                      child: Material(
                                        child: TextFormField(
                                          controller: CategoryController,
                                          autovalidateMode: AutovalidateMode.onUserInteraction,
                                          textInputAction: TextInputAction.next,
                                          keyboardType: TextInputType.text,
                                          style: TextStyle(
                                              fontSize: width*0.016, fontWeight: FontWeight.w500),
                                          decoration: InputDecoration(
                                              suffixIcon: Container(
                                                  height: width * 0.012,
                                                  width: width * 0.12,
                                                  child:ValueListenableBuilder<String?>(
                                                      valueListenable: dropdownNotifier1,
                                                      builder: (context, value, child) {
                                                        return  DropdownButton(
                                                            dropdownColor: Colors.white,
                                                            isExpanded: true,
                                                            // hint: Center(child: Text("Select Customer",style: TextStyle(fontSize: width*0.046,fontWeight: FontWeight.w800),)),

                                                            icon: Padding(
                                                              padding:  EdgeInsets.only(left: width*0.065),
                                                              child: Row(
                                                                children: [
                                                                  Center(
                                                                      child: Icon(
                                                                        Icons
                                                                            .keyboard_arrow_down_outlined,
                                                                      )),
                                                                  SizedBox(
                                                                    width: width * 0.03,
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                            underline: SizedBox(),
                                                            value: dropdownValue1,
                                                            items: category
                                                                .map<DropdownMenuItem<String>>(
                                                                    (String? value) {
                                                                  return DropdownMenuItem(
                                                                    child: Center(
                                                                        child: Text(
                                                                          value!,
                                                                          style: TextStyle(
                                                                            fontSize: width * 0.016,
                                                                            fontWeight: FontWeight.w600,
                                                                          ),
                                                                        )),
                                                                    value: value,
                                                                  );
                                                                }).toList(),
                                                            onChanged: (String? newValue) {
                                                              setState(() {
                                                                dropdownNotifier1.value = newValue;
                                                                CategoryController.text = newValue ?? '';
                                                              });
                                                            }
                                                        );
                                                      }
                                                  )


                                              ),
                                              hintText: "Select Category",
                                              contentPadding: EdgeInsets.only(bottom:height * 0.028,left: width*0.014),
                                              hintStyle: TextStyle(
                                                  fontSize: width * 0.016,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black),
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(width * 0.01))),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: height*0.04,
                                    ),
                                    CupertinoButton(
                                      onPressed: () {

                                        if (nameController
                                            .text.isNotEmpty) {
                                          // Check if the name already exists in the list
                                          if (!product.contains(
                                              nameController.text)) {
                                            setState(() {
                                              // Add the typed name to the customer list
                                              product.add(
                                                  nameController.text);
                                              // Update the dropdown value with the newly added customer
                                              dropdownNotifier.value = nameController.text;
                                              // Clear the text field after adding
                                              nameController.clear();
                                            });
                                          } else {
                                            // Optional: You can show a message or handle it gracefully if the name is already added
                                            // ScaffoldMessenger.of(context)
                                            //     .showSnackBar(SnackBar(
                                            //   content: Text(
                                            //       ""),
                                            // ));
                                          }
                                        }

                                        if (CategoryController
                                            .text.isNotEmpty) {
                                          // Check if the name already exists in the list
                                          if (!category.contains(
                                              CategoryController.text)) {
                                            setState(() {
                                              // Add the typed name to the customer list
                                              category.add(
                                                  CategoryController.text);
                                              // Update the dropdown value with the newly added customer
                                              dropdownNotifier1.value = CategoryController.text;
                                              // Clear the text field after adding
                                              CategoryController.clear();
                                            });
                                          } else {
                                            // Optional: You can show a message or handle it gracefully if the name is already added
                                            // ScaffoldMessenger.of(context)
                                            //     .showSnackBar(SnackBar(
                                            //   content: Text(
                                            //       ""),
                                            // )
                                            // );
                                          }
                                        }

                                        Map<String, dynamic> storedData = {
                                          'dropdownValue':  dropdownNotifier.value,
                                          'product': ProductController.text,
                                          'description': DescriptionController.text,
                                          'buyCost': BuyCostController.text,
                                          'purchaseVAT': PurchaseVATController.text,
                                          'sellCost': SellCostController.text,
                                          'vat': VATController.text,
                                          'rate': RateController.text,
                                          'inclusiveRate': InclusiveRateController.text,
                                          'inclusiveVATAmount': InclusiveVATAmountController.text,
                                          'category': CategoryController.text,
                                        };
                                        /// Collect data from controllers and dropdown
                                        favourites.add(storedData);
                                         dropdownValue=dropdownNotifier.value;

                                         ProductController.clear;
                                         DescriptionController.clear;
                                        BuyCostController.clear;
                                         PurchaseVATController.clear;
                                     SellCostController.clear;
                                         VATController.clear;
                                         RateController.clear;
                                         InclusiveRateController.clear;
                                        InclusiveVATAmountController.clear;
                                        CategoryController.clear;
                                        // Navigator.push(context, CupertinoPageRoute(builder: (context) => purchase(),));

                                        // Check for duplicates if necessary, then add new data to favourites
                                        if (!favourites.contains(storedData)) {
                                          favourites.add(storedData);
                                        }
                                        setState(() {

                                        });
                                        // Navigator.pop(context);
                                        print(favourites);
                                      },
                                      child: Container(
                                        height: height*0.07,
                                        width: width*0.2,
                                        decoration: BoxDecoration(
                                          color: colorConst.blue,
                                          border: Border.all(width: width*0.001,color: Colors.black45),
                                          borderRadius: BorderRadius.circular(width*0.01),
                                        ),
                                          child: Center(child: Text("ADD",style: TextStyle(fontSize: width*0.015,fontWeight: FontWeight.w600,color: CupertinoColors.white),))
                                      ),
                                    )
                                  ]
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
                                  controller: CategoryController,
                                  readOnly: true,
                                  decoration: InputDecoration(
                                      suffixIcon: Container(
                                          height: width * 0.012,
                                          width: width * 0.12,
                                          child:ValueListenableBuilder<String?>(
                                              valueListenable: dropdownNotifier1,
                                              builder: (context, value, child) {
                                                return  DropdownButton(
                                                    dropdownColor: Colors.white,
                                                    isExpanded: true,
                                                    // hint: Center(child: Text("Select Customer",style: TextStyle(fontSize: width*0.046,fontWeight: FontWeight.w800),)),

                                                    icon: Padding(
                                                      padding:  EdgeInsets.only(left: width*0.065),
                                                      child: Row(
                                                        children: [
                                                          Center(
                                                              child: Icon(
                                                                Icons
                                                                    .keyboard_arrow_down_outlined,
                                                              )),
                                                          SizedBox(
                                                            width: width * 0.03,
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    underline: SizedBox(),
                                                    value: dropdownValue1,
                                                    items: category
                                                        .map<DropdownMenuItem<String>>(
                                                            (String? value) {
                                                          return DropdownMenuItem(
                                                            child: Center(
                                                                child: Text(
                                                                  value!,
                                                                  style: TextStyle(
                                                                    fontSize: width * 0.016,
                                                                    fontWeight: FontWeight.w600,
                                                                  ),
                                                                )),
                                                            value: value,
                                                          );
                                                        }).toList(),
                                                    onChanged: (String? newValue) {
                                                      setState(() {
                                                        dropdownNotifier1.value = newValue;
                                                        CategoryController.text = newValue ?? '';
                                                      });
                                                    }
                                                );
                                              }
                                          )


                                      ),
                                      hintText: "Select Category",
                                      contentPadding: EdgeInsets.only(bottom:height * 0.015,left: width*0.014),
                                      hintStyle: TextStyle(
                                          fontSize: width * 0.016,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black),
                                      border: InputBorder.none

                                  ),
                                ),
                              )

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
                              child: Material(
                                color: Colors.transparent,
                                child: TextFormField(
                                  controller: unitController,
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
                          SizedBox(
                            height: height*0.02,
                          ),
                          Row(
                            children: [
                              Text("Buy Cost"),
                              SizedBox(
                                width: width*0.122,
                              ),
                              Text("VAT(%)"),
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
                                    controller: buycostController,
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
                                    controller: vatController,
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
                                      controller: rateController,
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
                              Text("Selling Cost"),
                              SizedBox(width: width*0.21,),
                              Text("Mode"),
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
                                    controller: sellingcostController,
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
                                  child: Material(
                                    color: Colors.transparent,
                                    child: TextFormField(
                                      controller: totalController,
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
                                      controller: totalwithvatController,
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
