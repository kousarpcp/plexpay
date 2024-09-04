import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:plexpay/Const/colorConst.dart';
import 'package:plexpay/featurs/details%20adding/screen/Recharge%20bill%20genarate.dart';
import 'package:plexpay/featurs/details%20adding/screen/collection_bill_generate.dart';
import 'package:shimmer/shimmer.dart';

import '../../../api/collectionAPI.dart';
import '../../../main.dart';
import '../../../Const/widgets.dart';
import '../../../Const/imageConst.dart';

class Collections extends StatefulWidget {
  const Collections({super.key});

  @override
  State<Collections> createState() => _CollectionsState();
}

class _CollectionsState extends State<Collections> {

  var collectionList = [];
  var isLoading = false;

  Future<String> getHome() async {
    setState(() {
      isLoading = true;
    });
    print("xoxoxo");

    var rsp = await collectionListApi(start, end);

    // arrProdList = data;
    //
    if (rsp['status'] == true&&rsp['result'].toString()!="Empty") {
      setState(() {
        collectionList = rsp['result'];

        // totalSale = rsp['total_card_sale'].toString();
        // totalProfit = "₹"+rsp['total_profit'].toString();
      });
      print("collectionList");
      print(collectionList);
    }

    setState(() {
      isLoading = false;
    });

    return "";
  }

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

      getHome();
      setState(() {

      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState

    setState(() {

    });
    super.initState();
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
          "Collections",
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
          )
          :SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: AnimationLimiter(
          child: Column(
    children:  AnimationConfiguration.toStaggeredList(
    duration: const Duration(milliseconds: 300),
    childAnimationBuilder: (widget) => SlideAnimation(
    horizontalOffset: 30.0,
    child: FadeInAnimation(
    child: widget,
    )
    ),
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
                            setState(() {
                              selectDateRange(context);
                            });
                          },
                          child: Container(
                            height: width * 0.08,
                            width: width * 0.23,
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
                                      fontSize: width * 0.04,
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
                    final item =
                    collectionList != null ? collectionList[index] : null;
                    return CollectionList(item: item,);
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox();
                  },
                  itemCount: collectionList != null ? collectionList.length : 0,)
            ],
          ),
          )
        ),
      ),
    );
  }
}

class CollectionList extends StatefulWidget {
  final Map item;

  const CollectionList({super.key,
    required this.item,
    });

  @override
  State<CollectionList> createState() => _CollectionListState();
}

class _CollectionListState extends State<CollectionList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        gap,
        InkWell(
          onTap: () {
            Navigator.push(context, CupertinoPageRoute(builder: (context) => CollectionBill(id: widget.item["due_id"]),));
          },
          child: Container(
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
                      Text("Transaction ID",
                        style: TextStyle(
                          fontSize: width*0.03
                        ),
                      ),
                      Text(
                        widget.item["trans_id"].toString(),
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
                          widget.item["collected"],
                      style: TextStyle(
                          fontWeight: FontWeight.w600, fontSize: width * 0.045),
                    )),
                  ),
                ],
              ),
            ),
          ),
        ),

      ],
    );
  }
}
