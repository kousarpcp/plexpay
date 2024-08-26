import 'dart:convert';

import 'package:http/http.dart' as http;
// import 'package:plexpay/Const/network.dart';
// import 'package:plexpay/Const/snackbar_toast_helper.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../Const/NetWork.dart';
import '../Const/Snackbar_toast_helper.dart';

Future PlexBillLoginApi(name, pass) async {
  print("name");
  print(name);
  print(pass);
  bool result = await InternetConnectionChecker().hasConnection;

  if(result == false)  {
    showToast("No internet connection!");
    return 0;

  }

  final response = await http.post(
    Uri.parse(baseUrl3 + userloginUrl),
    headers: {
      "Content-Type": 'application/x-www-form-urlencoded',

    },
    encoding: Encoding.getByName('utf-8'),
    body: {
      "username": name(),
      "password": pass(),
     " _token":"N8lO9tgAJliYsdsIKvp1chH8uHlzB6CYYTOpqBKj"

    },
  );
  var convertDataToJson;

  if (response.statusCode == 200) {
    convertDataToJson = json.decode(response.body);

    print("response.body");
    print(response.body);
    // If the server did return a 200 OK response,
    // then parse the JSON.
  } else {
    convertDataToJson = "Something went wrong! :(";
    // If the server did not return a 200 OK response,
    // then throw an exception.
    print("response.body");
    print(response.body);
    showToast(response.body.toString());

  }

  return convertDataToJson;
}
