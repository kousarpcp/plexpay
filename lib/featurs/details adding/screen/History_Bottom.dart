import 'package:flutter/material.dart';
// import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
// import 'package:plexpay/Api/transactionSaleApi.dart';
// import 'package:plexpay/Api/transactionSearchApi.dart';
import 'Constants.dart';
// import 'package:plexpay/Helper/resources.dart';
// import 'package:plexpay/Screens/PrintPage.dart';

import '../Api/TransactionSaleApi.dart';
import '../Api/TransactionSearchApi.dart';
import '../screen/PrintPage.dart';
import 'Resources.dart';

class HistoryBottom3 extends StatefulWidget {
  @override
  _HistoryBottom3State createState() => _HistoryBottom3State();
}

class _HistoryBottom3State extends State<HistoryBottom3> {
  var purchaseDate = "0";

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

  var arrProdList = [];

  var isLoading = true;
  var totalSale = "";
  var totalProfit = "";
  TextEditingController searchController = new TextEditingController();
  FocusNode numFocus = FocusNode();
  //List<dynamic> data = [];
  @override
  void initState() {
    super.initState();

    print("xoxoxo");
    this.getHome();
    if (searchController.text.isEmpty) {
      setState(() {
        numFocus.unfocus();
      });
    }
    setState(() {});
  }

  @override
  void dispose() {
    numFocus.unfocus();
    super.dispose();
  }

