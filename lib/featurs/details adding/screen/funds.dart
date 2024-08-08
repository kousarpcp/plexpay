import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:plexpay/Const/widgets.dart';

import '../../../main.dart';
import '../../../Const/colorConst.dart';
import '../../../Const/imageConst.dart';

class Funds extends StatefulWidget {
  const Funds({super.key});

  @override
  State<Funds> createState() => _FundsState();
}

class _FundsState extends State<Funds> {

  List F=[
    {
      "Text1":"ENTRY DATE",
      "Text2":"PREV BLNC",
      "Text3":"PREV DUE",
      "Text4":"FUND",
      "Text5":"TOTAL WALLET",
      "Text6":"TOTAL DUE",
      "Text7":":",
      "Text8":":",
      "Text9":":",
      "Text10":":",
      "Text11":":",
      "Text12":":",
      "Text13":"2023-03-23 12:02:12",
      "Text14":"AED 5.14",
      "Text15":"AED 500.00",
      "Text16":"50.00",
      "Text17":"AED 55.14",
      "Text18":"AED 550",
    },
    {
      "Text1":"ENTRY DATE",
      "Text2":"PREV BLNC",
      "Text3":"PREV DUE",
      "Text4":"FUND",
      "Text5":"TOTAL WALLET",
      "Text6":"TOTAL DUE",
      "Text7":":",
      "Text8":":",
      "Text9":":",
      "Text10":":",
      "Text11":":",
      "Text12":":",
      "Text13":"2023-03-23 12:02:12",
      "Text14":"AED 12.14",
      "Text15":"AED 550.00",
      "Text16":"100.00",
      "Text17":"AED 112.93",
      "Text18":"AED 650",
    },
    {
      "Text1":"ENTRY DATE",
      "Text2":"PREV BLNC",
      "Text3":"PREV DUE",
      "Text4":"FUND",
      "Text5":"TOTAL WALLET",
      "Text6":"TOTAL DUE",
      "Text7":":",
      "Text8":":",
      "Text9":":",
      "Text10":":",
      "Text11":":",
      "Text12":":",
      "Text13":"2023-03-23 12:02:12",
      "Text14":"AED 5.14",
      "Text15":"AED 650.00",
      "Text16":"20.00",
      "Text17":"AED 21.48",
      "Text18":"AED 670",
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
          "Funds",
          style: TextStyle(fontSize: width * 0.06, fontWeight: FontWeight.w700),
        ),
      ),
      body: Column(
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
                return FundList(F: F, index: index,

                );

              },
              separatorBuilder: (context, index) {
                return SizedBox();
              },
              itemCount: F.length
          )
        ],
      ),
    );
  }
}
class FundList extends StatefulWidget {
  final List F;
  final int  index;
  const FundList({super.key,
    required this.F,
    required this.index
  });

  @override
  State<FundList> createState() => _FundListState();
}

class _FundListState extends State<FundList> {
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
                          Text(widget.F[widget.index]["Text1"],style: TextStyle(fontSize: width*0.035),),
                          Text(widget.F[widget.index]["Text2"],style: TextStyle(fontSize: width*0.035)),
                          Text(widget.F[widget.index]["Text3"],style: TextStyle(fontSize: width*0.035)),
                          Text(widget.F[widget.index]["Text4"],style: TextStyle(fontSize: width*0.035)),
                          Text(widget.F[widget.index]["Text5"],style: TextStyle(fontSize: width*0.035)),
                          Text(widget.F[widget.index]["Text6"],style: TextStyle(fontSize: width*0.035)),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(widget.F[widget.index]["Text7"],style: TextStyle(fontSize: width*0.035)),
                          Text(widget.F[widget.index]["Text8"],style: TextStyle(fontSize: width*0.035)),
                          Text(widget.F[widget.index]["Text9"],style: TextStyle(fontSize: width*0.035)),
                          Text(widget.F[widget.index]["Text10"],style: TextStyle(fontSize: width*0.035)),
                          Text(widget.F[widget.index]["Text11"],style: TextStyle(fontSize: width*0.035)),
                          Text(widget.F[widget.index]["Text12"],style: TextStyle(fontSize: width*0.035)),
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
                      Text(widget.F[widget.index]["Text13"],style: TextStyle(fontSize: width*0.035),),
                      Text(widget.F[widget.index]["Text14"],style: TextStyle(fontSize: width*0.035)),
                      Text(widget.F[widget.index]["Text15"],style: TextStyle(fontSize: width*0.035)),
                      Text(widget.F[widget.index]["Text16"],style: TextStyle(fontSize: width*0.035)),
                      Text(widget.F[widget.index]["Text17"],style: TextStyle(fontSize: width*0.035)),
                      Text(widget.F[widget.index]["Text18"],style: TextStyle(fontSize: width*0.035)),
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
