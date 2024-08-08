import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:plexpay/featurs/details%20adding/screen/colorConst.dart';
import 'package:plexpay/featurs/details%20adding/screen/home_page.dart';
import 'package:plexpay/featurs/details%20adding/screen/page1.dart';
import 'package:plexpay/featurs/details%20adding/screen/History_Bottom.dart';
import 'package:plexpay/featurs/details%20adding/screen/Share.dart';
import 'package:plexpay/featurs/responsive/responsive__layout.dart';

import '../Const/colorConst.dart';
import 'blank1.dart';
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
    blank(),
    HistoryBottom3(),
    share(),
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
            CurvedNavigationBarItem( label: 'Home', child:  Icon(Icons.home)),
            CurvedNavigationBarItem(
                child:  Icon(CupertinoIcons.chart_pie), label: 'Collections'),
            CurvedNavigationBarItem(
                child: Container(
                  height: 40,
                  width: 40,
                  child: Icon(
                    CupertinoIcons.add,
                    color: Colors.white,
                  ),
                  decoration: BoxDecoration(
                      color: colorConst.blue,
                      borderRadius: BorderRadius.circular(10)),
                ),
                label: "",
                
            ),
            CurvedNavigationBarItem(
              child: Icon(Icons.history),
              label: 'History',
            ),
            CurvedNavigationBarItem(
                child: Icon(Icons.ios_share), label: 'Reports'),
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
