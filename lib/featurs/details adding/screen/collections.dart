import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
// import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:plexpay/featurs/details%20adding/screen/colorConst.dart';

import '../../../main.dart';
import '../Api/CollectionListApi.dart';
// import '../Helper/Resources.dart';
// import '../SubScreens/CollectionsReceipt.dart';
import 'BottomNavigation.dart';
import 'Resources.dart';
import 'imageConst.dart';
// import 'package:plexpay/Api/collectionListApi.dart';
// import 'package:plexpay/Helper/resources.dart';
// import 'package:plexpay/SubScreens/CollectionsReceipt.dart';

class Collections extends StatefulWidget {
  const Collections({key}) : super(key: key);

  @override
  _CollectionsState createState() => _CollectionsState();
}

class _CollectionsState extends State<Collections> {


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

  //List<dynamic> data = [];
  @override
  void initState() {
    super.initState();

    print("xoxoxo");
    this.getHome();

    setState(() {});
  }

  Future<String> getHome() async {
    print("xoxoxo");

    var rsp = await collectionListApi(start, end);

    // arrProdList = data;
    //
    if (rsp['status'] == true&&rsp['result'].toString()!="Empty") {
      setState(() {
        arrProdList = rsp['result'];

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

      print(pickedRange.start.day);
      print(pickedRange.start.month);
      print(pickedRange.start.year);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // brightness: Brightness.dark,
        elevation: 0,
        backgroundColor:colorConst.darkblue,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
            Navigator.push(context, MaterialPageRoute(builder: (context) =>BottomNavigation()));
          },
          child: Container(
            height: width * 0.05,
            width: width * 0.08,
            child: Padding(
              padding: EdgeInsets.all(width * 0.03),
              child: SvgPicture.asset(
                ImageConst.back,
                color: Colors.white,
              ),
            ),
          ),
        ),
        title: Text(
          "Collections",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.white
          ),
        ),

      ),
      backgroundColor: Colors.blueGrey[50]?.withOpacity(0.99),
      body:
      // isLoading == true
      //     ? Container(child: Center(child: CircularProgressIndicator()))
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
                  final item =
                  arrProdList != null ? arrProdList[index] : null;

                  return List(index, item);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  List(int index,var item) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      child: GestureDetector(
        onTap: () {
          // pushNewScreen(
          //   context,
          //   screen: CollectionsReceipt(id: item['due_id'].toString(),),
          //   withNavBar: false, // OPTIONAL VALUE. True by default.
          //   pageTransitionAnimation: PageTransitionAnimation.cupertino,
          // );
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => CollectionsReceipt()),
          // );
        },
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.black12),
              borderRadius: BorderRadius.circular(5)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Transaction ID:",
                        style: TextStyle(
                          fontSize: 10,
                        ),
                      ),
                      Text(
                        item['trans_id'].toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ],
                  ),
                ),
                Card(
                  elevation: 0,
                  color: Colors.green,
                  child: Padding(
                    padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                    child: Text(
                      item['collected'].toString(),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
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
              spreadRadius: 0.001,
              blurRadius: 0.01,
              offset: Offset(0, 01),
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
        // accentColor: Colors.green,
          primaryColor: Colors.blue,
          buttonTheme: ButtonThemeData(
              highlightColor: Colors.green,
              buttonColor: Colors.green,
              colorScheme: Theme.of(context).colorScheme.copyWith(
                  secondary: Colors.redAccent,
                  background: Colors.white,
                  primary: Colors.green,
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
}
