// import 'dart:convert';
//
// import 'package:http/http.dart' as http;
// import 'package:plexpay/Const/NetWork.dart' as netWork1;
// import 'package:plexpay/Const/network.dart' as netWork2;
// import 'package:plexpay/Const/snackbar_toast_helper.dart';
// import 'package:internet_connection_checker/internet_connection_checker.dart';
//
// Future plexbillLoginPostApi(name, pass,token) async {
//   print("name");
//   print(name);
//   print(pass);
//   print(token);
//   bool result = await InternetConnectionChecker().hasConnection;
//
//   if(result == false)  {
//     showToast("No internet connection!");
//     return 0;
//
//   }
//   final response = await http.post(
//     Uri.parse(netWork1.baseUrl5 + netWork1.loginpost),
//     headers: {
//       "Content-Type": 'application/x-www-form-urlencoded',
//     },
//     encoding: Encoding.getByName('utf-8'),
//     body: {
//       "username": name.toString(),
//       "password": pass.toString(),
//       "_token": token
//     },
//   );
//   var convertDataToJson;
//
//   if (response.statusCode == 200) {
//     convertDataToJson = json.decode(response.body);
//
//     print("response.body");
//     print(response.body);
//     // If the server did return a 200 OK response,
//     // then parse the JSON.
//   } else {
//     convertDataToJson = "Something went wrong! :(";
//     // If the server did not return a 200 OK response,
//     // then throw an exception.
//     print("response.body");
//     print(response.body);
//     showToast(response.body.toString());
//
//   }
//
//   return convertDataToJson;
// }


import 'dart:convert';
import 'package:http/http.dart' as http;

import '../Const/NetWork.dart';

Future<dynamic> plexbillLoginPostApi(String name, String pass,  token,) async {
  print("name");
  print(name);
  print(pass);
  print(token);
  print("dddddddddddddddddd");
  final url = Uri.parse(baseUrl5 + loginpost);

  try {
    final response = await http.post(
      url,
      body: {'username': name.toString(), 'password': pass.toString(),"_token": token},
    );

    // Check if the response is JSON
    if (response.headers['content-type']?.contains('application/x-www-form-urlencoded') == true) {
      final jsonResponse = json.decode(response.body);
      return jsonResponse;
    } else {
      // Handle the case where the response is not JSON
      print("Received HTML response instead of JSON:");
      print(response.body);
      return {'success': false, 'message': 'Unexpected response format'};
    }
  } catch (e) {
    print('Error: $e');
    return {'success': false, 'message': 'An error occurred'};
  }
}
