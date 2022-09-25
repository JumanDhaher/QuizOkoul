import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:http/http.dart' as http;

import '../config/token.dart';

class MyNetworkManager {
  static Future<Map<String, dynamic>?> getData(String url) async {
    var token = await Token.getTokens();
    try {
      bool value;
      if (kIsWeb) {
        value = true;
      } else {
        final result = await InternetAddress.lookup('google.com');
        value = result.isNotEmpty && result[0].rawAddress.isNotEmpty;
      }

      if (value) {
        final response = await http.get(Uri.parse(url), headers: {
          'Authorization': 'Bearer $token',
        });
        final extractedData =
            json.decode(response.body) as Map<String, dynamic>;

        print('request' + response.request.toString());
        print(response.statusCode);

        return extractedData;
      }
      return null;
    } catch (error) {
      return null;

      //throw (error);
    }
  }

  static Future<Map?> postData(String url, Map<String, dynamic> maps) async {
    var token = await Token.getTokens();

    try {
      final response = await http.post(Uri.parse(url),
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          },
          body: json.encode(maps));
      print('request' + response.request.toString());
      print(response.statusCode);
      if (response.statusCode == 200) {
        final extractedData =
            json.decode(response.body) as Map<dynamic, dynamic>;
        print(extractedData);
        return extractedData;
      }
    } catch (error) {
      print(error);
      return null;
    }
  }
}
