import 'dart:convert';
import 'package:http/http.dart' as http;
// import 'package:plexpay/Const/network.dart';
// import 'package:plexpay/Const/sharedPref.dart';
// import 'package:plexpay/Const/snackbar_toast_helper.dart';




import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../Const/NetWork.dart';
import '../Const/SharedPref.dart';
import '../Const/Snackbar_toast_helper.dart';



Future customHomeRcData(mobile,amount) async {

  bool result = await InternetConnectionChecker().hasConnection;

  if(result == false)  {
    showToast("No internet connection!");
    return 0;

  }
  var token = await getSharedPrefrence('token');
  var id =   await getSharedPrefrence('userId');
  var dash =   await getSharedPrefrence('dash');

  // token ="Xu8o98zS8beWYghH+9VIBVux1wRS+Sm2A6v05CP0kA";
  // id= "16";
  final response = await http.post(Uri.parse( baseUrl+getCustomAmountUrl),
    headers: {"Content-Type": 'application/x-www-form-urlencoded',
      "access-token": token,
      "user-id": id,
      "server-sslkey": serverKey},
    encoding: Encoding.getByName('utf-8'),
    body: {

      'amount':amount,
      'mobile':mobile,





    },
  );
  var convertDataToJson;

  if (response.statusCode == 200) {
    convertDataToJson = json.decode(response.body);
    print("responsee");
    print(response.body.toString());

    // If the server did return a 200 OK response,
    // then parse the JSON.
  } else {
    convertDataToJson = 0;

    print("responsee");
    print(response.body.toString());
    showToast(response.body.toString());

  }


  return convertDataToJson;
}