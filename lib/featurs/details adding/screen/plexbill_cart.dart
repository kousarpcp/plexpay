import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../Const/imageConst.dart';
import '../../../main.dart';

class cart extends StatefulWidget {
  final List product;
  const cart({super.key, required this.product});

  @override
  State<cart> createState() => _cartState();
}
int total = 0;
class _cartState extends State<cart> {
  dynamic added;
  List a=[];
  totalprice(){
    for(int i=0;i<widget.product.length;i++){
      if(widget.product[i]["quantity"]>0){
        added=widget.product[i];
        a.add(added);
      }
      // print(a);
      // print("oooooooooooooooooooooooooooooooo");

    }

    setState(() {

    });
  }
  tascprice() {
    total = 0;
    for (int i = 0; i < a.length; i++) {
      total = a[i]["quantity"] *
          a[i]["Price"] +
          total;
    }
  }
  void initState() {
    totalprice();
    tascprice();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        height: width * 0.13,
        width: width * 0.999,
        color: Colors.white24,
        child: Column(
          children: [
            Divider(
              thickness: width * 0.005,
              color: Colors.black,
              endIndent: width * 0.01,
              indent: width * 0.01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Total Price:$total",
                  style: TextStyle(
                      fontWeight: FontWeight.w700, fontSize: width * 0.07),
                )
              ],
            )
          ],
        ),
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: InkWell(
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
          "Cart",
          style:
          TextStyle(fontSize: width * 0.06, fontWeight: FontWeight.w700),
        ),
      ),
      body: Column(
        children: [

          a.isEmpty?Center(child: Text("Empty")):Expanded(
            child: Container(
              margin: EdgeInsets.all(width*0.02),
              child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: BouncingScrollPhysics(),
                itemCount: a.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      // Text("category:",style: TextStyle(fontWeight: FontWeight.w800,fontSize: width*0.05),),
                      SizedBox(
                        height: width * 0.22,
                        width: width * 0.95,
                        child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                height: width * 0.5,
                                width: width * 0.55,
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                        height: width * 0.22,
                                        width: width * 0.22,
                                        decoration: BoxDecoration(
                                          color: Colors.red,
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  a[index]["image1"]),
                                              fit: BoxFit.fill),
                                          borderRadius:
                                          BorderRadius.circular(
                                              width * 0.04),
                                        )),
                                    Column(
                                      children: [
                                        SizedBox(
                                          height: width * 0.052,
                                        ),
                                        Text(
                                          a[index]['text'],
                                          style: TextStyle(
                                              fontSize: width * 0.052),
                                        ),
                                        SizedBox(
                                          height: width * 0.02,
                                        ),
                                        Text(
                                          a[index]["Price"]
                                              .toString(),
                                          style: TextStyle(
                                              fontSize: width * 0.06),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              a[index]["quantity"] != 0
                                  ? Container(
                                height: width * 0.095,
                                width: width * 0.22,
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius:
                                    BorderRadius.circular(
                                        width * 0.03)),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment
                                      .spaceBetween,
                                  children: [
                                    InkWell(
                                        onTap: () {
                                          a[index]
                                          ["quantity"] --;
                                          tascprice();
                                          setState(() {});
                                        },
                                        child: const Icon(
                                          Icons.remove,
                                          color: Colors.white,
                                        )),
                                    Text(
                                      a[index]["quantity"]
                                          .toString(),
                                      style: TextStyle(
                                          color: Colors.white),
                                    ),
                                    InkWell(
                                        onTap: () {
                                          a[index]
                                          ["quantity"] ++;
                                          tascprice();
                                          setState(() {});
                                        },
                                        child: Icon(
                                          Icons.add,
                                          color: Colors.white,
                                        )),
                                  ],
                                ),
                              )
                                  : InkWell(
                                onTap: () {
                                  a[index]["quantity"] ++;
                                  tascprice();
                                  setState(() {});
                                },
                                child: Container(
                                  height: width * 0.095,
                                  width: width * 0.22,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius:
                                    BorderRadius.circular(
                                        width * 0.03),
                                  ),
                                  child: Center(
                                      child: Text(
                                        "Add item",
                                        style: TextStyle(
                                            color: Colors.white),
                                      )),
                                ),
                              )
                            ]),
                      ),
                    ],
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: width * 0.04,
                  );
                },
              ),
            ),
          )


        ],

      ),
    );
  }
}
