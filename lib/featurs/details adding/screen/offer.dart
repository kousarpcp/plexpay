import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:plexpay/Const/colorConst.dart';
import 'package:plexpay/featurs/details%20adding/screen/page1.dart';
import 'package:plexpay/featurs/details%20adding/screen/popularPlans.dart';
import 'package:plexpay/featurs/details%20adding/screen/topUp.dart';
import '../../../api/country_code_API.dart';
import '../../../api/plans_by_prov_API.dart';
import 'dataPacks.dart';

class offer extends StatefulWidget {

  final String name;
  final String image;
  final String code;
  final String iso;
  final String dash;
  const offer({super.key, required this.name, required this.image, required this.code, required this.dash, required this.iso});

  @override
  State<offer> createState() => _offerState();
}

class _offerState extends State<offer> {
  bool showTabs = false;
  var isCountry = false;
  var isLoading = false;
  var planLIst=[];
  var provinfo;

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

    var rsp = await plansByProviderApi(widget.code.toString(),widget.dash);
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
            child: Column(children: [
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
