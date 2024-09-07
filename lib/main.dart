import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plexpay/featurs/details%20adding/screen/Notification.dart';
import 'package:plexpay/featurs/details%20adding/screen/local.dart';
import 'package:plexpay/featurs/details%20adding/screen/splashScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'featurs/details adding/screen/BottomNavigation.dart';

import 'featurs/details adding/screen/Reacharge.dart';
import 'featurs/details adding/screen/Recharge bill genarate.dart';
import 'featurs/details adding/screen/plexBill.dart';
import 'featurs/details adding/screen/plexBill_New.dart';
import 'featurs/details adding/screen/plexBill_homePage.dart';
import 'featurs/details adding/screen/plexBill_login.dart';
import 'featurs/xpay/screen/xpay_page.dart';
import 'featurs/details adding/screen/collections.dart';
import 'featurs/details adding/screen/collectionsReciept.dart';
import 'featurs/details adding/screen/country_field.dart';
import 'featurs/details adding/screen/dataPacks.dart';
import 'featurs/details adding/screen/debit&credit.dart';
import 'featurs/details adding/screen/login_page.dart';
import 'featurs/details adding/screen/offer_details.dart';
import 'featurs/details adding/screen/costom.dart';
import 'featurs/details adding/screen/offer.dart';
import 'featurs/details adding/screen/funds.dart';
import 'featurs/details adding/screen/home_page.dart';

import 'featurs/details adding/screen/page1.dart';
import 'featurs/details adding/screen/popularPlans.dart';
import 'featurs/details adding/screen/profile.dart';


var height;
var width;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Locales.init(['en','ar', 'hi']);

  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     width = MediaQuery.of(context).size.width;
//     height = MediaQuery.of(context).size.height;
//     return LocaleBuilder(
//       builder: (locale) => MaterialApp(
//         title: 'Flutter Locales',
//         localizationsDelegates: Locales.delegates,
//         supportedLocales: Locales.supportedLocales,
//         locale: locale,
//         home: Splashscreen(),
//       ),
//     );
//   }
// }
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
          LocaleBuilder(
            builder:(locale) => MaterialApp(
              theme: ThemeData(
                textTheme: GoogleFonts.muktaVaaniTextTheme()
              ),
                title: 'Flutter Locales',
                localizationsDelegates: Locales.delegates,
                supportedLocales: Locales.supportedLocales,
                locale: locale,
                debugShowCheckedModeBanner: false,
                home: Login()),
          ),
    );
  }
}
