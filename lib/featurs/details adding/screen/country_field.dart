import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:plexpay/Const/colorConst.dart';
import 'package:plexpay/Const/imageConst.dart';
import 'package:plexpay/featurs/details%20adding/screen/popularPlans.dart';
import 'package:plexpay/featurs/details%20adding/screen/topUp.dart';

import '../../../main.dart';
import 'dataPacks.dart';

class countryField extends StatefulWidget {
  final String name;
  final String image;
  final String code;

  final String initialCountryCode;
  const countryField({
    required this.initialCountryCode,
    required this.name,
    required this.image,
    required this.code,
  });

  @override
  State<countryField> createState() => _countryFieldState();
}

class _countryFieldState extends State<countryField> {
  bool showTabs = false;
  TextEditingController numberController = TextEditingController();
  // final phoneValidation = RegExp(r"[0-9]{10}$");
  // final formKey = GlobalKey<FormState>();

  FocusNode _focusNode = FocusNode();
  void toggleTabs() {
    if (numberController.text.isNotEmpty) {
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
          showTabs = numberController.text.isNotEmpty;
        });
      }
    });
  }
  @override
  void dispose() {
    numberController.dispose();
    _focusNode.dispose();
    super.dispose();
  }
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: GestureDetector(
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
            widget.name,
            style:
            TextStyle(fontSize: width * 0.06, fontWeight: FontWeight.w700),
          ),
          actions: [
            CircleAvatar(
              radius: width*0.045,
              backgroundImage:AssetImage(widget.image,),
              backgroundColor: Colors.white,
            ),
            SizedBox(width: width*0.05,)],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: width * 0.03,
              ),
              Center(
                child: Container(
                  height: width * 0.12,
                  width: width * 0.8,
                  child: TextFormField(
                    controller: numberController,
                    keyboardType: TextInputType.number,
                    autofocus: true,
                    textInputAction: TextInputAction.next,
                    cursorColor: colorConst.blue,
                    cursorHeight: width*0.05,
                    // inputFormatters: [
                    //   FilteringTextInputFormatter.digitsOnly,
                    //   LengthLimitingTextInputFormatter(9)
                    // ],
                    style: TextStyle(
                        fontSize: width * 0.05,
                        fontWeight: FontWeight.w600,
                        color: colorConst.grey
                    ),
                    decoration: InputDecoration(
                      prefixText: widget.code ,
                      prefixStyle: TextStyle(
                        fontSize: width * 0.05,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),

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
              // Center(
              //   child: Container(
              //     height: width * 0.21,
              //     width: width * 0.85,
              //     child: IntlPhoneField(
              //       initialCountryCode: widget.initialCountryCode,
              //       controller: numberController,
              //       // showDropdownIcon: false,
              //       keyboardType: TextInputType.number,
              //       textInputAction: TextInputAction.next,
              //       autovalidateMode: AutovalidateMode.disabled,
              //
              //       style: TextStyle(
              //           fontSize: width * 0.05, fontWeight: FontWeight.w600),
              //       decoration: InputDecoration(
              //         // labelText: "Number",
              //         // label: Text(""),
              //         labelStyle: TextStyle(
              //             fontSize: width * 0.045,
              //             fontWeight: FontWeight.w300,
              //             color: Colors.black),
              //         hintText: "Please Enter Your Number",
              //         hintStyle: TextStyle(
              //           fontSize: width * 0.04,
              //           fontWeight: FontWeight.w600,
              //         ),
              //         suffixIcon: IconButton(
              //           onPressed: () {
              //             toggleTabs();
              //           },
              //           icon: Icon(
              //               Icons.search,
              //               color: colorConst.blue,
              //           ),
              //         ),
              //         border: OutlineInputBorder(
              //           borderSide: BorderSide(
              //             color: colorConst.blue,
              //           ),
              //           borderRadius: BorderRadius.circular(width * 0.03),
              //         ),
              //         focusedBorder: OutlineInputBorder(
              //           borderSide: BorderSide(
              //             color: colorConst.blue,
              //           ),
              //           borderRadius: BorderRadius.circular(width * 0.03),
              //         ),
              //       ),
              //       focusNode: _focusNode,
              //     ),
              //   ),
              // ),
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
                          popular(
                            number:numberController.text,
                            name:widget.name,

                          ),
                          dataPacks(
                            number:numberController.text,
                            name:widget.name,


                          ),
                          topUp(
                            number:numberController.text,
                            name:widget.name,


                          ),
                        ],
                      ),
                    ),
                  ],
                )
            ],
          ),
        ),
      ),
    );
  }
}
