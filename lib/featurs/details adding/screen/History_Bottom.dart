import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
// import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:plexpay/Const/widgets.dart';
import 'package:plexpay/featurs/details%20adding/screen/Recharge%20bill%20genarate.dart';
import 'package:screenshot/screenshot.dart';
import 'package:shimmer/shimmer.dart';
// import 'package:plexpay/Api/transactionSaleApi.dart';
// import 'package:plexpay/Api/transactionSearchApi.dart';
import '../../../api/historysearch_API.dart';
import '../../../api/salehistoryAPI.dart';
import '../../../main.dart';
import '../../../Const/colorConst.dart';
import 'Constants.dart';
import '../../../Const/imageConst.dart';

class HistoryBottom3 extends StatefulWidget {
  @override
  _HistoryBottom3State createState() => _HistoryBottom3State();
}

class _HistoryBottom3State extends State<HistoryBottom3> {
  var purchaseDate = "0";
  var historyList=[];
  var isLoading = false;

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


  TextEditingController searchController = new TextEditingController();
  FocusNode numFocus = FocusNode();

  Future<String> getHistory() async {
    setState(() {
      isLoading = true;
    });
    print("xoxoxo");

    var rsp = await transactionSaleApi(start, end);

    // arrProdList = data;
    //
    if (rsp['status'] == true) {
      setState(() {
        historyList = rsp['transactions'];

        // totalSale = rsp['total_card_sale'].toString();
        // totalProfit = "₹"+rsp['total_profit'].toString();
      });
      print("arrProdList");
      print(historyList);
    }

    setState(() {
      isLoading = false;
    });



    return "";
  }
  Future<String> getSearch(key) async {
    print("xoxoxo");
    setState(() {
      isLoading = true;
    });
    var rsp = await transactionSearchApi(key);

    // arrProdList = data;
    //
    if (rsp['status'] ==  "success") {
      setState(() {
        historyList.clear();
        historyList = rsp['Info'];

        // totalSale = rsp['total_card_sale'].toString();
        // totalProfit = "₹"+rsp['total_profit'].toString();
      });
      print("historyList");
      print(historyList);
    }

    setState(() {
      isLoading = false;
    });

    return "";
  }

  @override
  void dispose() {
    numFocus.unfocus();
    super.dispose();
  }
  
  
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
      
