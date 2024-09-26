import 'package:shared_preferences/shared_preferences.dart';



final currentusername1= "";
final currentpassword1= "";
final chek1= "checkbox";

Future plexbilllogin(key,data) async {

  SharedPreferences prefs1 = await SharedPreferences.getInstance();
  prefs1.setString(key, data);

}

Future removeplexbilllogin(key,data) async {

  SharedPreferences prefs1 = await SharedPreferences.getInstance();
  prefs1.remove(key);

}


Future getplexbilllogin(key) async {

  var prefs1 = await SharedPreferences.getInstance();
  var value = prefs1.getString(key);

  return value;

}