import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:plexpay/Const/network.dart';
import 'package:plexpay/Const/snackbar_toast_helper.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../Const/shared_preference.dart';








Future RechargeApi(SkuCode,providerCode,AccountNumber,SendValue,ReceiveValue,Our_SendValue,Country_Iso,CoupenTitle,dash) async {
  bool result = await InternetConnectionChecker().hasConnection;

  if(result == false)  {
    showToast("No internet connection!");
    return 0;

  }
  print("providerCode");
  var token = await getSharedPrefrence('token');
  print(token);

  print("SkuCode" +":"+ SkuCode);
  print("providerCode"+":"+ providerCode);
  print("AccountNumber"+":"+ AccountNumber);
  print("SendValue"+":"+ SendValue);
  print("ReceiveValue"+":"+ ReceiveValue);
  print("Our_SendValue"+":"+ Our_SendValue);
  print("Country_Iso"+":"+ Country_Iso);

  var id =   await getSharedPrefrence('userId');
  // var dash =   await getSharedPrefrence('dash');
  print("id"+":"+ id);


  final response = await http.post(Uri.parse( baseUrl+interRechargeUrl),
    headers: {"Content-Type": 'application/x-www-form-urlencoded',
      "access-token": token,
      "user-id": id,
      "server-sslkey": serverKey},
    encoding: Encoding.getByName('utf-8'),
    body: {
      'Dash':dash,
      'CoupenTitle':CoupenTitle,
      'ProviderCode':providerCode,
      'AccountNumber':AccountNumber,

      'SkuCode':SkuCode,


      'SendValue':SendValue,
      'ReceiveValue':ReceiveValue,  ///--> postpaid amountt
      'Our_SendValue':Our_SendValue,
      'Country_Iso':Country_Iso,










    },
  );
  var convertDataToJson;

  if (response.statusCode == 200) {
    print("response.body");
    print(response.body);
    convertDataToJson = json.decode(response.body);


    // If the server did return a 200 OK response,
    // then parse the JSON.
  } else {
    convertDataToJson = 0;
    print("response.body");
    print(response.body);
    showToast(response.body.toString());

  }


  return convertDataToJson;
}