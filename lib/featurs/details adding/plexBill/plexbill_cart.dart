import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:plexpay/Const/colorConst.dart';
import 'package:plexpay/featurs/details%20adding/plexBill/bill_items.dart';
import 'package:plexpay/featurs/details%20adding/plexBill/print.dart';

import '../../../Const/imageConst.dart';
import '../../../main.dart';

class cart extends StatefulWidget {
  final category;
  const cart({super.key, this.category});

  @override
  State<cart> createState() => _cartState();
}

int total = 0;
int vat = 0;

class _cartState extends State<cart> {
  dynamic added;
  List a = [];
  List b = [];

  // Method to calculate and update items in the cart
  totalprice() {
    a.clear();  // Clear list to prevent duplicates
    for (int i = 0; i < b.length; i++) {
      if (b[i]["quantity"] > 0) {
        // Check if the item is already in the list before adding
        if (!a.any((element) => element['text'] == b[i]['text'])) {
          added = b[i];
          a.add(added);
        }
      }
    }
    setState(() {});
  }

  // Calculate total price of items in the cart
  tascprice() {
    total = 0;
    for (int i = 0; i < a.length; i++) {
      total = a[i]["quantity"] * a[i]["Price"] + total;
    }
  }

  // Calculate VAT for items in the cart
  vatAdd() {
    vat = 0;
    for (int i = 0; i < a.length; i++) {
      vat = a[i]["quantity"] * a[i]["tax"] + vat;
    }
  }

  @override
  void initState() {
    print(items);
    b = widget.category;  // Assign the items to 'b' list
    totalprice();
    tascprice();
    vatAdd();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        height: height * 0.37,
        width: width * 0.91,
        color: Colors.white,
        child: Column(
          children: [
            Divider(
              thickness: width * 0.001,
              color: Colors.black,
              endIndent: width * 0.001,
              indent: width * 0.003,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Subtotal",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: width * 0.02,
                      color: Colors.black),
                ),
                Text(
                  "$total",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: width * 0.022,
                      color: Colors.black),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Vat",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: width * 0.02,
                      color: Colors.black),
                ),
                Text(
                  "$vat",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: width * 0.022,
                      color: Colors.black),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: width * 0.02,
                      color: Colors.black),
                ),
                Text(
                  "${total + vat}".toString(),
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: width * 0.024,
                      color: Colors.black),
                )
              ],
            ),
            SizedBox(
              height: height * 0.03,
            ),
            Divider(
              thickness: width * 0.001,
              color: Colors.black,
              endIndent: width * 0.2,
              indent: width * 0.2,
            ),
            SizedBox(
              height: height * 0.018,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => printout(),
                  ),
                );
              },
              child: Container(
                height: height * 0.08,
                width: width * 0.11,
                decoration: BoxDecoration(
                    color: colorConst.blue,
                    borderRadius: BorderRadius.circular(width * 0.016)),
                child: Center(
                  child: Text(
                    "Print",
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: width * 0.026,
                        color: Colors.white),
                  ),
                ),
              ),
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
            height: height * 0.09,
            width: width * 0.05,
            child: Padding(
              padding: EdgeInsets.all(width * 0.01),
              child: SvgPicture.asset(
                ImageConst.back,
              ),
            ),
          ),
        ),
        title: Text(
          "Cart",
          style: TextStyle(
              fontSize: width * 0.025, fontWeight: FontWeight.w700),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          a.isEmpty
              ? Center(
            child: Text(
              "Empty",
              style: TextStyle(
                  fontSize: width * 0.07, color: Colors.white),
            ),
          )
              : Expanded(
            child: Container(
              margin: EdgeInsets.all(width * 0.02),
              child: ListView.separated(
                scrollDirection: Axis.vertical,
                physics: BouncingScrollPhysics(),
                itemCount: a.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Center(
                        child: Container(
                          height: height * 0.14,
                          width: width * 0.89,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    blurStyle: BlurStyle.normal,
                                    color: Colors.black
                                        .withOpacity(0.09),
                                    offset: Offset(0, 2),
                                    spreadRadius: 1,
                                    blurRadius: 9)
                              ],
                              borderRadius: BorderRadius.circular(
                                  width * 0.014)),
                          child: Padding(
                            padding: EdgeInsets.all(width * 0.01),
                            child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    height: height * 0.5,
                                    width: width * 0.47,
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment
                                          .spaceBetween,
                                      children: [
                                        Container(
                                            height: height * 0.11,
                                            width: width * 0.1,
                                            decoration: BoxDecoration(
                                              color: Colors.red,
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      a[index]
                                                      ["image1"]),
                                                  fit: BoxFit.fill),
                                              borderRadius:
                                              BorderRadius.circular(
                                                  width * 0.013),
                                            )),
                                        Row(
                                          children: [

                                            Text(
                                              a[index]['text'],
                                              style: TextStyle(
                                                  fontSize: width *
                                                      0.02),
                                            ),
                                            SizedBox(
                                                  width: width*0.025,
                                            ),
                                            Text(
                                              a[index]["Price"]
                                                  .toString(),
                                              style: TextStyle(
                                                  fontSize: width *
                                                      0.02,fontWeight: FontWeight.w600),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  a[index]["quantity"] != 0
                                      ? Container(
                                    height: height * 0.06,
                                    width: width * 0.1,
                                    decoration: BoxDecoration(
                                        color: colorConst.blue,
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
                                            ["quantity"]--;
                                            if (a[index]
                                            ["quantity"] ==
                                                0) {
                                              // Remove the item if quantity becomes zero
                                              a.removeAt(index);
                                            }
                                            tascprice();
                                            vatAdd();
                                            setState(() {});
                                          },
                                          child: const Icon(
                                            Icons.remove,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Text(
                                          a[index]["quantity"]
                                              .toString(),
                                          style: TextStyle(
                                              color:
                                              Colors.white),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            a[index]["quantity"]++;
                                            tascprice();
                                            vatAdd();
                                            setState(() {});
                                          },
                                          child: Icon(
                                            Icons.add,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                      : InkWell(
                                    onTap: () {
                                      a[index]["quantity"]++;
                                      tascprice();
                                      vatAdd();
                                      setState(() {});
                                    },
                                    child: Container(
                                      height: height * 0.06,
                                      width: width * 0.1,
                                      decoration: BoxDecoration(
                                        color: colorConst.blue,
                                        borderRadius:
                                        BorderRadius.circular(
                                            width * 0.03),
                                      ),
                                      child: Center(
                                          child: Text(
                                            "Add item",
                                            style: TextStyle(
                                                color:
                                                Colors.white),
                                          )),
                                    ),
                                  )
                                ]),
                          ),
                        ),
                      ),

                    ],
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: height * 0.02,
                  );
                },
              ),
            ),
          ),
          SizedBox(
            height: height * 0.37,
          )
        ],
      ),
    );
  }
}
