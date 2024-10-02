import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shimmer/shimmer.dart';

import '../../../api/Profit_api.dart';
import '../../../main.dart';
import '../../../Const/colorConst.dart';
import '../../../Const/widgets.dart';
import '../../../Const/imageConst.dart';

class profitSummary extends StatefulWidget {
  const profitSummary({super.key});

  @override
  State<profitSummary> createState() => _profitSummaryState();
}

class _profitSummaryState extends State<profitSummary> {

  List P=[
    {
      "Text1":"NAME",
      "Text2":"RECHARGE TIME",
      "Text3":"BUYING COST",
      "Text4":" MRP",
      "Text5":"PROFIT",
      "Text6":":",
      "Text7":":",
      "Text8":":",
      "Text9":":",
      "Text10":":",
      "Text11":"DU UAE",
      "Text12":"2023-03-23 12:02:12",
      "Text13":"AED 4.95",
      "Text14":"AED 5.00",
      "Text15":"AED 0.05",
    },
    {
      "Text1":"NAME",
      "Text2":"RECHARGE TIME",
      "Text3":"BUYING COST",
      "Text4":" MRP",
      "Text5":"PROFIT",
      "Text6":":",
      "Text7":":",
      "Text8":":",
      "Text9":":",
      "Text10":":",
      "Text11":"Airtel India",
      "Text12":"2023-03-23 12:02:12",
      "Text13":"AED 16.34",
      "Text14":"AED 19.00",
      "Text15":"AED 2.66",
    },
    {
      "Text1":"NAME",
      "Text2":"RECHARGE TIME",
      "Text3":"BUYING COST",
      "Text4":" MRP",
      "Text5":"PROFIT",
      "Text6":":",
      "Text7":":",
      "Text8":":",
      "Text9":":",
      "Text10":":",
      "Text11":"Etisalat UAE",
      "Text12":"2023-03-23 12:02:12",
      "Text13":"AED 9.90",
      "Text14":"AED 10.00",
      "Text15":"AED 0.10",
    },
    {
      "Text1":"NAME",
      "Text2":"RECHARGE TIME",
      "Text3":"BUYING COST",
      "Text4":" MRP",
      "Text5":"PROFIT",
      "Text6":":",
      "Text7":":",
      "Text8":":",
      "Text9":":",
      "Text10":":",
      "Text11":"Etisalat UAE",
      "Text12":"2024-03-23 12:02:12",
      "Text13":"AED 49.50",
      "Text14":"AED 50.00",
      "Text15":"AED 0.50",
    },
  ];



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
        fieldEndLabelText: 'End Date'));

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
    }
    getProfit();
  }

  var profitList = [];
  var  isLoading = false;
  @override

  Future<String> getProfit() async {

    setState(() {
      isLoading = true;
    });
    print("xoxoxo");

    var rsp = await profitApi(start,end);
    print(rsp);

    if(rsp['status']==true && rsp['result']!="Empty"){

      setState(() {
        profitList = rsp['result'];

      });
      print("arrProdList");
      print(profitList);
    }

    setState(() {
      isLoading = false;
    });

    return "";
  }
  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(context).size.width > 650 ?
      Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
        elevation: 0,
        // leading: InkWell(
        //   onTap: () {
        //     Navigator.pop(context);
        //   },
        //   child: Container(
        //     height: height * 0.09,
        //     width: width * 0.05,
        //     child: Padding(
        //       padding: EdgeInsets.all(width * 0.01),
        //       child: SvgPicture.asset(
        //         ImageConst.back,
        //       ),
        //     ),
        //   ),
        // ),
        title: Text(
          "Profit Summary",
          style: TextStyle(fontSize: width * 0.025, fontWeight: FontWeight.w700),
        ),
      ),
      body: isLoading == true
          ? SingleChildScrollView(
        child: Column(
          children: [
            Shimmer.fromColors(
              baseColor: Colors.grey.shade100,
              highlightColor: Colors.white,
              direction: ShimmerDirection.btt,
              enabled: true,
              child: Container(
                height: height * 0.13,
                width: width * 0.86,
                decoration: BoxDecoration(
                    color: colorConst.lightgrey1,
                    // color: Colors.red,
                    borderRadius: BorderRadius.circular(width * 0.03)),
              ),
            ),
            SizedBox(height: width*0.02,),
            ListView.separated(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Shimmer.fromColors(
                    baseColor: Colors.grey.shade100,
                    highlightColor: Colors.white,
                    direction: ShimmerDirection.btt,
                    enabled: true,
                    child: Container(
                      height: height * 0.27,
                      margin: EdgeInsets.only(left: width*0.03,right: width*0.03,bottom: width*0.01),
                      decoration: BoxDecoration(
                          color: colorConst.lightgrey1,
                          borderRadius: BorderRadius.circular(width * 0.03)),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox();
                },
                itemCount: 8)
          ],
        ),
      ):SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [

            Center(
              child: Container(
                height: height * 0.13,
                width: width * 0.86,
                decoration: BoxDecoration(
                  // color: Colors.red,
                    border:
                    Border.all(width: width * 0.001, color: colorConst.grey),
                    borderRadius: BorderRadius.circular(width * 0.018)),
                child: Padding(
                  padding: EdgeInsets.all(width * 0.015),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.date_range_outlined,
                        color: Colors.lightBlueAccent,
                        size: width * 0.024,
                      ),
                      SizedBox(
                        width: width * 0.03,
                      ),
                      Expanded(
                        child: Text(
                          start + "  to  " + end,
                          maxLines: 2,
                          style: TextStyle(fontSize: width * 0.021),
                          // style: Theme.of(context).textTheme.subtitle2,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          selectDateRange(context);
                        },
                        child: Container(
                          height: height * 0.064,
                          width: width * 0.11,
                          decoration: BoxDecoration(
                              color: colorConst.blue,
                              borderRadius: BorderRadius.circular(width * 0.03)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                  child: Text(
                                    "FILTER",
                                    style: TextStyle(
                                        fontSize: width * 0.014,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white),
                                  )),
                              SizedBox(
                                width: width * 0.012,
                              ),
                              Icon(
                                Icons.filter_alt,
                                color: Colors.white,
                                size: width * 0.017,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),

            ListView.separated(
              itemCount: profitList != null ? profitList.length: 0,
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  final item = profitList!= null ? profitList[index] : null;
                  return Column(
                    children: [
                      SizedBox(
                        height: height*0.01,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height>520? height * 0.27:height*0.35,
                        margin: EdgeInsets.only(left: width*0.03,right: width*0.03,bottom: width*0.01),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  blurStyle: BlurStyle.normal,
                                  color: Colors.black.withOpacity(0.09),
                                  offset: Offset(0, 2),
                                  spreadRadius: 1,
                                  blurRadius: 9)
                            ],
                            borderRadius: BorderRadius.circular(width * 0.018)),
                        child: Padding(
                          padding:  EdgeInsets.all(width*0.023),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: height*0.28,
                                width: width*0.48,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("NAME",style: TextStyle(fontSize: width*0.014),),
                                        Text("RECHARGE TIME",style: TextStyle(fontSize: width*0.014)),
                                        Text("BUYING COST",style: TextStyle(fontSize: width*0.014)),
                                        Text(" MRP",style: TextStyle(fontSize: width*0.014)),
                                        Text("PROFIT",style: TextStyle(fontSize: width*0.014)),
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(":",style: TextStyle(fontSize: width*0.014)),
                                        Text(":",style: TextStyle(fontSize: width*0.014)),
                                        Text(":",style: TextStyle(fontSize: width*0.014)),
                                        Text(":",style: TextStyle(fontSize: width*0.014)),
                                        Text(":",style: TextStyle(fontSize: width*0.014)),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: height*0.28,
                                width: width*0.39,
                                child:  Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(item['Name'],style: TextStyle(fontSize: width*0.014)),
                                    Text(item['RechargedTime'],style: TextStyle(fontSize: width*0.014)),
                                    Text(item['buyingCost'],style: TextStyle(fontSize: width*0.014)),
                                    Text(item['MRP'],style: TextStyle(fontSize: width*0.014)),
                                    Text(item['profit'],style: TextStyle(fontSize: width*0.014)),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  );

                },
                separatorBuilder: (context, index) {
                  return SizedBox();
                },

            )
          ],
        ),
      ),
    ):
      Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            height: width * 0.05,
            width: width * 0.08,
            child: Padding(
              padding: EdgeInsets.all(width * 0.03),
              child: SvgPicture.asset(
                ImageConst.back,
              ),
            ),
          ),
        ),
        title: Text(
          "Profit Summary",
          style: TextStyle(fontSize: width * 0.06, fontWeight: FontWeight.w700),
        ),
      ),
      body: isLoading == true
          ? SingleChildScrollView(
        child: Column(
          children: [
            Shimmer.fromColors(
              baseColor: Colors.grey.shade100,
              highlightColor: Colors.white,
              direction: ShimmerDirection.btt,
              enabled: true,
              child: Container(
                height: width * 0.125,
                width: width * 0.86,
                decoration: BoxDecoration(
                    color: colorConst.lightgrey1,
                    // color: Colors.red,
                    borderRadius: BorderRadius.circular(width * 0.03)),
              ),
            ),
            SizedBox(height: width*0.02,),
            ListView.separated(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Shimmer.fromColors(
                    baseColor: Colors.grey.shade100,
                    highlightColor: Colors.white,
                    direction: ShimmerDirection.btt,
                    enabled: true,
                    child: Container(
                      height: width * 0.18,
                      margin: EdgeInsets.only(left: width*0.03,right: width*0.03,bottom: width*0.01),
                      decoration: BoxDecoration(
                          color: colorConst.lightgrey1,
                          borderRadius: BorderRadius.circular(width * 0.03)),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox();
                },
                itemCount: 8)
          ],
        ),
      ):SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [

            Center(
              child: Container(
                height: width * 0.125,
                width: width * 0.86,
                decoration: BoxDecoration(
                  // color: Colors.red,
                    border:
                    Border.all(width: width * 0.001, color: colorConst.grey),
                    borderRadius: BorderRadius.circular(width * 0.03)),
                child: Padding(
                  padding: EdgeInsets.all(width * 0.03),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.date_range_outlined,
                        color: Colors.lightBlueAccent,
                        size: width * 0.053,
                      ),
                      SizedBox(
                        width: width * 0.03,
                      ),
                      Expanded(
                        child: Text(
                          start + "  to  " + end,
                          maxLines: 2,
                          style: TextStyle(fontSize: width * 0.043),
                          // style: Theme.of(context).textTheme.subtitle2,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          selectDateRange(context);
                        },
                        child: Container(
                          height: width * 0.077,
                          width: width * 0.23,
                          decoration: BoxDecoration(
                              color: colorConst.blue,
                              borderRadius: BorderRadius.circular(width * 0.35)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                  child: Text(
                                    "FILTER",
                                    style: TextStyle(
                                        fontSize: width * 0.044,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white),
                                  )),
                              SizedBox(
                                width: width * 0.012,
                              ),
                              Icon(
                                Icons.filter_alt,
                                color: Colors.white,
                                size: width * 0.038,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),

            ListView.separated(
              itemCount: profitList != null ? profitList.length: 0,
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  final item = profitList!= null ? profitList[index] : null;
                  return Column(
                    children: [
                      gap,
                      Container(
                        height: width * 0.37,
                        margin: EdgeInsets.only(left: width*0.03,right: width*0.03,bottom: width*0.01),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  blurStyle: BlurStyle.normal,
                                  color: Colors.black.withOpacity(0.09),
                                  offset: Offset(0, 2),
                                  spreadRadius: 1,
                                  blurRadius: 9)
                            ],
                            borderRadius: BorderRadius.circular(width * 0.03)),
                        child: Padding(
                          padding:  EdgeInsets.all(width*0.03),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: width*0.35,
                                width: width*0.48,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("NAME",style: TextStyle(fontSize: width*0.035),),
                                        Text("RECHARGE TIME",style: TextStyle(fontSize: width*0.035)),
                                        Text("BUYING COST",style: TextStyle(fontSize: width*0.035)),
                                        Text(" MRP",style: TextStyle(fontSize: width*0.035)),
                                        Text("PROFIT",style: TextStyle(fontSize: width*0.035)),
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(":",style: TextStyle(fontSize: width*0.035)),
                                        Text(":",style: TextStyle(fontSize: width*0.035)),
                                        Text(":",style: TextStyle(fontSize: width*0.035)),
                                        Text(":",style: TextStyle(fontSize: width*0.035)),
                                        Text(":",style: TextStyle(fontSize: width*0.035)),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: width*0.35,
                                width: width*0.39,
                                child:  Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(item['Name'],style: TextStyle(fontSize: width*0.035)),
                                    Text(item['RechargedTime'],style: TextStyle(fontSize: width*0.035)),
                                    Text(item['buyingCost'],style: TextStyle(fontSize: width*0.035)),
                                    Text(item['MRP'],style: TextStyle(fontSize: width*0.035)),
                                    Text(item['profit'],style: TextStyle(fontSize: width*0.035)),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  );

                },
                separatorBuilder: (context, index) {
                  return SizedBox();
                },

            )
          ],
        ),
      ),
    );
  }
}
var purchaseDate;
Widget totalSales(){
  return    Padding(
    padding:  EdgeInsets.only(top:width*0.03),
    child: Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.sync_alt_sharp,
              size: 15,
              color: Colors.green,
            ),
            SizedBox(width: 16,),
            Expanded(
              flex: 1,
              child: Text(
                "Total Card Sales : "+ purchaseDate,
                maxLines: 2,
                // style: Theme.of(context).textTheme.subtitle2,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
// class profitSummaryList extends StatefulWidget {
//   final List P;
//   final int  index;
//   const profitSummaryList({
//     super.key,
//     required this.P,
//     required this.index
//   });
//
//   @override
//   State<profitSummaryList> createState() => _profitSummaryListState();
// }
//
// class _profitSummaryListState extends State<profitSummaryList> {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         gap,
//
//       ],
//     );
//   }
// }
