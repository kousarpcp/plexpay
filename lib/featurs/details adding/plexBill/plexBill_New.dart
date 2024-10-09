import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:flutter_svg/svg.dart';
import 'package:plexpay/Const/colorConst.dart';
import 'package:plexpay/featurs/details%20adding/plexBill/plexbill_cart.dart';
import 'package:plexpay/featurs/details%20adding/plexBill/print.dart';

import '../../../Const/imageConst.dart';
import '../../../main.dart';
import 'bill_items.dart';

class plexbillNew extends StatefulWidget {
  const plexbillNew({
    super.key,
  });

  @override
  State<plexbillNew> createState() => _plexbillNewState();
}

int total = 0;
int vat = 0;

class _plexbillNewState extends State<plexbillNew> {
  List fruits = [
    {
      "image1": ImageConst.apple,
      "text": " Apple",
      "quantity": 0,
      "Price": 10,
      "tax": 3
    },
    {
      "image1": ImageConst.strawberry,
      "text": "Strawberry ",
      "quantity": 0,
      "Price": 20,
      "tax": 4
    },
    {
      "image1": ImageConst.mango,
      "text": "Mango ",
      "quantity": 0,
      "Price": 7,
      "tax": 2
    },
    {
      "image1": ImageConst.dragon,
      "text": "Dragon Fruit ",
      "quantity": 0,
      "Price": 25,
      "tax": 5
    },
  ];
  List vegitalbles = [
    {
      "image1": ImageConst.cucumber,
      "text": "Cucumber",
      "quantity": 0,
      "Price": 3,
      "tax": 1
    },
    {
      "image1": ImageConst.onion,
      "text": "Onion",
      "quantity": 0,
      "Price": 4,
      "tax": 1
    },
    {
      "image1": ImageConst.tomato,
      "text": "Tomato",
      "quantity": 0,
      "Price": 2,
      "tax": 1
    },
    {
      "image1": ImageConst.potato,
      "text": "Potato",
      "quantity": 0,
      "Price": 3,
      "tax": 1
    },
  ];

  List product = [
    {
      "image1": ImageConst.vegitables,
      "text": "Vegitables",
      "quantity": 0,
    },
    {
      "image1": ImageConst.mixFruit,
      "text": "Fruits",
      "quantity": 0,
    },
  ];

  String? dropdownValue;
  final _formKey = GlobalKey<FormState>();
  var customer = [
    "customer1",
    "customer2",
    "customer3",
  ];

  List All = [
    {"text": "CATEGORY", "icon": Icons.category_outlined},
    {"text": "ITEMS", "icon": Icons.card_travel_outlined},
    {"text": "CART", "icon": Icons.shopping_cart_outlined},
  ];
  int _selectedIndex = 0;
  var category = "";
  late int catindex;
  TextEditingController nameController = TextEditingController();

  dynamic added;
  List a = [];
  List b = [];
  List items = [];
  int cartCount = 0;

