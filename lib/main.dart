import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plexpay/featurs/details%20adding/screen/Notification.dart';
import 'package:plexpay/featurs/details%20adding/screen/local.dart';
import 'package:plexpay/featurs/details%20adding/screen/plexpay%20authentication/new_login_page.dart';
import 'package:plexpay/featurs/details%20adding/screen/plexpay%20authentication/number_submit_page.dart';
import 'package:plexpay/featurs/details%20adding/screen/splashScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'featurs/details adding/plexBill/plexbill_print.dart';
import 'featurs/details adding/plexBill/print.dart';
import 'featurs/details adding/screen/BottomNavigation.dart';

import 'featurs/details adding/screen/Reacharge.dart';
import 'featurs/details adding/screen/Recharge bill genarate.dart';
import 'featurs/xpay/screen/xpay_page.dart';
import 'featurs/details adding/screen/collections.dart';
import 'featurs/details adding/screen/collectionsReciept.dart';
import 'featurs/details adding/screen/country_field.dart';
import 'featurs/details adding/screen/dataPacks.dart';
import 'featurs/details adding/screen/debit&credit.dart';
import 'featurs/details adding/screen/plexpay authentication/login_page.dart';
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

  // Set default locale to English
  Locale defaultLocale = Locale('en');

// Get the size of the device's screen before running the app
  final mediaQueryData = WidgetsBinding.instance.window.physicalSize.width /
      WidgetsBinding.instance.window.devicePixelRatio;

  if (mediaQueryData < 400) {
    // Mobile phone: allow only portrait mode
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  } else {
    // Tablet: allow portrait and landscape modes
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp(defaultLocale: defaultLocale,));
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  // ]);
}

class MyApp extends StatelessWidget {
  final Locale defaultLocale;
  const MyApp({super.key, required this.defaultLocale});

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
                title: 'Plexpay',
                localizationsDelegates: Locales.delegates,
                supportedLocales: Locales.supportedLocales,
                locale: locale??defaultLocale,
                debugShowCheckedModeBanner: false,
                home: Splashscreen()),
          ),
    );
  }
}
