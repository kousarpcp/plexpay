import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:flutter_svg/svg.dart';
import 'package:plexpay/Const/colorConst.dart';
import 'package:plexpay/featurs/details%20adding/screen/plexbill_cart.dart';

import '../../../Const/imageConst.dart';
import '../../../main.dart';
import 'bill_items.dart';

class plexbillNew extends StatefulWidget {
  final List fruits;
  final List vegitalbles;
  const plexbillNew({super.key, required this.fruits, required this.vegitalbles});

  @override
  State<plexbillNew> createState() => _plexbillNewState();
}

class _plexbillNewState extends State<plexbillNew> {

  List product = [
    {"image1": ImageConst.vegitables, "text": "Vegitables","quantity":0,},
    {"image1": ImageConst.mixFruit, "text": "Fruits","quantity":0,},
  ];

  String? dropdownValue;
  final _formKey = GlobalKey<FormState>();
  var customer=[
    "customer1",
    "customer2",
    "customer3",
  ];

  List All = [
    {
      "text":"CATEGORY",
      "icon":Icons.category_outlined
    },
    {
      "text":"ITEMS",
      "icon":Icons.card_travel_outlined
    },
    {
      "text":"CART",
      "icon":Icons.shopping_cart_outlined
    },
  ];
  int _selectedIndex = 0;
  var category ="";
  var items;
  late int catindex;
  TextEditingController nameController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        // scrolledUnderElevation: 0,
        // elevation: 0,
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
        title: LocaleText(
          "PlexBill",
          style:
          TextStyle(fontSize: width * 0.06, fontWeight: FontWeight.w700),
        ),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => cart(category:items),));
            },
            child: Container(
              height: width*0.06,
                width: width*0.11,
                decoration: BoxDecoration(
                  color: colorConst.blue,
                  borderRadius: BorderRadius.circular(width*0.01)
                ),
                child: Center(child: Text("Next",style: TextStyle(color: Colors.white),))),
          ),
          SizedBox(
            width: width*0.05,
          )
        ],
      ),
      body: Padding(
        padding:  EdgeInsets.all(width*0.03),
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
                        Text("Customer ID :",style: TextStyle(fontSize: 16),),
                        Text(" 6",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
                      ],
                    ),
                    Column(
                      children: [
                        Text("TRN Number :"),
                        Text(" 6456",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
                      ],
                    )
                  ],
                ),
                SizedBox(height: width*0.03,),
                TextFormField(
                  controller:nameController ,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                  style: TextStyle(
                    fontSize: 20,fontWeight: FontWeight.w500
                  ),
                  decoration: InputDecoration(
                    suffixIcon:  Padding(
                      padding:  EdgeInsets.all(width*0.002),
                      child: Container(
                        height: width*0.03,
                        width: width*0.3,
                        decoration: BoxDecoration(
                            // color: colorConst.lightgrey1,
                          borderRadius: BorderRadius.only(bottomRight:Radius.circular(width*0.02),topRight:Radius.circular(width*0.02))
                        ),
                        child: DropdownButton(
                            dropdownColor: Colors.white,
                            isExpanded: true,
                            // hint: Center(child: Text("Select Customer",style: TextStyle(fontSize: width*0.046,fontWeight: FontWeight.w800),)),
            
                            icon:Center(child: Padding(
                              padding:  EdgeInsets.only(right: width*0.07),
                              child: Icon(Icons.keyboard_arrow_down_outlined,),
                            )) ,
                            underline: SizedBox(),
                            value: dropdownValue,
                            items: customer.map<DropdownMenuItem<String>>((String? value) {
                              return DropdownMenuItem(
                                child: Center(child: Text(value!,style: TextStyle(fontSize: width*0.05,fontWeight: FontWeight.w600,),)),
                                value: value,);
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownValue;
                                nameController.text = newValue ?? '';
                              });
                            }
                        ),
                      ),
                    ),
                      hintText: "Customer Name",
                      contentPadding: EdgeInsets.all(width*0.03),
                      hintStyle: TextStyle(
                          fontSize: width * 0.052,
                          fontWeight: FontWeight.w600,
                          color: Colors.black
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(width*0.02)
                      )
                  ),
                ),
                SizedBox(
                  height: width*0.03,
                ),
                Container(
                  height: width*0.14,
                  width: width*1,
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
                                });
                              },
                              child: Container(
                                height: width*0.095,
                                width: width*0.299,
                                // margin: EdgeInsets.only(left: width*0.035),
                                decoration: BoxDecoration(
                                    color:  _selectedIndex==index ? colorConst.blue : Colors.white,
                                    borderRadius: BorderRadius.circular(width*0.02),
                                  border: Border.all(width: width*0.002)
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      All[index]["text"],
                                      style: TextStyle(color:_selectedIndex==index ? Colors.white: Colors.black, fontSize: 17.0),
                                    ),
                                    SizedBox(width: width*0.02,),
                                    Icon(All[index]["icon"],size: width*0.05,color:_selectedIndex==index ? Colors.white: Colors.black ,),
                                  ],
                                ),
                                
                              ),
                            )
                          ],
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(
                            width:width*0.02
                        );
                      },
                      itemCount: All.length
                  ),
                ),
                if(_selectedIndex==1&&category=="")
                  Container(),
                if(_selectedIndex==0)
                GridView.builder(
                  itemCount: product.length,
                    gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 0.62,
                        crossAxisSpacing: width*0.01,
                        mainAxisSpacing: width*0.01,
                        crossAxisCount: 3),
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, catindex) {
                    return Column(
                      children: [
                        InkWell(
                          onTap: () {
                            _selectedIndex=1;
                            category=product[catindex]["text"];
                            setState(() {

                            });
                            // Navigator.push(context, MaterialPageRoute(builder: (context) => cart(fruits: frui, vegitalbles: [],),));
                          },
                          child: Container(
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
                                  height: width*0.15,
                                  width: width*0.22,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                    image: DecorationImage(image: AssetImage(product[catindex]["image1"]),fit: BoxFit.cover,),
                                    borderRadius: BorderRadius.circular(width*0.012)
                                  ),
                                ),
                                SizedBox(
                                  height: width*0.01,
                                ),
                                Text(product[catindex]["text"],style: TextStyle(fontSize: 20,color: Colors.white),),
                                SizedBox(
                                  height: width*0.01,
                                ),
                                Container(
                                  height: width*0.06,
                                  width: width*0.15,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                    borderRadius: BorderRadius.circular(width*0.01)
                                  ),
                                  child: Center(child: Text("Select",style: TextStyle(fontWeight: FontWeight.w600),)),
                                )
                                                ],
                            )
                                              ),
                        )
                    ]
                    );
                  },
                ),
                if(_selectedIndex==1)
                    billItems(category:category),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