      getHistory();
      print(pickedRange.start.day);
      print(pickedRange.start.month);
      print(pickedRange.start.year);
    }
  }
  

  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(context).size.width > 650 ?
      Scaffold(
      backgroundColor: Colors.white,
      // floatingActionButton: FloatingActionButton(
      //   onPressed:arrProdList.length==0?null: () {
      //     _showDialog(context);
      //     // Navigator.push(
      //     //   context,
      //     //   MaterialPageRoute(builder: (context) => TransactionPrint()),
      //     // );
      //   },
      //   child: const Icon(Icons.print),
      //   backgroundColor: arrProdList.length==0?Colors.grey:themeColor,
      // ),
      appBar: AppBar(
        backgroundColor: colorConst.blue,
        // brightness: Brightness.dark,
        automaticallyImplyLeading: false,
        title: Container(
          width: double.infinity,
          height: height*0.07,
          decoration: BoxDecoration(
              color: Colors.grey[50], borderRadius: BorderRadius.circular(width*0.01)),
          child: Center(
            child: TextField(
              controller: searchController,
              textInputAction: TextInputAction.search,
              keyboardType: TextInputType.number,
              autofocus: false,
              focusNode: numFocus,
              cursorColor: colorConst.blue,
              onChanged: (key) async {
              },
              onSubmitted: (key) async {
                print("keey");
                var rsp = await getSearch(key);
                print(rsp);
              },
              decoration: InputDecoration(
                  prefixIcon:  Icon(Icons.search, color: Colors.black),
                  suffixIcon: IconButton(
                    icon:  Icon(
                      Icons.clear,
                    ),
                    onPressed: () {
                      /* Clear the search field */

                      setState(() {
                        numFocus.unfocus();
                        searchController.clear();
                        historyList.clear();
                        isLoading = false;

                      });
                    },
                  ),
                  contentPadding: EdgeInsets.only(top: width*0.003),
                  hintText: 'Search...',
                  border: InputBorder.none),
            ),
          ),
        ),
      ),
      body:isLoading == true
          ? SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: height*0.02,
            ),
            Shimmer.fromColors(
              baseColor: Colors.grey.shade100,
              highlightColor: Colors.white,
              direction: ShimmerDirection.btt,
              enabled: true,
              child: Container(
                height: height * 0.13,
                width: width * 0.86,
                margin: EdgeInsets.only(left: width*0.03,right: width*0.03,bottom: width*0.03),
                decoration: BoxDecoration(
                  color: colorConst.lightgrey1,
                  borderRadius: BorderRadius.circular(width*0.03),
                ),)
            ),

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
                      height: height*0.15,
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
          : SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: Container(
                    height: height * 0.13,
                    width: width * 0.86,
                    margin: EdgeInsets.all(width*0.03),
                    decoration: BoxDecoration(
                      // color: Colors.red,
                        border:
                        Border.all(width: width * 0.001, color: colorConst.grey),
                        borderRadius: BorderRadius.circular(width * 0.018)),
                    child: Padding(
                      padding:  EdgeInsets.all(width*0.015),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.date_range_outlined,
                            color: Colors.lightBlueAccent,
                            size: width*0.024,
                          ),
                          SizedBox(
                            width: width*0.03,
                          ),
                          Expanded(
                            child: Text(
                              start + "  to  " + end,
                              maxLines: 2,
                              style: TextStyle(
                                  fontSize: width*0.021
                              ),
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
                                  SizedBox(width: width*0.012,),
                                  Icon(Icons.filter_alt,color: Colors.white,size:width*0.017 ,),
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
                  scrollDirection: Axis.vertical,
                  physics: BouncingScrollPhysics(),
                  itemCount: historyList != null ? historyList.length : 0,
                  itemBuilder: (context, index) {
                    final item=historyList != null ? historyList[index] : null;
                    return HistoryData(item: item, index: index);
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox();
                  },
                ),
              ],
            ),
          ),
    ):
    Scaffold(
      backgroundColor: Colors.white,
      // floatingActionButton: FloatingActionButton(
      //   onPressed:arrProdList.length==0?null: () {
      //     _showDialog(context);
      //     // Navigator.push(
      //     //   context,
      //     //   MaterialPageRoute(builder: (context) => TransactionPrint()),
      //     // );
      //   },
      //   child: const Icon(Icons.print),
      //   backgroundColor: arrProdList.length==0?Colors.grey:themeColor,
      // ),
      appBar: AppBar(
        backgroundColor: colorConst.blue,
        // brightness: Brightness.dark,
        automaticallyImplyLeading: false,
        title: Container(
          width: double.infinity,
          height: 40,
          decoration: BoxDecoration(
              color: Colors.grey[50], borderRadius: BorderRadius.circular(width*0.03)),
          child: Center(
            child: TextField(
              controller: searchController,
              textInputAction: TextInputAction.search,
              keyboardType: TextInputType.number,
              autofocus: false,
              focusNode: numFocus,
              cursorColor: colorConst.blue,
              onChanged: (key) async {
              },
              onSubmitted: (key) async {
                print("keey");
                var rsp = await getSearch(key);
                print(rsp);
              },
              decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search, color: Colors.black),
                  suffixIcon: IconButton(
                    icon: const Icon(
                      Icons.clear,
                    ),
                    onPressed: () {
                      /* Clear the search field */

                      setState(() {
                        numFocus.unfocus();
                        searchController.clear();
                        historyList.clear();
                        isLoading = false;

                      });
                    },
                  ),
                  contentPadding: EdgeInsets.only(top: width*0.01),
                  hintText: 'Search...',
                  border: InputBorder.none),
            ),
          ),
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
                  height: width*0.2,
                  margin: EdgeInsets.only(left: width*0.03,right: width*0.03,bottom: width*0.03),
                  decoration: BoxDecoration(
                    color: colorConst.lightgrey1,
                    borderRadius: BorderRadius.circular(width*0.03),
                  ),)
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
          : SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Container(
                height: width * 0.125,
                width: width * 0.86,
                margin: EdgeInsets.all(width*0.03),
                decoration: BoxDecoration(
                  // color: Colors.red,
                    border:
                    Border.all(width: width * 0.001, color: colorConst.grey),
                    borderRadius: BorderRadius.circular(width * 0.03)),
                child: Padding(
                  padding:  EdgeInsets.all(width*0.03),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.date_range_outlined,
                        color: Colors.lightBlueAccent,
                        size: width*0.053,
                      ),
                      SizedBox(
                        width: width*0.03,
                      ),
                      Expanded(
                        child: Text(
                          start + "  to  " + end,
                          maxLines: 2,
                          style: TextStyle(
                              fontSize: width*0.043
                          ),
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
                              SizedBox(width: width*0.012,),
                              Icon(Icons.filter_alt,color: Colors.white,size:width*0.042 ,),
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
              scrollDirection: Axis.vertical,
              physics: BouncingScrollPhysics(),
              itemCount: historyList != null ? historyList.length : 0,
              itemBuilder: (context, index) {
                final item=historyList != null ? historyList[index] : null;
                return HistoryData(item: item, index: index);
              },
              separatorBuilder: (context, index) {
                return SizedBox();
              },
            ),
          ],
        ),
      ),
    );
  }




}

