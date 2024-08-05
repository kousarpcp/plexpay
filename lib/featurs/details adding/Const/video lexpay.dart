import 'package:flutter/material.dart';

import '../../../main.dart';
import '../screen/imageConst.dart';

class video extends StatefulWidget {
  const video({super.key});

  @override
  State<video> createState() => _videoState();
}

class _videoState extends State<video> {
  @override
  Widget build(BuildContext context) {
    List a = [
      {"image1": ImageConst.uae},
      {"image1": ImageConst.oman},
      {"image1": ImageConst.bahrain},
      {"image1": ImageConst.india},
      {"image1": ImageConst.kuwait},
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage(ImageConst.plexpay),
              width: width * 0.23,
            ),
          ],
        ),
        actions: [
          Row(
            children: [
              CircleAvatar(
                radius: width * 0.035,
                backgroundColor: Colors.white,
                child: Image.asset(
                  ImageConst.bellicon,
                  width: width * 0.055,
                ),
              ),
              SizedBox(
                width: width * 0.01,
              ),
              CircleAvatar(
                radius: width * 0.035,
                backgroundColor: Colors.white,
                child: Image.asset(
                  ImageConst.contact,
                  width: width * 0.055,
                ),
              ),
            ],
          ),
          SizedBox(
            width: width * 0.03,
          )
        ],
      ),
      body: Column(
        children: [
          Center(
            child: Container(
              height: width * 0.26,
              width: width * 0.93,
              decoration: BoxDecoration(
                  color: Colors.indigoAccent,
                borderRadius: BorderRadius.circular(width*0.03)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [

                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                     SizedBox(
                       height: width*0.04,
                     ),
                      Text(
                        "Free Vouchers",style: TextStyle(fontSize: width*0.075,color: Colors.white,fontWeight: FontWeight.w700),
                      ),
                      Text("Tap here to claim youfree discount vouchers",style: TextStyle(fontSize: width*0.03,color: Colors.white),)
                    ],
                  ),
                  Row(
                    children: [
                      Text("0",style: TextStyle(fontSize: width*0.19,fontWeight: FontWeight.w500,color: Colors.white),),
                     Text("%",style: TextStyle(fontWeight: FontWeight.w500,fontSize: width*0.15,color: Colors.lightBlueAccent),),
                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: width*0.04,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: width * 0.2,
                width: width * 0.84,
                child: ListView.separated(
                  shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                  return Column(
                    children: [
                      CircleAvatar(
                        radius: width*0.072,
                        backgroundColor: Colors.grey,
                        backgroundImage: AssetImage(a[index]["image1"]),
                      )
                    ],
                  );
                }, separatorBuilder: (context, index) {
                      return SizedBox(width: width*0.03,);
                },
                    itemCount: 5
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
