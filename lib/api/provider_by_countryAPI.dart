import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:plexpay/Const/network.dart';
import 'package:plexpay/Const/snackbar_toast_helper.dart';



import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../Const/shared_preference.dart';




Future providerByCountryApi(country_iso,voucher) async {
  bool result = await InternetConnectionChecker().hasConnection;

  if(result == false)  {
    showToast("No internet connection!");
    return 0;

  }

  var token = await getSharedPrefrence('token');
  var id =   await getSharedPrefrence('userId');
  print("tokennnnnn");
  print(token);
  print(id);
  print(voucher);
  print(country_iso);

  print(token);
  final response = await http.post(Uri.parse( baseUrl+providersByCountryUrl),
    headers: {"Content-Type": 'application/x-www-form-urlencoded',
      "access-token": token,
      "user-id": id,
      "server-sslkey": serverKey},
    encoding: Encoding.getByName('utf-8'),
    body: {
      'service':voucher=="1"?"DigitalProduct":"Mobile",

      'countryIso':country_iso,



    },
  );
  var convertDataToJson;

  if (response.statusCode == 200) {
    convertDataToJson = json.decode(response.body);
    // If the server did return a 200 OK response,
    // then parse the JSON.
  } else {
    convertDataToJson = 0;
    showToast(response.body.toString());

  }


  return convertDataToJson;
}