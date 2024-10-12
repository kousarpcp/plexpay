import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../Const/NetWork.dart';
import '../Const/Snackbar_toast_helper.dart';
import '../Const/shared_preference.dart';




Future plexbillBillingApi() async {

  bool result = await InternetConnectionChecker().hasConnection;

  if(result == false)  {
    showToast("No internet connection!");
    return 0;

  }
  var token = await getSharedPrefrence('token');
  var id =   await getSharedPrefrence('userId');
  var dash =   await getSharedPrefrence('dash');


  final response = await http.post(Uri.parse( baseUrl7 + billing),
    headers: {
      "Content-Type": 'application/x-www-form-urlencoded',

    },
    encoding: Encoding.getByName('utf-8'),

  );
  var convertDataToJson;

  if (response.statusCode == 200) {
    convertDataToJson = json.decode(response.body);
    // If the server did return a 200 OK response,
    // then parse the JSON.
  } else {
    convertDataToJson = 0;
    print(response.body);
    showToast(response.body.toString());

  }


  return convertDataToJson;
}