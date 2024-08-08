import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:plexpay/featurs/details%20adding/Const/widgets.dart';
import 'package:screenshot/screenshot.dart';
// import 'package:plexpay/Api/transactionSaleApi.dart';
// import 'package:plexpay/Api/transactionSearchApi.dart';
import '../../../main.dart';
import '../Const/colorConst.dart';
import 'Constants.dart';
// import 'package:plexpay/Helper/resources.dart';
// import 'package:plexpay/Screens/PrintPage.dart';



import 'Resources.dart';
import 'imageConst.dart';

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


  TextEditingController searchController = new TextEditingController();
  FocusNode numFocus = FocusNode();
  List<dynamic> history = [
    {
      "service":ImageConst.etisalat, "text": "Etisalat UAE",
      "transaction id":"PLXPESY393334513",
      "date":"2024-01-23 07:42:07",
      "cash":10.00,
      "recieved":10.00,
    },
    {
      "service":ImageConst.du, "text": "DU UAE",
      "transaction id":"PLXPESY393081643",
      "date":"2024-01-25 07:42:07",
      "cash":50.00,
      "recieved":50.00,
    },
    {
      "service":ImageConst.lebanese, "text": "Lebanese",
      "transaction id":"PLXPESY393027353",
      "date":"2024-04-25 02:42:84",
      "cash":25.00,
      "recieved":25.00,
    },
    {
      "service":ImageConst.adnoc, "text": "Adnoc",
      "transaction id":"PLXPESY743827353",
      "date":"2024-04-25 02:42:84",
      "cash":35.00,
      "recieved":35.00,
    },
    {
      "service":ImageConst.kuwaitfinance, "text": " Finance",
      "transaction id":"PLXPESY743827353",
      "date":"2024-04-25 02:42:84",
      "cash":40.00,
      "recieved":40.00,
    },
    {
      "service":ImageConst.knpc, "text": "KNPC",
      "transaction id":"PLXPESY743827353",
      "date":"2024-04-25 02:42:84",
      "cash":40.00,
      "recieved":40.00,
    },
    {
      "service":ImageConst.mosaik, "text": "Mosaik",
      "transaction id":"PLXPESY743827353",
      "date":"2024-04-25 02:42:84",
      "cash":40.00,
      "recieved":40.00,
    },
  ];

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


      print(pickedRange.start.day);
      print(pickedRange.start.month);
      print(pickedRange.start.year);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        backgroundColor: darkBlue,
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
              cursorColor: Colors.indigo,
              onChanged: (key) async {
              },
              onSubmitted: (key) async {

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
      body:
          Column(
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
                            selectDateRange(context);
                          },
                          child: Container(
                            height: width * 0.075,
                            width: width * 0.23,
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(width * 0.35)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Center(
                                    child: Text(
                                      "FILTER",
                                      style: TextStyle(
                                          fontSize: width * 0.046,
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
              Expanded(
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: BouncingScrollPhysics(),
                  itemCount: history.length,
                  itemBuilder: (context, index) {
                    return HistoryData(history: history, index: index);
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox();
                  },
                ),
              ),
            ],
          ),
    );
  }




}

class HistoryData extends StatefulWidget {
  const HistoryData({super.key,required this.history, required this.index,});
  final List history;
  final int index;
  @override
  State<HistoryData> createState() => _HistoryDataState();
}

class _HistoryDataState extends State<HistoryData> {

  @override
  Widget build(BuildContext context) {
    return Container(
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
                    image: DecorationImage(image: AssetImage(widget.history[widget.index]["service"]))
                ),
              ),
              Text(
                widget.history[widget.index]["text"],
                style: TextStyle(
                  fontSize: width*0.025
                ),
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                  widget.history[widget.index]["transaction id"],
                style: TextStyle(
                  fontSize: width*0.04,
                  fontWeight: FontWeight.bold
                ),
              ),
              Text(
                widget.history[widget.index]["date"],
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
                widget.history[widget.index]["cash"].toString(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                widget.history[widget.index]["recieved"].toString(),
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
    );
  }
}

