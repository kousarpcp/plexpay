import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../Const/colorConst.dart';
import '../../../Const/imageConst.dart';
import '../../../main.dart';

class billItems extends StatefulWidget {
  final String category;
  const billItems({super.key, required this.category});

  @override
  State<billItems> createState() => _billItemsState();
}
List items= [];

class _billItemsState extends State<billItems> {
  // List product = [
  //   {"image1": ImageConst.cucumber, "text": "Cucumber","quantity":0,"Price":"1.3","tax":5},
  //   {"image1": ImageConst.onion, "text": "Onion","quantity":0,"Price":"1.6","tax":15},
  //   {"image1": ImageConst.tomato, "text": "Tomato","quantity":0,"Price":"0.5","tax":2},
  //   {"image1": ImageConst.potato, "text": "Potato","quantity":0,"Price":"1.4","tax":3},
  //   {"image1": ImageConst.apple, "text": " Apple","quantity":0,"Price":"4.0","tax":5},
  //   {"image1": ImageConst.strawberry, "text": "Strawberry ","quantity":0,"Price":"5.0","tax":15},
  //   {"image1": ImageConst.mango, "text": "Mango ","quantity":0,"Price":"3.2","tax":15},
  //   {"image1": ImageConst.dragon, "text": "Dragon Fruit ","quantity":0,"Price":"7.0","tax":15},
  //   {"image1": ImageConst.rice, "text": "Rice ","quantity":0,"Price":"0.7","tax":15},
  //   {"image1": ImageConst.egg, "text": "Dragon Fruit ","quantity":0,"Price":"0.3","tax":15},
  //
  // ];
  List fruits=[

      {"image1": ImageConst.apple, "text": " Apple","quantity":0,"Price":100,"tax":5},
      {"image1": ImageConst.strawberry, "text": "Strawberry ","quantity":0,"Price":200,"tax":15},
      {"image1": ImageConst.mango, "text": "Mango ","quantity":0,"Price":70,"tax":15},
      {"image1": ImageConst.dragon, "text": "Dragon Fruit ","quantity":0,"Price":250,"tax":15},
  ];
  List vegitalbles=[

      {"image1": ImageConst.cucumber, "text": "Cucumber","quantity":0,"Price":30,"tax":5},
      {"image1": ImageConst.onion, "text": "Onion","quantity":0,"Price":45,"tax":15},
      {"image1": ImageConst.tomato, "text": "Tomato","quantity":0,"Price":20,"tax":2},
      {"image1": ImageConst.potato, "text": "Potato","quantity":0,"Price":35,"tax":3},

  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          if(widget.category=="Vegitables")
          GridView.builder(
            itemCount: vegitalbles.length,
            gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 0.62,
                crossAxisSpacing: width*0.01,
                mainAxisSpacing: width*0.01,
                crossAxisCount: 4),
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Container(
                    height: width*0.35,
                    width: width*0.26,
                    decoration: BoxDecoration(
                        color: colorConst.blue,
                        borderRadius: BorderRadius.circular(width*0.02)
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: width*0.02,
                        ),
                        Container(
                          height: width*0.12,
                          width: width*0.18,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              image: DecorationImage(image: AssetImage(vegitalbles[index]["image1"]),fit: BoxFit.cover,),
                              borderRadius: BorderRadius.circular(width*0.012)
                          ),
                        ),
                        Text(vegitalbles[index]["text"],style: TextStyle(fontSize: 15,color: Colors.white),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("AED",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18,color: Colors.white),),
                            SizedBox(
                              width: width*0.01,
                            ),
                            Text(vegitalbles[index]["Price"].toString(),style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18,color: Colors.white)),
                          ],
                        ),

                    vegitalbles[index]["quantity"] != 0
                    ? Container(
                  height: width * 0.08,
                  width: width * 0.182,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(width * 0.012),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            vegitalbles[index]["quantity"]--;
                          });
                        },
                        child: const Icon(
                          Icons.remove,
                          color: Colors.black,
                          size: 20,
                        ),
                      ),
                      Text(
                        vegitalbles[index]["quantity"].toString(),
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            vegitalbles[index]["quantity"]++;
                          });
                        },
                        child: Icon(
                          Icons.add,
                          color: Colors.black,
                          size: width * 0.05,
                        ),
                      ),
                    ],
                  ),
                )
                    : InkWell(
                  onTap: () {
                    setState(() {
                      vegitalbles[index]["quantity"]++;
                      items.add(vegitalbles[index]);
                    });
                  },
                  child: Container(
                    height: width * 0.08,
                    width: width * 0.182,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(width * 0.012),
                    ),
                    child: Center(
                      child: Text(
                        "Add item",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                )
                ],
                    ),
                  )
                ],
              );
            },
          ),
          if(widget.category=="Fruits")
            GridView.builder(
              itemCount: fruits.length,
              gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 0.62,
                  crossAxisSpacing: width*0.01,
                  mainAxisSpacing: width*0.01,
                  crossAxisCount: 4),
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                      height: width*0.35,
                      width: width*0.26,
                      decoration: BoxDecoration(
                          color: colorConst.blue,
                          borderRadius: BorderRadius.circular(width*0.02)
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: width*0.02,
                          ),
                          Container(
                            height: width*0.12,
                            width: width*0.18,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                image: DecorationImage(image: AssetImage(fruits[index]["image1"]),fit: BoxFit.cover,),
                                borderRadius: BorderRadius.circular(width*0.012)
                            ),
                          ),
                          Text(fruits[index]["text"],style: TextStyle(fontSize: 15,color: Colors.white),),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("AED",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18,color: Colors.white),),
                              SizedBox(
                                width: width*0.01,
                              ),
                              Text(fruits[index]["Price"].toString(),style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18,color: Colors.white)),
                            ],
                          ),
                          fruits[index]["quantity"] != 0
                              ? Container(
                            height: width * 0.08,
                            width: width * 0.182,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(width * 0.012),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      fruits[index]["quantity"]--;
                                    });
                                  },
                                  child: const Icon(
                                    Icons.remove,
                                    color: Colors.black,
                                    size: 20,
                                  ),
                                ),
                                Text(
                                  fruits[index]["quantity"].toString(),
                                  style: TextStyle(color: Colors.black, fontSize: 18),
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      fruits[index]["quantity"]++;
                                    });
                                  },
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.black,
                                    size: width * 0.05,
                                  ),
                                ),
                              ],
                            ),
                          )
                              : InkWell(
                            onTap: () {
                              setState(() {
                                fruits[index]["quantity"]++;
                                items.add(fruits[index]);
                              });
                            },
                            child: Container(
                              height: width * 0.08,
                              width: width * 0.182,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(width * 0.012),
                              ),
                              child: Center(
                                child: Text(
                                  "Add item",
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ),
                          )

                        ],
                      ),
                    )
                  ],
                );
              },
            ),

        ],
      );
  }
}
