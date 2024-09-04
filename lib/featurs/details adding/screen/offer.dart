import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:plexpay/Const/colorConst.dart';
import 'package:plexpay/Const/widgets.dart';
import 'package:plexpay/featurs/details%20adding/screen/page1.dart';
import 'package:plexpay/featurs/details%20adding/screen/popularPlans.dart';
import 'package:plexpay/featurs/details%20adding/screen/topUp.dart';
import 'package:shimmer/shimmer.dart';
import '../../../api/country_code_API.dart';
import '../../../api/plans_by_prov_API.dart';
import 'Reacharge.dart';
import 'dataPacks.dart';

class offer extends StatefulWidget {

  final  name;
  final  image;
  final  code;
  final  iso;
  final  dash;
  final voucher;
  const offer({super.key,  this.name,  this.image,  this.code,  this.dash,  this.iso, this.voucher,});

  @override
  State<offer> createState() => _offerState();
}

class _offerState extends State<offer> {
  bool showTabs = false;
  var isCountry = false;
  var isLoading = false;
  var message;
  var planLIst=[];
  var provinfo;
  var rsp;

  TextEditingController numController = TextEditingController();

  FocusNode _focusNode = FocusNode();

  void toggleTabs() {
    if (numController.text.length==12) {
      setState(() {
        showTabs = !showTabs;
      });
    }
  }

  Future<String> getCountryCode() async {
    print("countryyy");
    setState(() {
      isCountry=false;
    });
    var rsp = await fetchCountryCodeApi(widget.iso);
    print("countryyy");
    print(rsp['country']);
    setState(() {
      numController.text=rsp['country'].toString();

    });

    setState(() {
      isCountry=true;
    });
    return "";
  }

