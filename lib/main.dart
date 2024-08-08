import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plexpay/featurs/details%20adding/screen/Notification.dart';
import 'package:plexpay/featurs/details%20adding/screen/local.dart';
import 'package:plexpay/featurs/details%20adding/screen/splashScreen.dart';

import 'featurs/details adding/Const/NetWork.dart';
import 'featurs/details adding/Const/video lexpay.dart';
import 'featurs/details adding/screen/BottomNavigation.dart';

import 'featurs/details adding/screen/Reacharge.dart';
import 'featurs/details adding/screen/Recharge bill genarate.dart';
import 'featurs/details adding/screen/blank1.dart';
import 'featurs/details adding/screen/collections.dart';
import 'featurs/details adding/screen/collectionsReciept.dart';
import 'featurs/details adding/screen/country_field.dart';
import 'featurs/details adding/screen/dataPacks.dart';
import 'featurs/details adding/screen/debit&credit.dart';
import 'featurs/details adding/screen/offer_details.dart';
import 'featurs/details adding/screen/etisalat_custom.dart';
import 'featurs/details adding/screen/etisalat_offer.dart';
import 'featurs/details adding/screen/funds.dart';
import 'featurs/details adding/screen/home_page.dart';

import 'featurs/details adding/screen/page1.dart';
import 'featurs/details adding/screen/popularPlans.dart';
import 'featurs/details adding/screen/profile.dart';


var height;
var width;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus!.unfocus();
      },
      child:
          MaterialApp(
            theme: ThemeData(
              textTheme: GoogleFonts.muktaVaaniTextTheme()
            ),
              debugShowCheckedModeBanner: false,
              home: Splashscreen()),
    );
  }
}
