import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:plexpay/Const/imageConst.dart';
// import 'package:plexpay/featurs/details%20adding/screen/colorConst.dart';
import 'package:plexpay/featurs/details%20adding/screen/home_page.dart';
import 'package:plexpay/featurs/details%20adding/screen/page1.dart';
import 'package:plexpay/featurs/details%20adding/screen/History_Bottom.dart';
import 'package:plexpay/featurs/details%20adding/screen/plexBill_login.dart';


import '../../../Const/colorConst.dart';
import '../../../main.dart';
import '../../xpay/screen/xpay_page.dart';
import 'collections.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int select = 0;
  int selectedIndex = 0;

  final List<Widget> Ann = [
    home_page(),
    Collections(),
    XpayPage(),
    HistoryBottom3(),
    plexbill_login(),
  ];
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Ann[selectedIndex],
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor:  colorConst.blue,
          key: _bottomNavigationKey,
          // elevation: 0,
          // type: BottomNavigationBarType.fixed,
          // showUnselectedLabels: false,
          // showSelectedLabels: true,
          // selectedItemColor: Colors.indigoAccent,
          // unselectedItemColor: Colors.grey,
          // backgroundColor: Colors.white,
          // currentIndex: selectedIndex,
          // onTap: (value) {
          //   selectedIndex = value;
          //   setState(() {});
          // },
          items: [
            CurvedNavigationBarItem( label:Locales.string(context, 'Home') , child:  Icon(Icons.home)),
            CurvedNavigationBarItem(
                child:  Icon(CupertinoIcons.chart_pie), label:Locales.string(context, 'Collections')),
            CurvedNavigationBarItem(
                child: Container(
                  height: width*0.08,
                  width: width*0.2,
                  child: Image(image:AssetImage(ImageConst.xpay), fit: BoxFit.cover,),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10)),
                ),
                label: "",
                
            ),
            CurvedNavigationBarItem(
              child: Icon(Icons.history),
              label: Locales.string(context, 'History'),
            ),
            CurvedNavigationBarItem(
                child: Icon(Icons.sticky_note_2_outlined), label:Locales.string(context, 'PlexBill')),
          ],
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          letIndexChange: (index) => true,
        ),
      ),
    );
  }
}
