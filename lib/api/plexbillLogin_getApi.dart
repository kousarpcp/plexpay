import 'dart:convert'; // Import this for JSON conversion
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' show parse;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Const/NetWork.dart';
import '../Const/Snackbar_toast_helper.dart';
import '../featurs/details adding/screen/plexBill_login.dart';
String?globaltoken;
Future<Map<String, dynamic>?> plexbillLoginGetApi() async {
  // Check for an internet connection
  bool hasConnection = await InternetConnectionChecker().hasConnection;
  if (!hasConnection) {
    showToast("No internet connection!");
    return null;
  }

  // Send a GET request
  final response = await http.get(Uri.parse(baseUrl5 + loginget));

  // Check if the response is successful
  if (response.statusCode == 200) {
    // Check if the response is HTML
    if (response.body.startsWith('<html>')) {
      // Handle HTML response
      var document = parse(response.body);

      // Extract token from the HTML if needed
      var tokenElement = document.querySelector('input[name="_token"]');
      String?token = tokenElement?.attributes['value'];
      globaltoken=token;
      print(globaltoken);
      print("hhhhhhhhhh");


      if (token != null) {

        return {'token': token,};
      } else {
        showToast("Token not found in the HTML response.");
        return null;
      }
    } else {
      // Attempt to parse the response as JSON
      try {
        var jsonData = json.decode(response.body);
        print("Parsed JSON data: $jsonData");
        return jsonData;
      } catch (e) {
        showToast("Error parsing JSON: $e");
        return null;
      }
    }
  } else {
    // Handle non-200 responses
    showToast("Request failed with status: ${response.statusCode}");
    return null;
  }
}
