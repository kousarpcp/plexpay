import 'dart:convert';

import 'package:http/http.dart' as http;
// import 'package:plexpay/Const/network.dart';
// import 'package:plexpay/Const/snackbar_toast_helper.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../Const/NetWork.dart';
import '../Const/Snackbar_toast_helper.dart';

Future loginApi(name, pass) async {
  print("name");
  print(name);
  print(pass);
  bool result = await InternetConnectionChecker().hasConnection;

  if(result == false)  {
    showToast("No internet connection!");
    return 0;

  }
  final response = await http.post(
    Uri.parse(baseUrl + loginUrl),
    headers: {
      "Content-Type": 'application/x-www-form-urlencoded',
      'server-sslkey':
      '7f88838a7d63896460bddde5bdd8dcc39be802297cdd76aaf9e6e6b97a4f18377c'
    },
    encoding: Encoding.getByName('utf-8'),
    body: {
      "username": name.toString(),
      "password": pass.toString(),
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
