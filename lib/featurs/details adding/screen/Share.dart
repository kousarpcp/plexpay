import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:url_launcher/url_launcher.dart';
// import 'package:plexpay/Helper/resources.dart';
// import 'package:url_launcher/url_launcher.dart';


import '../../../Const/Snackbar_toast_helper.dart';
import 'Resources.dart';

class share extends StatefulWidget {
  const share({key}) : super(key: key);

  @override
  _shareState createState() => _shareState();
}

class _shareState extends State<share> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBlue,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0.1),
        child: AppBar(
          // brightness: Brightness.dark,
          elevation: 0,
          backgroundColor: darkBlue,
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        child: TopCard(),
      ),
    );
  }

  TopCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                "assets/images/share.gif",
                height: MediaQuery.of(context).size.height * 0.25,
              ),
              FittedBox(
                child: Text(
                  "Share this app with your friends and family!",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      fontFamily: 'Poppins'),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        GestureDetector(
                            onTap: () {
                              showToast("Link copied to clipboard");
                              Clipboard.setData(
                                  ClipboardData(text: "http://surl.li/azasn"));
                            },
                            child: Text("http://surl.li/azasn")),
                        Spacer(),
                        GestureDetector(
                          onTap: () {
                            showToast("Link copied to clipboard");
                            Clipboard.setData(
                                ClipboardData(text: "http://surl.li/azasn"));
                          },
                          child: Icon(
                            Icons.link,
                            color: Colors.black45,
                          ),
                        )
                      ],
                    ),
                  ),
                  decoration:
                  BoxDecoration(border: Border.all(color: Colors.black45)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _sms() async {
    // Android
    const uri = 'sms:?body=http://surl.li/azasn';
    if (await canLaunch(uri)) {
      await launch(uri);
    } else {
      // iOS
      const uri = 'sms:?body=http://surl.li/azasn';
      if (await canLaunch(uri)) {
        await launch(uri);
      } else {
        throw 'Could not launch $uri';
      }
    }
  }

  _wtsapp() {
    String url() {
      if (Platform.isAndroid) {
        return "https://wa.me/?text=${Uri.parse("surl.li/azasn")}"; // new line
      } else {
        return "https://api.whatsapp.com/send?phone=${Uri.parse("surl.li/azasn")}"; // new line
      }
    }
  }
}