  Future<String> getHome() async {

    setState(() {
      isLoading = true;
    });

    rsp = await plansByProviderApi(widget.code.toString(),widget.dash);
    print("providersssss");
    print(rsp);
    if (rsp['status'] != false) {
      setState(() {
        planLIst = rsp['products']['PlanInfo'];
        provinfo = rsp['products']['ProviderInfo'];
      });
    }


    setState(() {
      isLoading = false;
    });

    return " ";
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.iso!=null){
      numController.clear();
      getCountryCode();
    }
    getCountryCode();
    getHome();
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        setState(() {
          showTabs = numController.text.length==9;
        });
      }
    });
  }

  @override
  void dispose() {
    numController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return DefaultTabController(
      length: 3,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child:widget.voucher.toString()=="1"?isLoading?Column(
              children: [
                gap,
                Container(
                   child:  ListView.separated(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Shimmer.fromColors(
                                baseColor: Colors.grey.shade100,
                                highlightColor: Colors.white,
                                direction: ShimmerDirection.btt,
                                enabled: true,
                                child: Container(
                                  height: width * 0.4,
                                  width: width * 0.84,
                                  decoration: BoxDecoration(
                                      color: colorConst.lightgrey,
                                      borderRadius:
                                      BorderRadius.circular(width * 0.06)),
                                ),
                              ),
                              SizedBox(
                                height: width * 0.04,
                              ),
                            ],
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            width: width * 0.02,
                          );
                        },
                        itemCount: 4)
                ),
              ],
            ):rsp["message"]=="Empty"?Container(
              margin: EdgeInsets.all(width*0.1),
              child: Center(child: Text("No Vouchers Found!")),
            ):Column(
              children: [
                widget.dash=="1"?Row(
                  children: [
                    SizedBox(
                      width: width*0.05,
                    ),
                    Container(
                      margin: EdgeInsets.all(width*0.03),
                      width: width*0.3,
                      height: width*0.3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(width*0.03),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: width * 0.007,)
                        ],
                      ),
                      child: Container(
                        width: width*0.2,
                        height: width*0.25,
                        margin: EdgeInsets.all(width*0.03),
                        decoration: BoxDecoration(
                          image: DecorationImage(image: NetworkImage(provinfo["ProviderLogo"])),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(provinfo["ProviderName"],style: TextStyle(
                          fontSize: width*0.05,
                          fontWeight: FontWeight.bold,
                          color: colorConst.blue
                      ),),
                    )
                  ],
                ):SizedBox(
                  height: width * 0.04,
                ),
                ListView.separated(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => reacharge(
                                        code:planLIst[index]["SkuCode"],
                                        dash:widget.dash,
                                      voucher:widget.voucher
                                    ),
                                  ));
                            },
                            child: Center(
                              child: Container(
                                height: width * 0.4,
                                width: width * 0.84,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black12,
                                        blurRadius: width * 0.007,)
                                    ],
                                    borderRadius:
                                    BorderRadius.circular(width * 0.06)),
                                child: Padding(
                                  padding: EdgeInsets.all(width * 0.03),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: width * 0.01,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      Text(planLIst[index]["ReceiveCurrencyIso"],
                                                          style: TextStyle(
                                                              fontWeight: FontWeight.w900,
                                                              fontSize: width * 0.055)),
                                                      SizedBox(
                                                        width: width * 0.02,
                                                      ),
                                                      Text(
                                                        planLIst[index]["ReceiveValue"].toString(),
                                                        style: TextStyle(
                                                            fontWeight: FontWeight.w900,
                                                            fontSize: width * 0.055),
                                                      ),
                                                    ],
                                                  ),

                                                ],
                                              )


                                            ],
                                          ),
                                          widget.dash=="1"?Row(
                                            children: [
                                              Text(planLIst[index]["SendCurrencyIso"],
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.w900,
                                                      fontSize: width * 0.05)),
                                              SizedBox(
                                                width: width * 0.02,
                                              ),
                                              Text(
                                                planLIst[index]["Our_SendValue"].toString(),
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w900,
                                                    fontSize: width * 0.05),
                                              ),
                                            ],
                                          ):SizedBox()
                                        ],
                                      ),
                                      Divider(
                                        thickness: width * 0.002,
                                        // indent: width * 0.035,
                                        // endIndent: width * 0.035,
                                      ),
                                      SizedBox(
                                        height: width * 0.016,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("Validity",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.grey)),
                                          Text("Local Data",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.grey)),
                                          Text("Roaming Data",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.grey)),
                                        ],
                                      ),
                                      SizedBox(
                                        height: width * 0.01,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(planLIst[index]["Expiry_Date"],
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: width * 0.048)),
                                          Text("N.A",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: width * 0.048)),
                                          Text("N.A",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: width * 0.048)),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: width * 0.04,
                          ),
                        ],
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        width: width * 0.02,
                      );
                    },
                    itemCount: planLIst.length)
              ],
            ):
            Column(children: [
              SizedBox(
                height: width * 0.04,
              ),
              Center(
                child: Container(
                  height: width * 0.12,
                  width: width * 0.8,
                  child: TextFormField(
                    controller: numController,
                    keyboardType: TextInputType.number,
                    autofocus: true,
                    enabled: isCountry,
                    textInputAction: TextInputAction.next,
                    cursorColor: colorConst.blue,
                    cursorHeight: width*0.05,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(12)
                    ],
                    style: TextStyle(
                      fontSize: width * 0.05,
                      fontWeight: FontWeight.w600,
                      color: colorConst.grey
                    ),
                    decoration: InputDecoration(
                      suffixIcon: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(width*0.05),
                            topRight: Radius.circular(width*0.05),
                          ),
                          color: colorConst.blue
                        ),

                        child: IconButton(
                          onPressed: () {
                            toggleTabs();
                          },
                          icon: Icon(Icons.search,color: Colors.white,),
                        ),
                      ),
                      hintText: "Please Enter Your Number",
                      hintStyle: TextStyle(
                        fontSize: width * 0.038,
                        fontWeight: FontWeight.w600,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red,
                        ),
                        borderRadius: BorderRadius.circular(width * 0.05),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                        borderRadius: BorderRadius.circular(width * 0.05),
                      ),
                    ),
                    focusNode: _focusNode,
                  ),
                ),
              ),
              SizedBox(
                height: width * 0.03,
              ),
              if (showTabs)
                isLoading?Container(
                  child: Center(child: CircularProgressIndicator(
                    color: colorConst.blue,
                  )),
                ):Column(
                  children: [
                    Container(
                      height: width * 0.11,
                      color: colorConst.blue,
                      child: TabBar(
                        isScrollable: true,
                        physics: BouncingScrollPhysics(),
                        labelColor: Colors.white,
                        unselectedLabelColor: Colors.black,
                        indicatorColor: Colors.white,
                        dividerColor: Colors.black,
                        labelPadding: EdgeInsets.all(width * 0.027),
                        indicatorWeight: width * 0.005,
                        tabs: [
                          Tab(
                            child: Text(
                              "Popular Plans",
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: width * 0.043,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Tab(
                            child: Text(
                              "Data Packs",
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: width * 0.043,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Tab(
                            child: Text(
                              "Top-up",
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: width * 0.043,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: width,
                      height: height * 0.69,
                      child: TabBarView(
                        children: [
                          popular(
                            number:numController.text,
                              name:widget.name,
                            plan:planLIst,
                            providerinfo:provinfo,
                            dash:widget.dash

                          ),
                          dataPacks(
                              number:numController.text,
                              name:widget.name,


                          ),
                          topUp(
                              number:numController.text,
                              name:widget.name,


                          ),
                        ],
                      ),
                    ),
                  ],
                )
            ]),
          ),
        ),
      ),
    );
  }
}