  // Method to calculate and update items in the cart
  totalprice() {
    a.clear(); // Clear list to prevent duplicates
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
    print("qqqqqqqqqqqqqqq");

    totalprice();
    tascprice();
    vatAdd();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(context).size.width > 650
        ? Scaffold(
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: _selectedIndex == 2
                ? Container(
              height: MediaQuery.of(context).size.height > 520?height * 0.37:height * 0.39,
              width: width * 1,
                    color: Colors.white,
                    child: Padding(
                      padding:  EdgeInsets.only(right:width*0.03,left: width*0.03),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
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
                                    fontSize: width * 0.018,
                                    color: Colors.black),
                              ),
                              Text(
                                "$total",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: width * 0.02,
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
                                    fontSize: width * 0.018,
                                    color: Colors.black),
                              ),
                              Text(
                                "$vat",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: width * 0.02,
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
                                    fontSize: width * 0.018,
                                    color: Colors.black),
                              ),
                              Text(
                                "${total + vat}".toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: width * 0.021,
                                    color: Colors.black),
                              )
                            ],
                          ),
                          Divider(
                            thickness: width * 0.001,
                            color: Colors.black,
                            endIndent: width * 0.2,
                            indent: width * 0.2,
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => printout(),
                                  ));
                            },
                            child: Container(
                              height: height * 0.08,
                              width: width * 0.5,
                              decoration: BoxDecoration(
                                  color: colorConst.blue,
                                  borderRadius:
                                      BorderRadius.circular(width * 0.016)),
                              child: Center(
                                child: Text(
                                  "Print",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: width * 0.023,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                : SizedBox(),
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
              title: LocaleText(
                "PlexBill",
                style: TextStyle(
                    fontSize: width * 0.025, fontWeight: FontWeight.w700),
              ),
              // actions: [
              //   InkWell(
              //     onTap: () {
              //       Navigator.push(
              //           context,
              //           MaterialPageRoute(
              //             builder: (context) => cart(category: items),
              //           ));
              //     },
              //     child: Container(
              //         height: height * 0.05,
              //         width: width * 0.063,
              //         decoration: BoxDecoration(
              //             color: colorConst.blue,
              //             borderRadius: BorderRadius.circular(width * 0.01)),
              //         child: Center(
              //             child: Text(
              //           "Next",
              //           style: TextStyle(color: Colors.white),
              //         ))),
              //   ),
              //   SizedBox(
              //     width: width * 0.03,
              //   )
              // ],
            ),
            body: SingleChildScrollView(
              child: Container(
                child: Wrap(
                  runSpacing: 20,
                  children: [
                    plexbill(),
                    _selectedIndex == 0 ? itemstab() : SizedBox(),
                    _selectedIndex == 1 ? BillItems() : SizedBox(),
                    _selectedIndex == 2 ? Cart() : SizedBox()
                  ],
                ),
              ),
            ))
        : Scaffold(
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: _selectedIndex == 2
                ? Container(
                    height: width * 0.48,
                    width: width * 0.91,
                    color: Colors.white,
                    child: Column(
                      children: [
                        Divider(
                          thickness: width * 0.005,
                          color: Colors.black,
                          endIndent: width * 0.01,
                          indent: width * 0.01,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Subtotal",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: width * 0.05,
                                  color: Colors.black),
                            ),
                            Text(
                              "$total",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: width * 0.05,
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
                                  fontSize: width * 0.05,
                                  color: Colors.black),
                            ),
                            Text(
                              "$vat",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: width * 0.05,
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
                                  fontSize: width * 0.05,
                                  color: Colors.black),
                            ),
                            Text(
                              "${total + vat}".toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: width * 0.05,
                                  color: Colors.black),
                            )
                          ],
                        ),
                        SizedBox(
                          height: width * 0.03,
                        ),
                        Divider(
                          thickness: width * 0.005,
                          color: Colors.black,
                          endIndent: width * 0.2,
                          indent: width * 0.2,
                        ),
                        SizedBox(
                          height: width * 0.018,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => printout(),
                                ));
                          },
                          child: Container(
                            height: width * 0.1,
                            width: width * 0.23,
                            decoration: BoxDecoration(
                                color: colorConst.blue,
                                borderRadius:
                                    BorderRadius.circular(width * 0.03)),
                            child: Center(
                              child: Text(
                                "Print",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: width * 0.06,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                : SizedBox(),
            backgroundColor: Colors.white,
            appBar: AppBar(
              scrolledUnderElevation: 0,
              elevation: 0,
              backgroundColor: Colors.white,
              title: LocaleText(
                "Billing",
                style: TextStyle(
                    fontSize: width * 0.06, fontWeight: FontWeight.w700),
              ),
              // actions: [
              //   InkWell(
              //     onTap: () {
              //       Navigator.push(
              //           context,
              //           MaterialPageRoute(
              //             builder: (context) => cart(category: items),
              //           ));
              //     },
              //       child: Stack(
              //         children: [
              //           Container(
              //               height: width*0.08,
              //               width: width*0.12,
              //               child: Icon(Icons.shopping_cart)),
              //           if(a.length>0)
              //           Positioned(
              //             left: width*0.069,
              //             bottom: width*0.04,
              //             child: CircleAvatar(
              //               radius: width*0.02,
              //               child: Column(
              //                 mainAxisAlignment: MainAxisAlignment.center,
              //                 children: [
              //                   Text( "${a.length}",style: TextStyle(fontSize: width*0.026),),
              //                 ],
              //               ),
              //               backgroundColor: Colors.red,
              //             ),
              //           )
              //         ],
              //       )
              //
              //     // Container(
              //     //     height: width * 0.06,
              //     //     width: width * 0.11,
              //     //     decoration: BoxDecoration(
              //     //         color: colorConst.blue,
              //     //         borderRadius: BorderRadius.circular(width * 0.01)),
              //     //     child: Center(
              //     //         child: Text(
              //     //       "Next",
              //     //       style: TextStyle(color: Colors.white),
              //     //     ))),
              //   ),
              //   SizedBox(
              //     width: width * 0.05,
              //   )
              // ],
            ),
            body: SingleChildScrollView(
              child: Container(
                child: Wrap(
                  runSpacing: 20,
                  children: [
                    plexbill(),
                    _selectedIndex == 0 ? itemstab() : SizedBox(),
                    _selectedIndex == 1 ? BillItems() : SizedBox(),
                    _selectedIndex == 2 ? Cart() : SizedBox()
                  ],
                ),
              ),
            ));
  }

  Widget plexbill() {
    return MediaQuery.of(context).size.width > 650
        ? Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: width * 0.03,right: width * 0.03),
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                LocaleText(
                                  "Customer ID :",
                                  style: TextStyle(fontSize: 16),
                                ),
                                Text(
                                  " 6",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text("TRN Number :"),
                                Text(
                                  " 6456",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        TextFormField(
                          controller: nameController,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.text,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                          decoration: InputDecoration(
                              suffixIcon: Padding(
                                padding: EdgeInsets.all(width * 0.002),
                                child: Container(
                                  height: height * 0.02,
                                  width: width * 0.287,
                                  decoration: BoxDecoration(
                                      // color: colorConst.lightgrey1,
                                      borderRadius: BorderRadius.only(
                                          bottomRight:
                                              Radius.circular(width * 0.02),
                                          topRight:
                                              Radius.circular(width * 0.02))),
                                  child: DropdownButton(
                                      dropdownColor: Colors.white,
                                      isExpanded: true,
                                      // hint: Center(child: Text("Select Customer",style: TextStyle(fontSize: width*0.046,fontWeight: FontWeight.w800),)),

                                      icon: Row(
                                        children: [
                                          Center(
                                              child: Padding(
                                            padding: EdgeInsets.only(
                                                right: width * 0.076,
                                                left: width * 0.08),
                                            child: Icon(
                                              Icons
                                                  .keyboard_arrow_down_outlined,
                                            ),
                                          )),
                                          InkWell(
                                            onTap: () {
                                              if (nameController
                                                  .text.isNotEmpty) {
                                                // Check if the name already exists in the list
                                                if (!customer.contains(
                                                    nameController.text)) {
                                                  setState(() {
                                                    // Add the typed name to the customer list
                                                    customer.add(
                                                        nameController.text);
                                                    // Update the dropdown value with the newly added customer
                                                    dropdownValue =
                                                        nameController.text;
                                                    // Clear the text field after adding
                                                    nameController.clear();
                                                  });
                                                } else {
                                                  // Optional: You can show a message or handle it gracefully if the name is already added
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(SnackBar(
                                                    content: Text(
                                                        "Name already exists!"),
                                                  ));
                                                }
                                              }
                                            },
                                            child: Container(
                                              height: width * 0.036,
                                              width: width * 0.076,
                                              decoration: BoxDecoration(
                                                  color: colorConst.blue,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          width * 0.01)),
                                              child: Center(
                                                  child: Text(
                                                "Add",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              )),
                                            ),
                                          ),
                                          SizedBox(
                                            width: width * 0.02,
                                          )
                                        ],
                                      ),
                                      underline: SizedBox(),
                                      value: dropdownValue,
                                      items: customer
                                          .map<DropdownMenuItem<String>>(
                                              (String? value) {
                                        return DropdownMenuItem(
                                          child: Center(
                                              child: Text(
                                            value!,
                                            style: TextStyle(
                                              fontSize: width * 0.02,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          )),
                                          value: value,
                                        );
                                      }).toList(),
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          dropdownValue;
                                          nameController.text = newValue ?? '';
                                        });
                                      }),
                                ),
                              ),
                              hintText: "Customer Name",
                              contentPadding: EdgeInsets.all(width * 0.018),
                              hintStyle: TextStyle(
                                  fontSize: width * 0.018,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.circular(width * 0.018))),
                        ),
                        SizedBox(
                          height: height * 0.03,
                        ),
                        Container(
                          height: height * 0.095,
                          width: width * 1,
                          child: ListView.separated(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              // physics: BouncingScrollPhysics(),
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          _selectedIndex = index;
                                          if (_selectedIndex == 2) {
                                            b = items;
                                            totalprice();
                                            tascprice();
                                            vatAdd();
                                          }
                                        });
                                      },
                                      child: Container(
                                        height: height * 0.095,
                                        width: width * 0.299,
                                        // margin: EdgeInsets.only(left: width*0.035),
                                        decoration: BoxDecoration(
                                            color: _selectedIndex == index
                                                ? colorConst.blue
                                                : Colors.white,
                                            borderRadius: BorderRadius.circular(
                                                width * 0.01),
                                            border: Border.all(
                                                width: width * 0.002)),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              All[index]["text"],
                                              style: TextStyle(
                                                  color: _selectedIndex == index
                                                      ? Colors.white
                                                      : Colors.black,
                                                  fontSize: 15.0),
                                            ),
                                            SizedBox(
                                              width: width * 0.02,
                                            ),
                                            Stack(
                                              children: [
                                                Container(
                                                  height: height*0.07,
                                                  width: width*0.05,
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    children: [
                                                      Icon(
                                                        All[index]["icon"],
                                                        size: width * 0.027,
                                                        color:
                                                        _selectedIndex == index ? Colors.white : Colors.black,

                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                if (index == 2 && a.length > 0)
                                                  Positioned(
                                                    left: width*0.02,
                                                    bottom: width*0.045,
                                                    child: CircleAvatar(
                                                      radius: width*0.001,
                                                     backgroundColor: Colors.cyanAccent,
                                                      child: Column(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        children: [
                                                          Text('${a.length}',style: TextStyle(fontSize: width*0.02,color: Colors.red),),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                              ],
                                            ) ,
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                );
                              },
                              separatorBuilder: (context, index) {
                                return SizedBox(width: width * 0.02);
                              },
                              itemCount: All.length),
                        ),
                        // if(_selectedIndex==2&&category=="")
                        //   Container(),
                        // if(_selectedIndex==1)
                        // -_selectedIndex==2?Cart():SizedBox(),

                        // _selectedIndex==1?billItems(category:category):SizedBox(),

                        // _selectedIndex==2? cart(category:category):SizedBox()
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )
        :  Column(
      children: [
        Padding(
          padding: EdgeInsets.all(width * 0.03),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          LocaleText(
                            "Customer ID :",
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            " 6",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text("TRN Number :"),
                          Text(
                            " 6456",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: width * 0.03,
                  ),
                  Container(
                    height: height*0.06,
                    child: TextFormField(
                      controller: nameController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.text,
                      style: TextStyle(
                          fontSize: width*0.045, fontWeight: FontWeight.w500),
                      decoration: InputDecoration(
                          suffixIcon: Padding(
                            padding: EdgeInsets.all(width * 0.002),
                            child: Container(
                              height: width * 0.03,
                              width: width * 0.287,
                              decoration: BoxDecoration(
                                // color: colorConst.lightgrey1,
                                  borderRadius: BorderRadius.only(
                                      bottomRight:
                                      Radius.circular(width * 0.02),
                                      topRight:
                                      Radius.circular(width * 0.02))),
                              child: DropdownButton(
                                  dropdownColor: Colors.white,
                                  isExpanded: true,
                                  // hint: Center(child: Text("Select Customer",style: TextStyle(fontSize: width*0.046,fontWeight: FontWeight.w800),)),

                                  icon: Row(
                                    children: [
                                      Center(
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                right: width * 0.07),
                                            child: Icon(
                                              Icons
                                                  .keyboard_arrow_down_outlined,
                                            ),
                                          )),
                                      InkWell(
                                        onTap: () {
                                          if (nameController
                                              .text.isNotEmpty) {
                                            // Check if the name already exists in the list
                                            if (!customer.contains(
                                                nameController.text)) {
                                              setState(() {
                                                // Add the typed name to the customer list
                                                customer.add(
                                                    nameController.text);
                                                // Update the dropdown value with the newly added customer
                                                dropdownValue =
                                                    nameController.text;
                                                // Clear the text field after adding
                                                nameController.clear();
                                              });
                                            } else {
                                              // Optional: You can show a message or handle it gracefully if the name is already added
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(SnackBar(
                                                content: Text(
                                                    "Name already exists!"),
                                              ));
                                            }
                                          }
                                        },
                                        child: Container(
                                          height: height * 0.035,
                                          width: width * 0.12,
                                          decoration: BoxDecoration(
                                              color: colorConst.blue,
                                              borderRadius:
                                              BorderRadius.circular(
                                                  width * 0.01)),
                                          child: Center(
                                              child: Text(
                                                "Add",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              )),
                                        ),
                                      ),
                                      SizedBox(
                                        width: width * 0.03,
                                      )
                                    ],
                                  ),
                                  underline: SizedBox(),
                                  value: dropdownValue,
                                  items: customer
                                      .map<DropdownMenuItem<String>>(
                                          (String? value) {
                                        return DropdownMenuItem(
                                          child: Center(
                                              child: Text(
                                                value!,
                                                style: TextStyle(
                                                  fontSize: width * 0.05,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              )),
                                          value: value,
                                        );
                                      }).toList(),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      dropdownValue;
                                      nameController.text = newValue ?? '';
                                    });
                                  }),
                            ),
                          ),
                          hintText: "Customer Name",
                          contentPadding: EdgeInsets.all(width * 0.03),
                          hintStyle: TextStyle(
                              fontSize: width * 0.052,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                          border: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.circular(width * 0.02))),
                    ),
                  ),
                  SizedBox(
                    height: width * 0.03,
                  ),
                  Container(
                    height: width * 0.10,
                    width: width * 1,
                    child: ListView.separated(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        // physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _selectedIndex = index;
                                    if (_selectedIndex == 2) {
                                      b = items;
                                      totalprice();
                                      tascprice();
                                      vatAdd();
                                    }
                                  });
                                },
                                child: Stack(
                                  children: [
                                    Container(
                                      height: width * 0.095,
                                      width: width * 0.299,
                                      // margin: EdgeInsets.only(left: width*0.035),
                                      decoration: BoxDecoration(
                                          color: _selectedIndex == index
                                              ? colorConst.blue
                                              : Colors.white,
                                          borderRadius: BorderRadius.circular(
                                              width * 0.02),
                                          border: Border.all(
                                              width: width * 0.002)),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            All[index]["text"],
                                            style: TextStyle(
                                                color: _selectedIndex == index
                                                    ? Colors.white
                                                    : Colors.black,
                                                fontSize: width*0.037),
                                          ),
                                          SizedBox(
                                            width: width * 0.01,
                                          ),
                                          Stack(
                                            children: [
                                              Container(
                                                height: width*0.09,
                                                width: width*0.08,
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  children: [
                                                    Icon(
                                                      All[index]["icon"],
                                                      size: width * 0.05,
                                                      color:
                                                      _selectedIndex == index ? Colors.white : Colors.black,

                                                    ),
                                                  ],
                                                ),
                                              ),
                                              if (index == 2 && a.length > 0)
                                                Positioned(
                                                  left: width*0.032,
                                                  bottom: width*0.045,
                                                  child: CircleAvatar(
                                                    radius: width*0.022,
                                                    backgroundColor: Colors.red,
                                                    child: Column(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        Text('${a.length}',style: TextStyle(fontSize: width*0.0287),),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                            ],
                                          ) ,

                                        ],
                                      ),
                                    ),
                                  ],

                                ),
                              ),

                            ],
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(width: width * 0.02);
                        },
                        itemCount: All.length),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget itemstab() {
    return MediaQuery.of(context).size.width > 650
        ? GridView.builder(
            itemCount: product.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 0.62,
                crossAxisSpacing: width * 0.01,
                mainAxisSpacing: width * 0.01,
                crossAxisCount: 6),
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemBuilder: (context, catindex) {
              return Column(children: [
                InkWell(
                  onTap: () {
                    _selectedIndex = 1;
                    category = product[catindex]["text"];
                    setState(() {});
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => cart(fruits: frui, vegitalbles: [],),));
                  },
                  child: Padding(
                    padding: EdgeInsets.only(left: width * 0.018),
                    child: Container(
                        height: MediaQuery.of(context).size.height>520? height * 0.3:height*0.32,
                        width: width * 0.12,
                        decoration: BoxDecoration(
                            color: colorConst.blue,
                            borderRadius: BorderRadius.circular(width * 0.02)),
                        child: Column(
                          children: [
                            SizedBox(
                              height: height * 0.022,
                            ),
                            Container(
                              height: height * 0.1,
                              width: width * 0.09,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  image: DecorationImage(
                                    image:
                                        AssetImage(product[catindex]["image1"]),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius:
                                      BorderRadius.circular(width * 0.013)),
                            ),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            Text(
                              product[catindex]["text"],
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            ),
                            SizedBox(
                              height: height * 0.04,
                            ),
                            Container(
                              height: height * 0.06,
                              width: width * 0.1,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.circular(width * 0.01)),
                              child: Center(
                                  child: Text(
                                "Select",
                                style: TextStyle(fontWeight: FontWeight.w600),
                              )),
                            )
                          ],
                        )),
                  ),
                )
              ]);
            },
          )
        : GridView.builder(
            itemCount: product.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 0.62,
                crossAxisSpacing: width * 0.01,
                mainAxisSpacing: width * 0.01,
                crossAxisCount: 3),
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemBuilder: (context, catindex) {
              return Column(children: [
                InkWell(
                  onTap: () {
                    _selectedIndex = 1;
                    category = product[catindex]["text"];
                    setState(() {});
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => cart(fruits: frui, vegitalbles: [],),));
                  },
                  child: Container(
                      height: width * 0.35,
                      width: width * 0.26,
                      decoration: BoxDecoration(
                          color: colorConst.blue,
                          borderRadius: BorderRadius.circular(width * 0.02)),
                      child: Column(
                        children: [
                          SizedBox(
                            height: width * 0.02,
                          ),
                          Container(
                            height: width * 0.15,
                            width: width * 0.22,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                image: DecorationImage(
                                  image:
                                      AssetImage(product[catindex]["image1"]),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius:
                                    BorderRadius.circular(width * 0.012)),
                          ),
                          SizedBox(
                            height: width * 0.01,
                          ),
                          Text(
                            product[catindex]["text"],
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                          SizedBox(
                            height: width * 0.01,
                          ),
                          Container(
                            height: width * 0.06,
                            width: width * 0.15,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.circular(width * 0.01)),
                            child: Center(
                                child: Text(
                              "Select",
                              style: TextStyle(fontWeight: FontWeight.w600),
                            )),
                          )
                        ],
                      )),
                )
              ]);
            },
          );
  }

  Widget BillItems() {
    return MediaQuery.of(context).size.width > 650
        ? Column(
            children: [
              if (category == "Vegitables")
                GridView.builder(
                  itemCount: vegitalbles.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 0.62,
                      crossAxisSpacing: width * 0.01,
                      mainAxisSpacing: width * 0.01,
                      crossAxisCount: 8),
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: width * 0.02),
                          child: Container(
                            height: MediaQuery.of(context).size.height > 520?height * 0.25:height * 0.36,
                            width: width * 0.125,
                            decoration: BoxDecoration(
                                color: colorConst.blue,
                                borderRadius:
                                    BorderRadius.circular(width * 0.012)),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: height*0.022,
                                ),
                                Container(
                                  height: MediaQuery.of(context).size.height > 520?height * 0.07:height * 0.1,
                                  width: width * 0.073,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      image: DecorationImage(
                                        image: AssetImage(
                                            vegitalbles[index]["image1"]),
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius:
                                          BorderRadius.circular(width * 0.007)),
                                ),
                                Text(
                                  vegitalbles[index]["text"],
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.white),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "AED",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15,
                                          color: Colors.white),
                                    ),
                                    SizedBox(
                                      width: width * 0.01,
                                    ),
                                    Text(vegitalbles[index]["Price"].toString(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 15,
                                            color: Colors.white)),
                                  ],
                                ),
                                SizedBox(
                                  height: height * 0.01,
                                ),
                                vegitalbles[index]["quantity"] != 0
                                    ? Container(
                                        height: height * 0.057,
                                        width: width * 0.077,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(
                                              width * 0.01),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                setState(() {
                                                  vegitalbles[index]
                                                      ["quantity"]--;
                                                  a.length--;
                                                });
                                              },
                                              child: Icon(
                                                Icons.remove,
                                                color: Colors.black,
                                                size: width * 0.02,
                                              ),
                                            ),
                                            Text(
                                              vegitalbles[index]["quantity"]
                                                  .toString(),
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                setState(() {
                                                  vegitalbles[index]
                                                      ["quantity"]++;
                                                  a.length++;
                                                });
                                              },
                                              child: Icon(
                                                Icons.add,
                                                color: Colors.black,
                                                size: width * 0.02,
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
                                            a.length++;
                                          });
                                        },
                                        child: Container(
                                          height: height * 0.057,
                                          width: width * 0.079,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(
                                                width * 0.01),
                                          ),
                                          child: Center(
                                            child: Text(
                                              "Add item",
                                              style: TextStyle(
                                                fontSize: width*0.015,
                                                  color: Colors.black),
                                            ),
                                          ),
                                        ),
                                      )
                              ],
                            ),
                          ),
                        )
                      ],
                    );
                  },
                ),
              if (category == "Fruits")
                GridView.builder(
                  itemCount: fruits.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 0.62,
                      crossAxisSpacing: width * 0.01,
                      mainAxisSpacing: width * 0.01,
                      crossAxisCount: 8),
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: width * 0.02),
                          child: Container(
                            height: MediaQuery.of(context).size.height > 520?height * 0.25:height * 0.36,
                            width: width * 0.125,
                            decoration: BoxDecoration(
                                color: colorConst.blue,
                                borderRadius:
                                    BorderRadius.circular(width * 0.012)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: MediaQuery.of(context).size.height > 520?height * 0.07:height * 0.1,
                                  width: width * 0.073,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      image: DecorationImage(
                                        image:
                                            AssetImage(fruits[index]["image1"]),
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius:
                                          BorderRadius.circular(width * 0.007)),
                                ),
                                Text(
                                  fruits[index]["text"],
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.white),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "AED",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15,
                                          color: Colors.white),
                                    ),
                                    SizedBox(
                                      width: width * 0.01,
                                    ),
                                    Text(fruits[index]["Price"].toString(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 15,
                                            color: Colors.white)),
                                  ],
                                ),
                                SizedBox(
                                  height: height * 0.01,
                                ),
                                fruits[index]["quantity"] != 0
                                    ? Container(
                                        height: height * 0.057,
                                        width: width * 0.077,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(
                                              width * 0.01),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                setState(() {
                                                  fruits[index]["quantity"]--;
                                                  a.length--;
                                                });
                                              },
                                              child: Icon(
                                                Icons.remove,
                                                color: Colors.black,
                                                size: width * 0.02,
                                              ),
                                            ),
                                            Text(
                                              fruits[index]["quantity"]
                                                  .toString(),
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                setState(() {
                                                  fruits[index]["quantity"]++;
                                                  a.length++;
                                                });
                                              },
                                              child: Icon(
                                                Icons.add,
                                                color: Colors.black,
                                                size: width * 0.02,
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
                                            a.length++;
                                          });
                                        },
                                        child: Container(
                                          height: height * 0.057,
                                          width: width * 0.077,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(
                                                width * 0.01),
                                          ),
                                          child: Center(
                                            child: Text(
                                              "Add item",
                                              style: TextStyle(
                                                fontSize: width*0.015,
                                                  color: Colors.black),
                                            ),
                                          ),
                                        ),
                                      )
                              ],
                            ),
                          ),
                        )
                      ],
                    );
                  },
                ),
            ],
          )
        : Column(
            children: [
              if (category == "Vegitables")
                GridView.builder(
                  itemCount: vegitalbles.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 0.6,
                      crossAxisSpacing: width * 0.01,
                      mainAxisSpacing: width * 0.01,
                      crossAxisCount: 4),
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Container(
                          height: width * 0.37,
                          width: width * 0.26,
                          decoration: BoxDecoration(
                              color: colorConst.blue,
                              borderRadius:
                                  BorderRadius.circular(width * 0.02)),
                          child: Column(
                            children: [
                              SizedBox(
                                height: width * 0.02,
                              ),
                              Container(
                                height: width * 0.12,
                                width: width * 0.18,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    image: DecorationImage(
                                      image: AssetImage(
                                          vegitalbles[index]["image1"]),
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius:
                                        BorderRadius.circular(width * 0.012)),
                              ),
                              Text(
                                vegitalbles[index]["text"],
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "AED",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18,
                                        color: Colors.white),
                                  ),
                                  SizedBox(
                                    width: width * 0.01,
                                  ),
                                  Text(vegitalbles[index]["Price"].toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 18,
                                          color: Colors.white)),
                                ],
                              ),
                              vegitalbles[index]["quantity"] != 0
                                  ? Container(
                                      height: width * 0.08,
                                      width: width * 0.182,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(
                                            width * 0.012),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              setState(() {
                                                vegitalbles[index]
                                                    ["quantity"]--;

                                                a.length--;
                                                // cartCount--;
                                              });
                                            },
                                            child:  Icon(
                                              Icons.remove,
                                              color: Colors.black,
                                              size: 20,
                                            ),
                                          ),
                                          Text(
                                            vegitalbles[index]["quantity"]
                                                .toString(),
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              setState(() {
                                                vegitalbles[index]
                                                    ["quantity"]++;
                                                a.length++;
                                                // cartCount++;
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
                                          a.length++;
                                          // cartCount++;
                                        });
                                      },
                                      child: Container(
                                        height: width * 0.08,
                                        width: width * 0.182,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(
                                              width * 0.012),
                                        ),
                                        child: Center(
                                          child: Text(
                                            "Add item",
                                            style:
                                                TextStyle(color: Colors.black),
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
              if (category == "Fruits")
                GridView.builder(
                  itemCount: fruits.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 0.62,
                      crossAxisSpacing: width * 0.01,
                      mainAxisSpacing: width * 0.01,
                      crossAxisCount: 4),
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Container(
                          height: width * 0.39,
                          width: width * 0.26,
                          decoration: BoxDecoration(
                              color: colorConst.blue,
                              borderRadius:
                                  BorderRadius.circular(width * 0.02)),
                          child: Column(
                            children: [
                              SizedBox(
                                height: width * 0.02,
                              ),
                              Container(
                                height: width * 0.12,
                                width: width * 0.18,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    image: DecorationImage(
                                      image:
                                          AssetImage(fruits[index]["image1"]),
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius:
                                        BorderRadius.circular(width * 0.012)),
                              ),
                              Text(
                                fruits[index]["text"],
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "AED",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18,
                                        color: Colors.white),
                                  ),
                                  SizedBox(
                                    width: width * 0.01,
                                  ),
                                  Text(fruits[index]["Price"].toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 18,
                                          color: Colors.white)),
                                ],
                              ),
                              fruits[index]["quantity"] != 0
                                  ? Container(
                                      height: width * 0.08,
                                      width: width * 0.182,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(
                                            width * 0.012),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              setState(() {
                                                fruits[index]["quantity"]--;
                                                a.length--;
                                              });
                                            },
                                            child:  Icon(
                                              Icons.remove,
                                              color: Colors.black,
                                              size: 20,
                                            ),
                                          ),
                                          Text(
                                            fruits[index]["quantity"]
                                                .toString(),
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              setState(() {
                                                fruits[index]["quantity"]++;
                                                a.length++;
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
                                          a.length++;
                                        });
                                      },
                                      child: Container(
                                        height: width * 0.08,
                                        width: width * 0.182,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(
                                              width * 0.012),
                                        ),
                                        child: Center(
                                          child: Text(
                                            "Add item",
                                            style:
                                                TextStyle(color: Colors.black),
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

  Widget Cart() {
    return MediaQuery.of(context).size.width > 650
        ? Column(
            children: [
              a.isEmpty
                  ? Center(
                      child: Text(
                        "Empty",
                        style: TextStyle(
                            fontSize: width * 0.07, color: Colors.white),
                      ),
                    )
                  : Column(
                      children: [
                        ListView.separated(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          physics: BouncingScrollPhysics(),
                          itemCount: a.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Center(
                                  child: Container(
                                    height: MediaQuery.of(context).size.height > 520?height * 0.14:height * 0.17,
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
                                                            BorderRadius
                                                                .circular(
                                                                    width *
                                                                        0.013),
                                                      )),
                                                  Row(
                                                    children: [

                                                      Text(
                                                        a[index]['text'],
                                                        style: TextStyle(
                                                            fontSize:
                                                                width * 0.02),
                                                      ),
                                                      SizedBox(
                                                        width: width * 0.025,
                                                      ),
                                                      Text(
                                                        a[index]["Price"]
                                                            .toString(),
                                                        style: TextStyle(
                                                            fontSize:
                                                                width * 0.02,
                                                            fontWeight: FontWeight.w600
                                                        ),
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
                                                            BorderRadius
                                                                .circular(
                                                                    width *
                                                                        0.03)),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        InkWell(
                                                          onTap: () {
                                                            a[index]
                                                                ["quantity"]--;
                                                            if (a[index][
                                                                    "quantity"] ==
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
                                                            a[index]
                                                                ["quantity"]++;
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
                                                            BorderRadius
                                                                .circular(
                                                                    width *
                                                                        0.03),
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
                        SizedBox(
                          height: height * 0.37,
                        )
                      ],
                    ),
            ],
          )
        : Column(
            children: [
              a.isEmpty
                  ? Center(
                      child: Text(
                        "Empty",
                        style: TextStyle(
                            fontSize: width * 0.07, color: Colors.white),
                      ),
                    )
                  : Column(
                      children: [
                        ListView.separated(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          physics: BouncingScrollPhysics(),
                          itemCount: a.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Center(
                                  child: Container(
                                    height: width * 0.25,
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
                                            width * 0.03)),
                                    child: Padding(
                                      padding: EdgeInsets.all(width * 0.03),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(
                                              height: width * 0.5,
                                              width: width * 0.47,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Container(
                                                      height: width * 0.18,
                                                      width: width * 0.18,
                                                      decoration: BoxDecoration(
                                                        color: Colors.red,
                                                        image: DecorationImage(
                                                            image: AssetImage(
                                                                a[index]
                                                                    ["image1"]),
                                                            fit: BoxFit.fill),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    width *
                                                                        0.04),
                                                      )),
                                                  Column(
                                                    children: [
                                                      SizedBox(
                                                        height: width * 0.02,
                                                      ),
                                                      Text(
                                                        a[index]['text'],
                                                        style: TextStyle(
                                                            fontSize:
                                                                width * 0.052),
                                                      ),
                                                      Text(
                                                        a[index]["Price"]
                                                            .toString(),
                                                        style: TextStyle(
                                                            fontSize:
                                                                width * 0.06),
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
                                                        color: colorConst.blue,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    width *
                                                                        0.03)),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        InkWell(
                                                          onTap: () {
                                                            a[index]
                                                                ["quantity"]--;
                                                            if (a[index][
                                                                    "quantity"] ==
                                                                0) {
                                                              // Remove the item if quantity becomes zero
                                                              a.removeAt(index);
                                                            }
                                                            tascprice();
                                                            vatAdd();
                                                            setState(() {});
                                                          },
                                                          child:  Icon(
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
                                                            a[index]
                                                                ["quantity"]++;
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
                                                      height: width * 0.095,
                                                      width: width * 0.22,
                                                      decoration: BoxDecoration(
                                                        color: colorConst.blue,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    width *
                                                                        0.03),
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
                              height: width * 0.025,
                            );
                          },
                        ),
                        SizedBox(
                          height: width * 0.53,
                        )
                      ],
                    ),
            ],
          );
  }
}
