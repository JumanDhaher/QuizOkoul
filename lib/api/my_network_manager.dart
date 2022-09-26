import 'dart:convert';
import 'package:http/http.dart' as http;

import '../config/token.dart';

class MyNetworkManager {
  static Future getDataList(String url) async {
    var token = await Token.getTokens();
    try {
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      };
      final response = await http.get(Uri.parse(url), headers: headers);
      final extractedData = json.decode(response.body);

      print('request' + response.request.toString());
      print(response.statusCode);
      print(extractedData.runtimeType);
      return extractedData;
    } catch (error) {
      //throw (error);
    }
  }

  static Future<Map<String, dynamic>?> getData(String url) async {
    var token = await Token.getTokens();
    try {
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      };
      final response = await http.get(Uri.parse(url), headers: headers);
      final extractedData = json.decode(response.body);

      print('request' + response.request.toString());
      print(response.statusCode);
      print(extractedData);
      return extractedData;
    } catch (error) {
      return null;

      //throw (error);
    }
  }

  static Future<Map?> postData(String url, Map<String, dynamic> maps,
      Map<String, String> headers) async {
    try {
      final response =
          await http.post(Uri.parse(url), headers: headers, body: maps);
      print('request' + response.request.toString());
      print(response.statusCode);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final extractedData =
            json.decode(response.body) as Map<dynamic, dynamic>;
        print(extractedData);
        return extractedData;
      }
    } catch (error) {
      print(error);
      return null;
    }
    return null;
  }
}
