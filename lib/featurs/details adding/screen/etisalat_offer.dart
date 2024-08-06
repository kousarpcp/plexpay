import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:plexpay/featurs/details%20adding/Const/colorConst.dart';
import 'package:plexpay/featurs/details%20adding/screen/page1.dart';
import 'package:plexpay/featurs/details%20adding/screen/popularPlans.dart';
import 'dataPacks.dart';

class offer extends StatefulWidget {
  const offer({super.key});

  @override
  State<offer> createState() => _offerState();
}

class _offerState extends State<offer> {
  bool showTabs = false;
  TextEditingController numController = TextEditingController();

  FocusNode _focusNode = FocusNode();

  void toggleTabs() {
    if (numController.text.isNotEmpty) {
      setState(() {
        showTabs = !showTabs;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        setState(() {
          showTabs = numController.text.isNotEmpty;
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
                  child: Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: width * 0.66),
                        child: GestureDetector(
                          onTap: toggleTabs,
                          child: Container(
                            height: width * 0.12,
                            width: width * 0.14,
                            child: Icon(
                              Icons.search,
                              color: Colors.white,
                            ),
                            decoration: BoxDecoration(
                              color: colorConst.blue,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(width * 0.05),
                                bottomRight: Radius.circular(width * 0.05),
                              ),
                            ),
                          ),
                        ),
                      ),
                      TextFormField(
                        controller: numController,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(9)
                        ],
                        style: TextStyle(
                          fontSize: width * 0.053,
                          fontWeight: FontWeight.w600,
                        ),
                        decoration: InputDecoration(
                          prefixText: "+ 971 ",
                          prefixStyle: TextStyle(
                            fontSize: width * 0.05,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
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
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: width * 0.03,
              ),
              if (showTabs)
                Column(
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
                          popular(),
                          dataPacks(),
                          page1(),
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
