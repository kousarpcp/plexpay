import 'package:shared_preferences/shared_preferences.dart';



final currentusername= "username";
final currentpassword= "pass";
final chek= "checkbox";
final shopname="";

Future sharedPrefrence(key,data) async {

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