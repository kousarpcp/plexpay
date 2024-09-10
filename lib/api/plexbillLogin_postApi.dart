
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '../Const/NetWork.dart';
import '../Const/Snackbar_toast_helper.dart';

Future<dynamic> plexbillLoginApi(String name, String pass) async {
  print("Attempting to log in with username: $name");
  print(name);
  print(pass);
  print("qqqqqqqqq");

  // Check for internet connection
  bool hasConnection = await InternetConnectionChecker().hasConnection;

  if (!hasConnection) {
    showToast("No internet connection!");
    return null;
  }

  try {
    final response = await http.post(
      Uri.parse(baseUrl5 + loginpost),
      headers: {
        "Content-Type": 'application/x-www-form-urlencoded',
      },
      encoding: Encoding.getByName('utf-8'),
      body: {
        "username": name.toString(), // Fix: Pass the actual username and password
        "password": pass.toString(),
      },
    ).timeout(const Duration(seconds: 15)); // Adding timeout of 15 seconds

    if (response.statusCode == 200) {
      var responseData = json.decode(response.body);
      print("Login successful, response: $responseData");
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


