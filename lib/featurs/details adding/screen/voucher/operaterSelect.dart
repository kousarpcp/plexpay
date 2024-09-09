import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:plexpay/featurs/details%20adding/screen/offer_details.dart';

import '../../../../Const/colorConst.dart';
import '../../../../Const/imageConst.dart';
import '../../../../api/provider_by_countryAPI.dart';
import '../../../../main.dart';

class OperaterSelect extends StatefulWidget {
  final String id;
  final String voucher;
  final String dash;
  const OperaterSelect({super.key, required this.id, required this.voucher, required this.dash});

  @override
  State<OperaterSelect> createState() => _OperaterSelectState();
}

class _OperaterSelectState extends State<OperaterSelect> {
  var isLoading = true;
  var arrList = [];
  var dash = "0";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    print("xoxoxo");
    print(widget.id);
    this.getHome();

    setState(() {});
  }

  Future<String> getHome() async {
    var rsp = await providerByCountryApi(
        widget.id.toString(), widget.voucher.toString());

    //
    print("providersssss");
    print(rsp);
    if (rsp != 0) {
      setState(() {
        arrList = rsp['providers'];
      });
    }

    print("catogerrrrry");

    setState(() {
      isLoading = false;
    });

    return " ";
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text("Select Country",style: TextStyle(
            color: colorConst.blue,
            fontSize: width*0.06,
            fontWeight: FontWeight.bold
        ),),
      ),
      body: isLoading==true?Container(
        margin: EdgeInsets.only(
            bottom: width*0.05,
            left: width*0.05,
            right: width*0.05
        ),
        child: Center(child: Lottie.asset(ImageConst.loading1))
        ,
      ): arrList == null
          ? Center(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/no.png",
                width: MediaQuery.of(context).size.width * 0.6,
              ),
              Text(
                "No Data",
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.02,
                    fontWeight: FontWeight.w600),
              )
            ],
          ),
        ),
      )
          : Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Scrollbar(
          child: ListView.separated(
            scrollDirection: Axis.vertical,
            physics: BouncingScrollPhysics(),
            separatorBuilder: (context, index) => SizedBox(
              height: 10,
            ),
            shrinkWrap: true,
            itemCount: arrList != null ? arrList.length : 0,
            itemBuilder: (context, index) {
              final item = arrList != null ? arrList[index] : null;
              return Countries(item, index);
            },
          ),
        ),
      ),

    );
  }
  Countries(var item, int index) {
    final ss = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => OfferDetails(
          code: item['ProviderCode'].toString(),
          voucher: widget.voucher.toString(),
          image: item["logo"].toString(),
          name: item["provider_name"].toString(),
          dash: widget.dash,
        ),));
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        child: Row(
          children: [
            SizedBox(
              width: ss.width * 0.03,
            ),
            Container(
              height: ss.height * 0.08,
              width: ss.width * 0.12,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black12, width: 1),
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: NetworkImage(
                      item['logo'].toString(),
                    ),
                    fit: BoxFit.cover),
              ),
            ),
            SizedBox(
              width: ss.width * 0.03,
            ),
            Expanded(
              child: Text(
                item['provider_name'].toString(),
                style: TextStyle(
                    color: colorConst.blue,
                    fontSize: ss.height * 0.025,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
