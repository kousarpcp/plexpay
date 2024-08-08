import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../main.dart';
import '../Const/colorConst.dart';
import '../Const/widgets.dart';
import 'imageConst.dart';

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
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: SingleChildScrollView(
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
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return profitSummaryList(P: P, index: index,

                  );

                },
                separatorBuilder: (context, index) {
                  return SizedBox();
                },
                itemCount: P.length
            )
          ],
        ),
      ),
    );
  }
}
class profitSummaryList extends StatefulWidget {
  final List P;
  final int  index;
  const profitSummaryList({
    super.key,
    required this.P,
    required this.index
  });

  @override
  State<profitSummaryList> createState() => _profitSummaryListState();
}

class _profitSummaryListState extends State<profitSummaryList> {
  @override
  Widget build(BuildContext context) {
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
                          Text(widget.P[widget.index]["Text1"],style: TextStyle(fontSize: width*0.035),),
                          Text(widget.P[widget.index]["Text2"],style: TextStyle(fontSize: width*0.035)),
                          Text(widget.P[widget.index]["Text3"],style: TextStyle(fontSize: width*0.035)),
                          Text(widget.P[widget.index]["Text4"],style: TextStyle(fontSize: width*0.035)),
                          Text(widget.P[widget.index]["Text5"],style: TextStyle(fontSize: width*0.035)),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(widget.P[widget.index]["Text6"],style: TextStyle(fontSize: width*0.035)),
                          Text(widget.P[widget.index]["Text7"],style: TextStyle(fontSize: width*0.035)),
                          Text(widget.P[widget.index]["Text8"],style: TextStyle(fontSize: width*0.035)),
                          Text(widget.P[widget.index]["Text9"],style: TextStyle(fontSize: width*0.035)),
                          Text(widget.P[widget.index]["Text10"],style: TextStyle(fontSize: width*0.035)),
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
                      Text(widget.P[widget.index]["Text11"],style: TextStyle(fontSize: width*0.035)),
                      Text(widget.P[widget.index]["Text12"],style: TextStyle(fontSize: width*0.035)),
                      Text(widget.P[widget.index]["Text13"],style: TextStyle(fontSize: width*0.035)),
                      Text(widget.P[widget.index]["Text14"],style: TextStyle(fontSize: width*0.035)),
                      Text(widget.P[widget.index]["Text15"],style: TextStyle(fontSize: width*0.035)),
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
