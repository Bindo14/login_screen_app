import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:shared_preferences/shared_preferences.dart';

import 'app_exception.dart';
class HttpHelper {
  Future<dynamic> get(String url, {bool auth = false,}) async {
    Map<String, String> hd = await getHeaders(auth);

    print("Api URL:$url header:$hd");
    dynamic responseJson;

      try {
        final response = await http.get(Uri.parse(url), headers: hd);
        print("test response : $response code :${response.statusCode}");
        responseJson = _returnResponse(response);
      } catch (e) {
        print("web server error $e");
        throw FetchDataException('No Internet Connection', 500);
      }
    return responseJson;
  }
  Future<dynamic> post(String url, dynamic body,
      {bool auth = false, bool contentHeader = false}) async {
    Map<String, String> hd = await getHeaders(auth, contentHeader: contentHeader);
    print("Api URL:$url header:$hd body : $body");
    dynamic responseJson;
    try {
      final response = await http.post(Uri.parse(url), body: body, headers: hd);
      print("test response : ${json.decode(response.body)}");
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection', 500);
    }
    return responseJson;
  }


  getHeaders(auth, {bool  contentHeader= false}) async {
    Map<String, String> headers = {
      HttpHeaders.acceptHeader: "application/json",
      HttpHeaders.accessControlAllowOriginHeader:"*"
    };
    if (contentHeader == true) {
      headers.addAll({
        HttpHeaders.contentTypeHeader: "application/json",
      });
    }
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token");
    if (token != null && token.isNotEmpty) {
      headers.addAll({
        HttpHeaders.authorizationHeader: "Bearer $token",
      });
    }
    return headers;
  }
  dynamic _returnResponse(http.Response response) async {
    if (response.statusCode == 500 || response.statusCode == 502) {
      throw FetchDataException('${jsonDecode(response.body)['message']}', 500);
    }
    // var responseBody = jsonDecode(response.body);

    switch (response.statusCode) {
      case 200:
      case 201:
        var responseJson = response.body;
        return responseJson;
      case 400:
        var responseJson = response.body;
        return responseJson;
      case 404:
        var message = "";
        throw BadRequestException(message.toString(), response.statusCode);
    //var responseJson = response.body;
    //return responseJson;
      case 401:
      case 403:
      //Utility.log('object');
        var message = "";

        throw UnauthorisedException("", message, response.statusCode);

        break;
      case 422:
        var responseJson = response.body.toString();
        return responseJson;
      case 502:
        throw FetchDataException('', 500);
      case 500:
        throw FetchDataException('${json.decode(response.body)['message']}', 500);
      default:
        throw FetchDataException('${json.decode(response.body)['message']}', 500);
    }
  }





  ConvertFileToCast(data){
    List<int> list  =  List.from(data);
    return list;
  }
  jsonToFormData(http.MultipartRequest request, Map<String, dynamic> data) {
    for (var key in data.keys) {
      request.fields[key] = data[key].toString();
    }
    return request;
  }

  returnResponse(http.Response response) async {
    //  var responseBody = jsonDecode(response.body);
    switch (response.statusCode) {
      case 200:
      case 201:
        var responseJson = response.body;
        return responseJson;
      case 400:
        var responseJson = response.body;
        return responseJson;
      case 404:
        var message ="";
        throw BadRequestException(response.body.toString(), response.statusCode);
    //var responseJson = response.body;
    //return responseJson;
      case 401:
      case 403:
      //Utility.log('object');
        var message = "";

        throw UnauthorisedException("", message, response.statusCode,
            next: "");

        break;
      case 422:
        var responseJson = response.body.toString();
        return responseJson;
      case 500:
      default:
        throw FetchDataException(
            '${json.decode(response.body)['message']}', 500);
    }
  }
}

