import 'package:flutter/material.dart';
import 'package:plexpay/Const/colorConst.dart';
import 'package:plexpay/featurs/details%20adding/screen/voucher/operaterSelect.dart';

import '../../../../api/country_by_service_API.dart';
import '../../../../main.dart';

class VoucherCountry extends StatefulWidget {
  const VoucherCountry({super.key});

  @override
  State<VoucherCountry> createState() => _VoucherCountryState();
}

class _VoucherCountryState extends State<VoucherCountry> {
  var isLoading = true;
  var arrList = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    print("xoxoxo");
    this.getHome();

    setState(() {});
  }

  Future<String> getHome() async {
    var rsp = await countryByServiceApi(null);
    //
    print("catogerrrrry");
    print(rsp);
    if (rsp != 0) {
      setState(() {
        arrList = rsp['countries'];
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
      body: isLoading == true
          ? Container(
        child: Center(child: CircularProgressIndicator()),
      )
          : Container(
        margin: EdgeInsets.all(10),
        child: Scrollbar(
          child: ListView.separated(
            scrollDirection: Axis.vertical,
            physics: BouncingScrollPhysics(),
            separatorBuilder: (context, index) => SizedBox(
              height: 5,
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
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  OperaterSelect(id: item['CountryIso'].toString(),voucher: "1",dash:"1")),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        child: Container(
          child: Text(
            item['CountryName'].toString(),
            style: TextStyle(
                color: colorConst.blue,
                fontSize: 16,
                fontFamily: 'Poppins'),
          ),
        ),
      ),
    );
  }
}