import 'package:shared_preferences/shared_preferences.dart';



final currentusername1= "";
final currentpassword1= "";
final chek1= "checkbox";

Future sharedPrefrence1(key,data) async {

  SharedPreferences prefs1 = await SharedPreferences.getInstance();
  prefs1.setString(key, data);

}

Future removesharedPrefrence1(key,data) async {

  SharedPreferences prefs1 = await SharedPreferences.getInstance();
  prefs1.remove(key);

}


Future getSharedPrefrence1(key) async {

  var prefs1 = await SharedPreferences.getInstance();
  var value = prefs1.getString(key);

  return value;

}