


import 'dart:convert';

import 'package:login_screen_app/http_service.dart';
class CommonRepository{

  static const urlName ="http://restapi.adequateshop.com/api/Tourist?page=1";
  static final HttpHelper httpHeader = HttpHelper();

  Future<dynamic> getTourist() async {

    var response = await httpHeader.get(urlName);
     print("get tourist data $response");
    return jsonDecode(response);
  }
}