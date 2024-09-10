import 'package:shared_preferences/shared_preferences.dart';



final currentusername1= "username";
final currentpassword1= "pass";
final chek1= "checkbox";

Future sharedPrefrence1(key,data) async {

  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString(key, data);

}

Future removesharedPrefrence(key,data) async {

  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.remove(key);

}


Future getSharedPrefrence(key) async {

  var prefs = await SharedPreferences.getInstance();
  var value = prefs.getString(key);

  return value;

}