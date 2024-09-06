import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:plexpay/Const/network.dart';

import 'package:plexpay/Const/snackbar_toast_helper.dart';

import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../Const/shared_preference.dart';






Future transactionSearchApi(account_number) async {
  print("account_number");
  print(account_number);
  bool result = await InternetConnectionChecker().hasConnection;

  if(result == false)  {
    showToast("No internet connection!");
    return 0;

  }
  var token = await getSharedPrefrence('token');
  var id =   await getSharedPrefrence('userId');


  print(baseUrl);

  final response = await http.post(Uri.parse( baseUrl+check_number_exist),
//  final response = await http.post(Uri.parse("https://asset.plexbill.com/api/check_number_exist"),
    headers: {"Content-Type": 'application/x-www-form-urlencoded',
      "access-token": token,
      "user-id": id,
      "server-sslkey": serverKey},
    encoding: Encoding.getByName('utf-8'),
    body: {

      'account_number':account_number,



    },
  );
  var convertDataToJson;

  if (response.statusCode == 200) {
    convertDataToJson = json.decode(response.body);   print("response.body");
    print(response.body);

    // If the server did return a 200 OK response,
    // then parse the JSON.
  } else {
    convertDataToJson = "Something went wrong! :(";
    print("response.body");
    print(response.body);
    showToast(response.body.toString());


  }


  return convertDataToJson;
}