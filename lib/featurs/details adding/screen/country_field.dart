import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:lottie/lottie.dart';
import 'package:plexpay/Const/colorConst.dart';
import 'package:plexpay/Const/imageConst.dart';
import 'package:plexpay/featurs/details%20adding/screen/popularPlans.dart';
import 'package:plexpay/featurs/details%20adding/screen/topUp.dart';

import '../../../Const/Snackbar_toast_helper.dart';
import '../../../api/country_code_API.dart';
import '../../../api/planby_number_API.dart';
import '../../../main.dart';
import 'dataPacks.dart';

class countryField extends StatefulWidget {
  final  name;
  final  image;
  final  code;
  final  dash;


  const countryField({

     this.name,
     this.image,
     this.code,
     this.dash,
  });

  @override
  State<countryField> createState() => _countryFieldState();
}

class _countryFieldState extends State<countryField> {
  var isLoading = false;
  bool showTabs = false;
  var planLIst = [];
  var ProviderLogo;
  var ProviderName;
  var providerinfo;
  var selectedCountry ="91";

  TextEditingController numberController = TextEditingController();

  final phoneValidation = RegExp(r"[0-9]{10}$");
  final formKey = GlobalKey<FormState>();

  FocusNode _focusNode = FocusNode();

  void toggleTabs() {
    // bool showTabs = false;
    if (numberController.text.isNotEmpty) {
      setState(() {
        showTabs = !showTabs;
        getHome(selectedCountry+numberController.text.toString(), selectedCountry.toString()=="971"?"0":"1");
      });
    }
  }

