import 'package:flutter/material.dart';

import '../../../Const/colorConst.dart';
import '../../../Const/widgets.dart';
import '../../../main.dart';

class ViewBank extends StatefulWidget {
  const ViewBank({super.key});

  @override
  State<ViewBank> createState() => _ViewBankState();
}

class _ViewBankState extends State<ViewBank> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: Column(
          children: [
            SizedBox(
              height: width*0.26,
            ),
            Text("VIEW BANK",style: TextStyle(
                color: colorConst.blue,
                fontWeight: FontWeight.bold,
                fontSize: width*0.08
            ),),
            SizedBox(height:width*0.05,),
            Stack(
              children: [
                Container(
                  height: width*0.1,
                  width: width*0.85,
                  margin: EdgeInsets.all(width*0.02),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(width*0.03),
                      border: Border.all(
                          width: width*0.004,
                          color: colorConst.blue
                      )
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("  BANK 1",style: TextStyle(
                        fontSize: width*0.045
                      ),),
                      Row(
                        children: [
                          Icon(Icons.remove_red_eye,size: width*0.045,color: colorConst.grey,),
                          Text(" VIEW DETAILS",style: TextStyle(
                            fontSize: width*0.035
                          ),)
                        ],
                      ),
                      SizedBox(
                        width: width*0.1,
                      )
                    ],
                  ),
                ),
                Positioned(
                  right: 0,
                  child: Container(
                    height: width*0.1,
                    width: width*0.25,
                    margin: EdgeInsets.all(width*0.02),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(width*0.03),
                        color: Colors.lightBlueAccent
                    ),
                    child: Center(
                      child: Text("Select",style: TextStyle(
                        color: Colors.white,
                        fontSize: width*0.05
                      ),),
                    ),
                  ),
                )
              ]

            ),
            SizedBox(height:width*0.04,),
            Stack(
              children: [
                Container(
                  height: width*0.1,
                  width: width*0.85,
                  margin: EdgeInsets.all(width*0.02),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(width*0.03),
                      border: Border.all(
                          width: width*0.004,
                          color: colorConst.blue
                      )
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("  BANK 2",style: TextStyle(
                        fontSize: width*0.045
                      ),),
                      Row(
                        children: [
                          Icon(Icons.remove_red_eye,size: width*0.045,color: colorConst.grey,),
                          Text(" VIEW DETAILS",style: TextStyle(
                            fontSize: width*0.035
                          ),)
                        ],
                      ),
                      SizedBox(
                        width: width*0.1,
                      )
                    ],
                  ),
                ),
                Positioned(
                  right: 0,
                  child: Container(
                    height: width*0.1,
                    width: width*0.25,
                    margin: EdgeInsets.all(width*0.02),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(width*0.03),
                        color: Colors.lightBlueAccent
                    ),
                    child: Center(
                      child: Text("Select",style: TextStyle(
                        color: Colors.white,
                        fontSize: width*0.05
                      ),),
                    ),
                  ),
                )
              ]

            ),
            SizedBox(height:width*0.04,),
            Stack(
              children: [
                Container(
                  height: width*0.1,
                  width: width*0.85,
                  margin: EdgeInsets.all(width*0.02),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(width*0.03),
                      border: Border.all(
                          width: width*0.004,
                          color: colorConst.blue
                      )
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("  BANK 3",style: TextStyle(
                        fontSize: width*0.045
                      ),),
                      Row(
                        children: [
                          Icon(Icons.remove_red_eye,size: width*0.045,color: colorConst.grey,),
                          Text(" VIEW DETAILS",style: TextStyle(
                            fontSize: width*0.035
                          ),)
                        ],
                      ),
                      SizedBox(
                        width: width*0.1,
                      )
                    ],
                  ),
                ),
                Positioned(
                  right: 0,
                  child: Container(
                    height: width*0.1,
                    width: width*0.25,
                    margin: EdgeInsets.all(width*0.02),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(width*0.03),
                        color: Colors.lightBlueAccent
                    ),
                    child: Center(
                      child: Text("Select",style: TextStyle(
                        color: Colors.white,
                        fontSize: width*0.05
                      ),),
                    ),
                  ),
                )
              ]

            ),
            SizedBox(height:width*0.04,),
            Stack(
              children: [
                Container(
                  height: width*0.1,
                  width: width*0.85,
                  margin: EdgeInsets.all(width*0.02),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(width*0.03),
                      border: Border.all(
                          width: width*0.004,
                          color: colorConst.blue
                      )
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("  BANK 4",style: TextStyle(
                        fontSize: width*0.045
                      ),),
                      Row(
                        children: [
                          Icon(Icons.remove_red_eye,size: width*0.045,color: colorConst.grey,),
                          Text(" VIEW DETAILS",style: TextStyle(
                            fontSize: width*0.035
                          ),)
                        ],
                      ),
                      SizedBox(
                        width: width*0.1,
                      )
                    ],
                  ),
                ),
                Positioned(
                  right: 0,
                  child: Container(
                    height: width*0.1,
                    width: width*0.25,
                    margin: EdgeInsets.all(width*0.02),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(width*0.03),
                        color: Colors.lightBlueAccent
                    ),
                    child: Center(
                      child: Text("Select",style: TextStyle(
                        color: Colors.white,
                        fontSize: width*0.05
                      ),),
                    ),
                  ),
                )
              ]

            ),
            SizedBox(height:width*0.04,),
            Stack(
              children: [
                Container(
                  height: width*0.1,
                  width: width*0.85,
                  margin: EdgeInsets.all(width*0.02),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(width*0.03),
                      border: Border.all(
                          width: width*0.004,
                          color: colorConst.blue
                      )
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("  BANK 5",style: TextStyle(
                        fontSize: width*0.045
                      ),),
                      Row(
                        children: [
                          Icon(Icons.remove_red_eye,size: width*0.045,color: colorConst.grey,),
                          Text(" VIEW DETAILS",style: TextStyle(
                            fontSize: width*0.035
                          ),)
                        ],
                      ),
                      SizedBox(
                        width: width*0.1,
                      )
                    ],
                  ),
                ),
                Positioned(
                  right: 0,
                  child: Container(
                    height: width*0.1,
                    width: width*0.25,
                    margin: EdgeInsets.all(width*0.02),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(width*0.03),
                        color: Colors.lightBlueAccent
                    ),
                    child: Center(
                      child: Text("Select",style: TextStyle(
                        color: Colors.white,
                        fontSize: width*0.05
                      ),),
                    ),
                  ),
                )
              ]

            ),
            SizedBox(height:width*0.04,),
            Stack(
              children: [
                Container(
                  height: width*0.1,
                  width: width*0.85,
                  margin: EdgeInsets.all(width*0.02),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(width*0.03),
                      border: Border.all(
                          width: width*0.004,
                          color: colorConst.blue
                      )
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("  BANK 6",style: TextStyle(
                        fontSize: width*0.045
                      ),),
                      Row(
                        children: [
                          Icon(Icons.remove_red_eye,size: width*0.045,color: colorConst.grey,),
                          Text(" VIEW DETAILS",style: TextStyle(
                            fontSize: width*0.035
                          ),)
                        ],
                      ),
                      SizedBox(
                        width: width*0.1,
                      )
                    ],
                  ),
                ),
                Positioned(
                  right: 0,
                  child: Container(
                    height: width*0.1,
                    width: width*0.25,
                    margin: EdgeInsets.all(width*0.02),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(width*0.03),
                        color: Colors.lightBlueAccent
                    ),
                    child: Center(
                      child: Text("Select",style: TextStyle(
                        color: Colors.white,
                        fontSize: width*0.05
                      ),),
                    ),
                  ),
                )
              ]

            ),
          ],
        ),
      ),
    );
  }
}