  Future<String> getHome() async {
    print("xoxoxo");

    var rsp = await transactionSaleApi(start, end);

    // arrProdList = data;
    //
    if (rsp['status'] == true) {
      setState(() {
        arrProdList = rsp['transactions'];

        // totalSale = rsp['total_card_sale'].toString();
        // totalProfit = "₹"+rsp['total_profit'].toString();
      });
      print("arrProdList");
      print(arrProdList);
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
    if (rsp['status'] == "success") {
      setState(() {
        arrProdList.clear();
        arrProdList = rsp['Info'];

        // totalSale = rsp['total_card_sale'].toString();
        // totalProfit = "₹"+rsp['total_profit'].toString();
      });
      print("arrProdList");
      print(arrProdList);
    }

    setState(() {
      isLoading = false;
    });

    return "";
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

      getHome();

      print(pickedRange.start.day);
      print(pickedRange.start.month);
      print(pickedRange.start.year);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50]?.withOpacity(0.99),
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
        backgroundColor: darkBlue,
        // brightness: Brightness.dark,
        automaticallyImplyLeading: false,
        title: Container(
          width: double.infinity,
          height: 40,
          decoration: BoxDecoration(
              color: Colors.grey[50], borderRadius: BorderRadius.circular(5)),
          child: Center(
            child: TextField(
              controller: searchController,
              textInputAction: TextInputAction.search,
              keyboardType: TextInputType.number,
              autofocus: false,
              focusNode: numFocus,
              cursorColor: Colors.indigo,
              onChanged: (key) async {
                print("keey");
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
                        arrProdList.clear();
                        isLoading = false;
                        getHome();
                      });
                    },
                  ),
                  hintText: 'Search...',
                  border: InputBorder.none),
            ),
          ),
        ),
      ),
      body:
          // isLoading == true
          //     ?
          // Container(child: Center(child: CircularProgressIndicator()))
          //     :
          SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(15),
          child: Wrap(
            runSpacing: 15,
            alignment: WrapAlignment.center,
            children: [
              FilterSection(),
              //  totalSales(),
              ListView.separated(
                scrollDirection: Axis.vertical,
                physics: NeverScrollableScrollPhysics(),
                separatorBuilder: (context, index) => Divider(
                  color: Colors.black54,
                ),
                shrinkWrap: true,
                itemCount: arrProdList != null ? arrProdList.length : 0,
                itemBuilder: (context, index) {
                  final item = arrProdList != null ? arrProdList[index] : null;

                  return Details(index, item);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget FilterSection() {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: (Colors.grey),
              spreadRadius: 0.01,
              blurRadius: 2,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.date_range,
                size: 15,
                color: Colors.green,
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                flex: 1,
                child: Text(
                  start + " to " + end,
                  maxLines: 2,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              returnRangePicker(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget returnRangePicker(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
          hintColor: Colors.green,
          primaryColor: Colors.blue,
          buttonTheme: ButtonThemeData(
              highlightColor: Colors.green,
              buttonColor: Colors.green,
              colorScheme: Theme.of(context).colorScheme.copyWith(
                  secondary: Colors.redAccent,
                  background: Colors.white,
                  primary: Colors.green,
                  onSecondaryFixedVariant: Colors.green,
                  brightness: Brightness.dark,
                  onBackground: Colors.green),
              textTheme: ButtonTextTheme.accent)),
      child: Builder(
        builder: (context) => SizedBox(
          height: 30,
          child: ElevatedButton(
            onPressed: () async {
              selectDateRange(context);
            },
            child: Row(
              children: [
                Text(
                  "FILTER",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 12),
                ),
                Icon(
                  Icons.filter_alt,
                  size: 15,
                  color: Colors.black,
                )
              ],
            ),
            // color: themeColor,
          ),
        ),
      ),
    );
  }

  Widget totalSales() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
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
              SizedBox(
                width: 16,
              ),
              Expanded(
                flex: 1,
                child: Text(
                  "Total Card Sales : " + purchaseDate,
                  maxLines: 2,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget Button() {
    return SizedBox(
      height: 20,
      child: ElevatedButton(
        onPressed: () {},
        child: Text(
          "FILTER",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w600, fontSize: 18),
        ),
        // color: themeColor,
      ),
    );
  }

  Details(int index, var item) {
    // final ss = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        pushNewScreen(
          context,
          screen: Print1(
            id: item['TransactionID'].toString(),
          ),
          withNavBar: false, // OPTIONAL VALUE. True by default.
          pageTransitionAnimation: PageTransitionAnimation.cupertino,
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.black12),
                    color: Colors.blue[400],
                    boxShadow: [
                      BoxShadow(
                        // color: (Colors.grey[400]),
                        spreadRadius: 1,
                        blurRadius: 3,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  // height: MediaQuery.of(context).size.height * 0.1,
                  // width: MediaQuery.of(context).size.width * 0.15,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      item['provider_name'].toString(),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item['TransactionID'].toString(),
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      item['RechargedTime'].toString(),
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.grey[500],
                          fontSize: 13),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Text(
                      item['recharge_amount']
                          .toString()
                          .split(" ")
                          .first
                          .toString(),
                      style: TextStyle(
                          color: Colors.blue[900],
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      item['recharge_amount']
                          .toString()
                          .split(" ")
                          .last
                          .toString(),
                      style: TextStyle(
                          color: Colors.blue[900],
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.green),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "SUCCESS",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _showDialog(BuildContext context) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.0)),
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.topCenter,
              children: [
                Container(
                  height: 200,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 70, 10, 10),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        // Text(
                        //   'Confirm Purchase?',
                        //   style: TextStyle(fontSize: 20),
                        // ),
                        SizedBox(
                          height: 25,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              ElevatedButton(
                                onPressed: () async {},
                                // color: themeColor,
                                child: Text(
                                  'SUNMI V2',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              // Spacer(
                              //   flex: 1,
                              // ),
                              ElevatedButton(
                                onPressed: () {
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(builder: (context) => BtTestListPrint(data:arrProdList,nwdate: start +" to "+end,title: "Transactions",)),
                                  // );
                                },
                                // color: themeColor,
                                child: Text(
                                  'BT PRINT',
                                  style: TextStyle(color: Colors.white),
                                ),
                              )
                            ]),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 20,
                  child: Text(
                    'Choose Printer',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
              ],
            ));
      },
    );
  }

  void pushNewScreen(BuildContext context,
      {required Print1 screen,
      required bool withNavBar,
      required PageTransitionAnimation pageTransitionAnimation}) {}
}
