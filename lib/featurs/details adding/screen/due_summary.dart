import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//
// import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
// import 'package:plexpay/Api/dueApi.dart';
// import 'package:plexpay/Api/fundsApi.dart';
// import 'package:plexpay/Api/transactionSaleApi.dart';
// import 'package:plexpay/Const/Constants.dart';
// import 'package:plexpay/Helper/resources.dart';

// import '../Api/DueApi.dart';
// import '../Const/Constants.dart';
import '../Api/DueApi.dart';
import 'Resources.dart';



class dueSummary extends StatefulWidget {
  @override
  _TransState createState() => _TransState();
}

class _TransState extends State<dueSummary> {


  var purchaseDate ="0";



  var start =DateTime.now().year.toString()+"-"+DateTime.now().month.toString()+"-"+DateTime.now().day.toString();
  var end =DateTime.now().year.toString()+"-"+DateTime.now().month.toString()+"-"+DateTime.now().day.toString();


  var arrProdList = [];

  var  isLoading = true;
  var  totalSale = "";
  var  totalProfit = "";


  //List<dynamic> data = [];
  @override
  void initState() {

    super.initState();

    print("xoxoxo");
    this.getHome();


    setState(() {});


  }

  Future<String> getHome() async {

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
        firstDate: DateTime(DateTime
            .now()
            .year + -5),
        lastDate: DateTime(DateTime
            .now()
            .year + 2),

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
        start =pickedRange.start.year.toString()+"-"+pickedRange.start.month.toString()+"-"+pickedRange.start.day.toString();
        end =pickedRange.end.year.toString()+"-"+pickedRange.end.month.toString()+"-"+pickedRange.end.day.toString();
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
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_outlined,
              color: Colors.white,
            )),
        title: Row(
          children: [
            // Container(
            //   decoration: BoxDecoration(
            //       shape: BoxShape.circle,
            //       border: Border.all(color: Colors.black45)),
            //   child: Padding(
            //       padding: const EdgeInsets.all(5.0),
            //       child: Icon(
            //         FontAwesomeIcons.handHoldingUsd,
            //         color: Colors.grey[400],
            //         size: 15,
            //       )),
            // ),
            SizedBox(
              width: 5,
            ),
            Text(
              "Due Summary",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 23),
            )
          ],
        ),
      ),
      body:isLoading==true?Container(
          child: Center(child: CircularProgressIndicator())): SingleChildScrollView(
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
                separatorBuilder: (context, index) => SizedBox(
                  height: 10,
                ),
                shrinkWrap: true,
                itemCount: arrProdList != null ? arrProdList.length: 0,
                itemBuilder: (context, index) {
                  final item = arrProdList != null ? arrProdList[index] : null;

                  return Details(index,item);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget FilterSection() {
    return   Padding(
      padding: const EdgeInsets.only(top:5.0),
      child: Container(
        color: Colors.white,
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
              SizedBox(width: 10,),
              Expanded(
                flex: 1,
                child: Text(
                  start +" to "+end,
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
          shadowColor: Colors.green,
          primaryColor: Colors.blue,
          buttonTheme: ButtonThemeData(
              highlightColor: Colors.green,
              buttonColor: Colors.green,
              colorScheme: Theme.of(context).colorScheme.copyWith(
                  secondary: Colors.redAccent,
                  background: Colors.white,
                  primary: Colors.green,
                  onPrimary: Colors.green,
                  brightness: Brightness.dark,
                  onBackground: Colors.green),
              textTheme: ButtonTextTheme.accent)),
      child: Builder(
        builder: (context) => SizedBox(
          height: 30,
          child: ElevatedButton(
            onPressed: ()async {

              selectDateRange(context);
            },
            child: Text(
              "FILTER",
              style: TextStyle(
                  color: Colors.black, fontWeight: FontWeight.w700, fontSize: 14),
            ),
            // color:themeColor,
          ),
        ),
      ),
    );
  }

  Widget totalSales(){
    return    Padding(
      padding: const EdgeInsets.only(top:8.0),
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

  Details(int index,var item) {
    return GestureDetector(
      onTap: () {
        // pushNewScreen(
        //   context,
        //   screen: Print(id: item['sale_id'].toString(),),
        //   withNavBar: false, // OPTIONAL VALUE. True by default.
        //   pageTransitionAnimation: PageTransitionAnimation.cupertino,
        // );
      },
      child:Padding(
        padding: const EdgeInsets.only(top:5.0),
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child:Column(
              children: [
                // Row(
                //   children: [
                //     Expanded(
                //       child: Text(
                //         "ID :",
                //         style: Theme.of(context).textTheme.subtitle2,
                //       ),
                //     ),
                //     Expanded(
                //       child: Text(
                //         item['id'].toString(),
                //         style: Theme.of(context).textTheme.subtitle2,
                //       ),
                //     )
                //   ],
                // ),
                // Row(
                //   children: [
                //     Expanded(
                //       child: Text(
                //         "ENTRY DATE",
                //         style: Theme.of(context).textTheme.subtitle2,
                //       ),
                //     ),
                //     Expanded(
                //       child: Text(
                //         item['entry_date'].toString(),
                //         style: Theme.of(context).textTheme.subtitle2,
                //       ),
                //     )
                //   ],
                // ),
                // Row(
                //   children: [
                //     Expanded(
                //       child: Text(
                //         "USER ID :",
                //         style: Theme.of(context).textTheme.subtitle2,
                //       ),
                //     ),
                //     Expanded(
                //       child: Text(
                //         item['user_id'].toString(),
                //         style: Theme.of(context).textTheme.subtitle2,
                //       ),
                //     )
                //   ],
                // ),

                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "OPEN BALANCE :",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        item['open_bal'].toString(),
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "ENTRY :",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        item['entry_date'].toString(),
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "COLLECTED :",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        item['collected'].toString(),
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "CLOSED BALANCE :",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        item['close_bal'].toString(),
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "FULL NAME :",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        item['fullname'].toString(),
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    )
                  ],
                ),
              ],
            ),
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
              clipBehavior: Clip.none, alignment: Alignment.topCenter,
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
                                onPressed: ()async {





                                },
                                // color:themeColor,
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

}