class HistoryData extends StatefulWidget {
  const HistoryData({super.key,required this.item, required this.index,});
  final Map item;
  final int index;
  @override
  State<HistoryData> createState() => _HistoryDataState();
}

class _HistoryDataState extends State<HistoryData> {

  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(context).size.width > 650 ?
      AnimationLimiter(
      child: Column(
        children:  AnimationConfiguration.toStaggeredList(
        duration:  Duration(milliseconds: 300),
        childAnimationBuilder: (widget) => SlideAnimation(
        horizontalOffset: 30.0,
            child: FadeInAnimation(
              child: widget,
    )
    ),
        children: [
          InkWell(
            onTap: () {
              Navigator.push(context, CupertinoPageRoute(builder: (context) => bill(
                id: widget.item['TransactionID'].toString(),
              ),));
            },
            child: Container(
              height: height*0.15,
              margin: EdgeInsets.only(left: width*0.03,right: width*0.03,bottom: width*0.01),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(width*0.018),
                boxShadow: [
                  BoxShadow(
                      blurStyle: BlurStyle.normal,
                      color: Colors.black.withOpacity(0.09),
                      offset: Offset(0, 2),
                      spreadRadius: 1,
                      blurRadius: 9)
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: height*0.05,
                        width: width*0.1,
                        margin: EdgeInsets.only(
                          right: width*0.05,
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(width*0.9),
                        ),
                        child: Text(widget.item["provider_name"],style: TextStyle(
                          color: colorConst.blue,
                          fontWeight: FontWeight.bold
                        ),),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                          widget.item["TransactionID"].toString(),
                        style: TextStyle(
                          fontSize: width*0.02,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      Text(
                        widget.item["RechargedTime"].toString(),
                        style: TextStyle(
                          fontSize: width*0.015,
                          color: colorConst.grey,
                        ),
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.item["recharge_amount"].toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        widget.item["recharge_amount"].toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.green
                        ),
                      )
                    ],
                  ),
                  Container(
                    height: height*0.075,
                    width: width*0.11,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(width*0.013),
                      color: CupertinoColors.systemGreen,
                    ),
                    child: Center(
                      child: Text(
                        "Success",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      )
    ):
      AnimationLimiter(
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
          InkWell(
            onTap: () {
              Navigator.push(context, CupertinoPageRoute(builder: (context) => bill(
                id: widget.item['TransactionID'].toString(),
              ),));
            },
            child: Container(
              height: width*0.2,
              margin: EdgeInsets.only(left: width*0.03,right: width*0.03,bottom: width*0.03),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(width*0.03),
                boxShadow: [
                  BoxShadow(
                      blurStyle: BlurStyle.normal,
                      color: Colors.black.withOpacity(0.09),
                      offset: Offset(0, 2),
                      spreadRadius: 1,
                      blurRadius: 9)
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: width*0.1,
                        width: width*0.1,
                        margin: EdgeInsets.only(
                          right: width*0.03,
                          left: width*0.03
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(width*0.9),
                        ),
                        child: Text(widget.item["provider_name"],style: TextStyle(
                          color: colorConst.blue,
                          fontWeight: FontWeight.bold
                        ),),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                          widget.item["TransactionID"].toString(),
                        style: TextStyle(
                          fontSize: width*0.04,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      Text(
                        widget.item["RechargedTime"].toString(),
                        style: TextStyle(
                          fontSize: width*0.025,
                          color: colorConst.grey,
                        ),
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.item["recharge_amount"].toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        widget.item["recharge_amount"].toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.green
                        ),
                      )
                    ],
                  ),
                  Container(
                    height: width*0.08,
                    width: width*0.17,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(width*0.03),
                      color: CupertinoColors.systemGreen,
                    ),
                    child: Center(
                      child: Text(
                        "Success",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      )
    );
  }
}