  Future<String> getHome(num, type) async {



    setState(() {
      isLoading = true;
    });

    var rsp = await plansByNumberApi(num.toString(), widget.dash);

    print("responsee");
    print(rsp);
    if ( rsp['status'] == true) {
      setState(() {
        planLIst = rsp['plans'];
        // showCustom = rsp['plans'][0]['range'];
        providerinfo=rsp["provider_info"];
        ProviderLogo = rsp['provider_info']['ProviderLogo'].toString();
        ProviderName = rsp['provider_info']['ProviderName'].toString();
      });
    }

    setState(() {
      isLoading = false;
    });

    return " ";
  }
  Future<String> getCountryCode() async {
    var rsp = await fetchCountryCodeApi(widget.code!=null?widget.code:selectedCountry);
    print("countryyy");
    print(rsp['country']);
    setState(() {
      selectedCountry=rsp['country'].toString();

    });
    return "";

  }
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.code!=null){
      setState(() {
        selectedCountry="";
      });
      if(widget.code!=null){this.getCountryCode();}
    }
    setState(() {});

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
          title: widget.name!=null?Text(
            widget.name,
            style:
            TextStyle(fontSize: width * 0.06, fontWeight: FontWeight.w700),
          ):SizedBox(),
          actions: [
            widget.image!=null?CircleAvatar(
              radius: width*0.045,
              backgroundImage:NetworkImage(widget.image,),
              backgroundColor: Colors.white,
            ):SizedBox(),
            SizedBox(width: width*0.05,)],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: width * 0.03,
              ),
              Center(
                child: widget.code!=null?Container(
                  height: width * 0.21,
                  width: width * 0.85,
                  child: IntlPhoneField(
                    initialCountryCode: widget.code,
                    controller: numberController,
                    showDropdownIcon: false,
                    flagsButtonMargin: EdgeInsets.only(left: width*0.03),
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    autovalidateMode: AutovalidateMode.disabled,
                    style: TextStyle(
                        fontSize: width * 0.05, fontWeight: FontWeight.w600),
                    decoration: InputDecoration(
                      // labelText: "Number",
                      // label: Text(""),
                      labelStyle: TextStyle(
                          fontSize: width * 0.045,
                          fontWeight: FontWeight.w300,
                          color: Colors.black),
                      hintText: "Please Enter Your Number",
                      hintStyle: TextStyle(
                        fontSize: width * 0.04,
                        fontWeight: FontWeight.w600,
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          FocusManager.instance.primaryFocus?.unfocus();
                          // alertShow();
                          if (numberController.text.isEmpty) {
                            showToast("Number Empty");
                            Navigator.pop(context);
                            return;
                          }else{

                            toggleTabs();
                          }

                          // var type = numController.text.toString()[0] +numController.text.toString()[1]+numController.text.toString()[2];
                          // print("type");
                          // print(type);
                          setState(() {
                            FocusManager.instance.primaryFocus?.unfocus();

                          });

                        },
                        icon: Icon(
                            Icons.search,
                            color: colorConst.blue,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: colorConst.blue,
                        ),
                        borderRadius: BorderRadius.circular(width * 0.03),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: colorConst.blue,
                        ),
                        borderRadius: BorderRadius.circular(width * 0.03),
                      ),
                    ),
                    focusNode: _focusNode,
                  ),
                ):Container(
                  height: width * 0.18,
                  width: width * 0.85,
                  child: TextFormField(
                    controller: numberController,
                    // showDropdownIcon: false,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    autovalidateMode: AutovalidateMode.disabled,
                    maxLength: 10,
                    style: TextStyle(
                        fontSize: width * 0.05, fontWeight: FontWeight.w600),
                    decoration: InputDecoration(
                      // labelText: "Number",
                      // label: Text(""),
                      labelStyle: TextStyle(
                          fontSize: width * 0.045,
                          fontWeight: FontWeight.w300,
                          color: Colors.black),
                      hintText: "Please Enter Your Number",
                      hintStyle: TextStyle(
                        fontSize: width * 0.04,
                        fontWeight: FontWeight.w600,
                      ),
                      prefix: InkWell(
                        onTap: () {
                          showCountryPicker(
                            context: context,
                            showPhoneCode: true, // optional. Shows phone code before the country name.
                            onSelect: (Country country) {
                              setState(() {

                                selectedCountry =country.phoneCode.toString();

                              });
                              print('Select country: ${country.flagEmoji}');
                            },
                          );
                        },
                        child: Container(

                          width: width*0.1,
                          child: Center(child: Text("+"+selectedCountry,style: TextStyle(fontSize: 18,color: colorConst.blue),)),

                        ),
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          FocusManager.instance.primaryFocus?.unfocus();
                          // alertShow();
                          if (numberController.text.isEmpty) {
                            showToast("Number Empty");
                            Navigator.pop(context);
                            return;
                          }else{

                            toggleTabs();
                          }

                          // var type = numController.text.toString()[0] +numController.text.toString()[1]+numController.text.toString()[2];
                          // print("type");
                          // print(type);
                          setState(() {
                            FocusManager.instance.primaryFocus?.unfocus();

                          });

                        },
                        icon: Icon(
                          Icons.search,
                          color: colorConst.blue,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: colorConst.blue,
                        ),
                        borderRadius: BorderRadius.circular(width * 0.03),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: colorConst.blue,
                        ),
                        borderRadius: BorderRadius.circular(width * 0.03),
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
                planLIst.isEmpty&&isLoading==false?Container(child: Text("No result found!"),):
                isLoading==true ?Container(
                  margin: EdgeInsets.only(
                      bottom: width*0.05,
                      left: width*0.05,
                      right: width*0.05
                  ),
                  child: Center(child: Lottie.asset(ImageConst.loading1))
                  ,
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
                            number:selectedCountry+numberController.text.toString(),
                            name:providerinfo["ProviderName"], dash: widget.dash, plan: planLIst, providerinfo: providerinfo,

                          ),
                          dataPacks(
                            number:numberController.text,
                            name:providerinfo["ProviderName"],


                          ),
                          topUp(
                            number:numberController.text,
                            name:providerinfo["ProviderName"],


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
