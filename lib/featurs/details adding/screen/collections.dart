import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:plexpay/Const/colorConst.dart';

import '../../../main.dart';
import '../../../Const/widgets.dart';
import '../../../Const/imageConst.dart';

class Collections extends StatefulWidget {
  const Collections({super.key});

  @override
  State<Collections> createState() => _CollectionsState();
}

class _CollectionsState extends State<Collections> {

  List c=[
    {
      "Text1":"Transaction ID :",
      "Text2":"PXYDUE603",
      "Text3":"10.00"
    },
    {
      "Text1":"Transaction ID :",
      "Text2":"PXYDUE603",
      "Text3":"20.00"
    },
    {
      "Text1":"Transaction ID :",
      "Text2":"PXYDUE603",
      "Text3":"30.00"
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
          "Collections",
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
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return CollectionList(c: c, index:index ,);
              },
              separatorBuilder: (context, index) {
                return SizedBox();
              },
              itemCount: c.length)
        ],
      ),
    );
  }
}

class CollectionList extends StatefulWidget {
  final List c;
  final int index;
  const CollectionList({super.key,
    required this.c,
    required this.index});

  @override
  State<CollectionList> createState() => _CollectionListState();
}

class _CollectionListState extends State<CollectionList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        gap,
        Container(
          height: width * 0.18,
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
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(widget.c[widget.index]["Text1"],
                      style: TextStyle(
                        fontSize: width*0.03
                      ),
                    ),
                    Text(
                      widget.c[widget.index]["Text2"],
                      style: TextStyle(
                          fontSize: width * 0.05, fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
                Container(
                  height: width * 0.09,
                  width: width * 0.2,
                  decoration: BoxDecoration(
                      color: colorConst.lightgrey1,
                      borderRadius: BorderRadius.circular(width * 0.015)),
                  child: Center(
                      child: Text(
                        widget.c[widget.index]["Text3"],
                    style: TextStyle(
                        fontWeight: FontWeight.w600, fontSize: width * 0.045),
                  )),
                ),
              ],
            ),
          ),
        ),

      ],
    );
  }
}
