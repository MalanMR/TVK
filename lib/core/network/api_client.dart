import 'dart:convert';
import 'package:bloc_code/core/constant/api_constant.dart';
import 'package:http/http.dart' as http;

class ApiClient {
  static final http.Client ioclient = http.Client();

  Future <http.Response>getmethod(String endpoint) async {
    //final url = '${ApiConstant.scavengerUrl}$endpoint';
    final response = await ioclient.get(Uri.parse(endpoint));
    return response;
  }

  Future <http.Response>postmethod(String URL, dynamic body) async {
    final response = await ioclient.post(Uri.parse(URL),body: jsonEncode(body));
    return response;
  }

}