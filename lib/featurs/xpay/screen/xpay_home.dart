import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plexpay/Const/colorConst.dart';
import 'package:plexpay/Const/widgets.dart';
import 'package:plexpay/featurs/xpay/screen/xpay_add_bank.dart';
import 'package:plexpay/featurs/xpay/screen/xpay_profile.dart';
import 'package:plexpay/featurs/xpay/screen/xpay_view_bank.dart';

import '../../../main.dart';

class XpayHome extends StatefulWidget {
  const XpayHome({super.key, required this.number});
  final String number;

  @override
  State<XpayHome> createState() => _XpayHomeState();
}

class _XpayHomeState extends State<XpayHome> {
  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(context).size.width > 650?
      Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Padding(
        padding:  EdgeInsets.all(width*0.03),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: height*0.026,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(context, CupertinoPageRoute(builder: (context) => XpayProfile(),));
                      },
                      child: CircleAvatar(
                        backgroundColor: colorConst.blue,
                        radius: width*0.023,
                        child: Center(
                          child: Icon(
                            Icons.person,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Text("Profile",style: TextStyle(
                      fontSize: width*0.022
                    ),)
                  ],
                ),
                SizedBox(
                  width: width*0.04,
                )
              ],
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Hello!",style: TextStyle(
                  fontSize: width*0.052,
                  fontWeight: FontWeight.bold,
                  color: colorConst.blue
                ),),
                SizedBox(
                  height: height*0.04,
                ),
                Container(
                  width: width*0.6,
                  height: height*0.1,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(width*0.018),
                      border: Border.all(
                          color: colorConst.blue,
                      ),
                      color: Colors.white,
                  ),
                  child: Center(
                    child: Text("+971 ${widget.number}",style: TextStyle(
                        color: colorConst.blue,
                        fontSize: 21,

                    ),),
                  ),
                ),
                gap,
                InkWell(
                  onTap: () {
                    Navigator.push(context, CupertinoPageRoute(builder: (context) => AddBank(),));
                  },
                  child: Container(
                    width: width*0.6,
                    height: height*0.1,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(width*0.018),
                      color: colorConst.blue
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.add_circle,color: Colors.white,),
                        SizedBox(
                          width: width*0.03,
                        ),
                        Center(
                          child: Text("Add Bank",style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                          ),),
                        )
                      ],
                    ),
                  ),
                ),
                gap,
                InkWell(
                  onTap: () {
                    Navigator.push(context, CupertinoPageRoute(builder: (context) => ViewBank(),));
                  },
                  child: Container(
                    width: width*0.6,
                    height: height*0.1,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(width*0.018),
                        color: colorConst.grey
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(CupertinoIcons.eye_fill,color: Colors.white,),
                        SizedBox(
                          width: width*0.03,
                        ),
                        Text("View Bank",style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                        ),)
                      ],
                    ),
                  ),
                ),
                gap,
                Container(
                  width: width*0.6,
                  height: height*0.1,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(width*0.018),
                      color: colorConst.grey
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.history,color: Colors.white,),
                      SizedBox(
                        width: width*0.03,
                      ),
                      Text("History",style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                      ),)
                    ],
                  ),
                ),

              ],
            )
          ],
        ),
      ),
    ):
    Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: width*0.2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(context, CupertinoPageRoute(builder: (context) => XpayProfile(),));
                      },
                      child: CircleAvatar(
                        backgroundColor: colorConst.blue,
                        radius: width*0.05,
                        child: Center(
                          child: Icon(
                            Icons.person,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Text("Profile",style: TextStyle(
                        fontSize: width*0.04
                    ),)
                  ],
                ),
                SizedBox(
                  width: width*0.04,
                )
              ],
            ),
            SizedBox(
              height: width*0.2,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Hello!",style: TextStyle(
                    fontSize: width*0.14,
                    fontWeight: FontWeight.bold,
                    color: colorConst.blue
                ),),
                SizedBox(
                  height: width*0.04,
                ),
                Container(
                  width: width*0.6,
                  height: width*0.12,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(width*0.03),
                    border: Border.all(
                      color: colorConst.blue,
                    ),
                    color: Colors.white,
                  ),
                  child: Center(
                    child: Text("+971 ${widget.number}",style: TextStyle(
                      color: colorConst.blue,
                      fontSize: 21,

                    ),),
                  ),
                ),
                gap,
                InkWell(
                  onTap: () {
                    Navigator.push(context, CupertinoPageRoute(builder: (context) => AddBank(),));
                  },
                  child: Container(
                    width: width*0.6,
                    height: width*0.12,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(width*0.03),
                        color: colorConst.blue
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.add_circle,color: Colors.white,),
                        SizedBox(
                          width: width*0.03,
                        ),
                        Center(
                          child: Text("Add Bank",style: TextStyle(
                              color: Colors.white,
                              fontSize: 21,
                              fontWeight: FontWeight.bold
                          ),),
                        )
                      ],
                    ),
                  ),
                ),
                gap,
                InkWell(
                  onTap: () {
                    Navigator.push(context, CupertinoPageRoute(builder: (context) => ViewBank(),));
                  },
                  child: Container(
                    width: width*0.6,
                    height: width*0.12,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(width*0.03),
                        color: colorConst.grey
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(CupertinoIcons.eye_fill,color: Colors.white,),
                        SizedBox(
                          width: width*0.03,
                        ),
                        Text("View Bank",style: TextStyle(
                            color: Colors.white,
                            fontSize: 21,
                            fontWeight: FontWeight.bold
                        ),)
                      ],
                    ),
                  ),
                ),
                gap,
                Container(
                  width: width*0.6,
                  height: width*0.12,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(width*0.03),
                      color: colorConst.grey
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.history,color: Colors.white,),
                      SizedBox(
                        width: width*0.03,
                      ),
                      Text("History",style: TextStyle(
                          color: Colors.white,
                          fontSize: 21,
                          fontWeight: FontWeight.bold
                      ),)
                    ],
                  ),
                ),

              ],
            )
          ],
        ),
      ),
    );
  }
}
