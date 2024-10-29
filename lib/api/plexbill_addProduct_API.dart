

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '../Const/NetWork.dart';
import '../Const/Snackbar_toast_helper.dart';

Future<dynamic> plexbillAddProductApi( id,) async {
  print(" $id");

  print("qqqqqqqqq");

  // Check for internet connection
  bool hasConnection = await InternetConnectionChecker().hasConnection;

  if (!hasConnection) {
    showToast("No internet connection!");
    return null;
  }

  try {
    final response = await http.post(
      Uri.parse(baseUrl7 + product),
      headers: {
        "Content-Type": 'application/x-www-form-urlencoded',
      },
      encoding: Encoding.getByName('utf-8'),
      body: {
        "id": id
      },
    ).timeout(const Duration(seconds: 15)); // Adding timeout of 15 seconds

    if (response.statusCode == 200) {
      var responseData = json.decode(response.body);
      print(" response: $responseData");
      return responseData;
    } else {
      print("Error: Status code ${response.statusCode}");
      showToast("Invalid Credentials!");
      return null;
    }
  } catch (e) {
    print("An error occurred: $e");
    showToast("An unexpected error occurred.");
    return null;
  }
}













// import 'dart:convert';
//
// import 'package:http/http.dart' as http;
// import 'package:internet_connection_checker/internet_connection_checker.dart';
//
// import '../Const/NetWork.dart';
// import '../Const/Snackbar_toast_helper.dart';
// import '../Const/shared_preference.dart';




// Future plexbillBillingApi(id) async {
//
//   bool result = await InternetConnectionChecker().hasConnection;
//
//   if(result == false)  {
//     showToast("No internet connection!");
//     return 0;
//
//   }
//   // var token = await getSharedPrefrence('token');
//   // var id =   await getSharedPrefrence('userId');
//   // var dash =   await getSharedPrefrence('dash');
//
//
//   final response = await http.post(Uri.parse( baseUrl7 + billing),
//     headers: {
//       "Content-Type": 'application/x-www-form-urlencoded',
//
//     },
//     encoding: Encoding.getByName('utf-8'),
//     body: {
//     "id":id,
//     },
//   );
//   var convertDataToJson;
//
//   if (response.statusCode == 200) {
//     convertDataToJson = json.decode(response.body);
//     // If the server did return a 200 OK response,
//     // then parse the JSON.
//   } else {
//     convertDataToJson = 0;
//     print(response.body);
//     showToast(response.body.toString());
//
//   }
//
//
//   return convertDataToJson;
// }