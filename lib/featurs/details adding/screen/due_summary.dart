import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shimmer/shimmer.dart';

import '../../../api/dueAPI.dart';
import '../../../main.dart';
import '../../../Const/colorConst.dart';
import '../../../Const/widgets.dart';
import '../../../Const/imageConst.dart';

class dueSummary extends StatefulWidget {
  const dueSummary({super.key});

  @override
  State<dueSummary> createState() => _dueSummaryState();
}

class _dueSummaryState extends State<dueSummary> {

  var dueList = [];
  var  isLoading = false;

  Future<String> getdue() async {

    setState(() {
      isLoading = true;
    });
    print("xoxoxo");

    var rsp = await dueApi(start,end);
    print(rsp);


    // arrProdList = data;
    //
    if(rsp['status']==true && rsp['result']!="Empty"){



      setState(() {

        dueList = rsp['result'];

        // totalSale = rsp['total_card_sale'].toString();
        // totalProfit = "₹"+rsp['total_profit'].toString();

      });
      print("arrProdList");
      print(dueList);
    }


    setState(() {
      isLoading = false;
    });

    return "";
  }


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
    getdue();
  }
  @override
  Widget build(BuildContext context) {
    return  MediaQuery.of(context).size.width > 650 ?
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
            height: height * 0.09,
            width: width * 0.05,
            child: Padding(
              padding: EdgeInsets.all(width * 0.01),
              child: SvgPicture.asset(
                ImageConst.back,
              ),
            ),
          ),
        ),
        title: Text(
          "Due Summary",
          style: TextStyle(fontSize: width * 0.025, fontWeight: FontWeight.w700),
        ),
      ),
      body:isLoading == true
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
            gap,
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
              scrollDirection: Axis.vertical,
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
                itemBuilder: (context, index) {
                  final item = dueList != null ? dueList[index] : null;
                  return dueSummaryList(item:item, index: index,);
                },
                separatorBuilder: (context, index) {
                  return SizedBox();
                },
                itemCount: dueList != null ? dueList.length: 0,
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
          "Due Summary",
          style: TextStyle(fontSize: width * 0.06, fontWeight: FontWeight.w700),
        ),
      ),
      body:isLoading == true
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
            gap,
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
                      height: width * 0.3,
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
              scrollDirection: Axis.vertical,
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
                itemBuilder: (context, index) {
                  final item = dueList != null ? dueList[index] : null;
                  return dueSummaryList(item:item, index: index,);
                },
                separatorBuilder: (context, index) {
                  return SizedBox();
                },
                itemCount: dueList != null ? dueList.length: 0,
            )
          ],
        ),
      ),
    );
  }
}
class dueSummaryList extends StatefulWidget {
  final Map item;
  final int  index;
  const dueSummaryList({
    super.key,
    required this.item,
    required this.index
  });

  @override
  State<dueSummaryList> createState() => _dueSummaryListState();
}

class _dueSummaryListState extends State<dueSummaryList> {
  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(context).size.width > 650 ?
      Column(
      children: [
        gap,
        Container(
          height: height * 0.27,
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
                          Text("OPEN BALANCE",style: TextStyle(fontSize: width*0.014),),
                          Text("ENTRY DATE",style: TextStyle(fontSize: width*0.014)),
                          Text("COLLECTED",style: TextStyle(fontSize: width*0.014)),
                          Text("CLOSED BALANCE",style: TextStyle(fontSize: width*0.014)),
                          Text("FULL NAME",style: TextStyle(fontSize: width*0.014)),
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
                      Text(widget.item["open_bal"],style: TextStyle(fontSize: width*0.014)),
                      Text(widget.item["entry_date"],style: TextStyle(fontSize: width*0.014)),
                      Text(widget.item["collected"],style: TextStyle(fontSize: width*0.014),),
                      Text(widget.item["close_bal"],style: TextStyle(fontSize: width*0.014)),
                      Text(widget.item["fullname"],style: TextStyle(fontSize: width*0.014)),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    ):
      Column(
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
                          Text("OPEN BALANCE",style: TextStyle(fontSize: width*0.04),),
                          Text("ENTRY DATE",style: TextStyle(fontSize: width*0.04)),
                          Text("COLLECTED",style: TextStyle(fontSize: width*0.04)),
                          Text("CLOSED BALANCE",style: TextStyle(fontSize: width*0.04)),
                          Text("FULL NAME",style: TextStyle(fontSize: width*0.04)),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(":",style: TextStyle(fontSize: width*0.04)),
                          Text(":",style: TextStyle(fontSize: width*0.04)),
                          Text(":",style: TextStyle(fontSize: width*0.04)),
                          Text(":",style: TextStyle(fontSize: width*0.04)),
                          Text(":",style: TextStyle(fontSize: width*0.04)),
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
                      Text(widget.item["open_bal"],style: TextStyle(fontSize: width*0.043)),
                      Text(widget.item["entry_date"],style: TextStyle(fontSize: width*0.043)),
                      Text(widget.item["collected"],style: TextStyle(fontSize: width*0.043),),
                      Text(widget.item["close_bal"],style: TextStyle(fontSize: width*0.043)),
                      Text(widget.item["fullname"],style: TextStyle(fontSize: width*0.043)),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
