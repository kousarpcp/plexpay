import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:plexpay/Const/colorConst.dart';
import 'package:plexpay/Const/imageConst.dart';

import '../../../main.dart';

class countryField extends StatefulWidget {
  final String initialCountryCode;
  const countryField({required this.initialCountryCode});

  @override
  State<countryField> createState() => _countryFieldState();
}

class _countryFieldState extends State<countryField> {
  TextEditingController numberController = TextEditingController();
  final phoneValidation = RegExp(r"[0-9]{10}$");
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
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
      ),
      body: Column(
        children: [
          SizedBox(
            height: width * 0.03,
          ),
          Center(
            child: Container(
              height: width * 0.21,
              width: width * 0.85,
              child: IntlPhoneField(
                initialCountryCode: widget.initialCountryCode,
                controller: numberController,
                // showDropdownIcon: false,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,

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
                  suffixIcon: Icon(
                    Icons.search,
                    color: colorConst.blue,
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
              ),
            ),
          ),
        ],
      ),
    );
  }
}
