import 'dart:io';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class XHttpController extends ChangeNotifier {

  void get(String urlString,
    void Function(Map<String, dynamic> jsonRes) success, 
    void Function(http.Response response)? failure, 
  ) async {
    print(urlString);
    // urlstr + paramsStr
    var url = Uri.parse(urlString);

    // Await the http get response, then decode the json-formatted response.
    http.get(url).then((response) {
      if (response.statusCode == 200) {
        var jsonRes =
            convert.jsonDecode(response.body) as Map<String, dynamic>;
        print('Request successful. \n$jsonRes');
        success(jsonRes);
        notifyListeners();
      } else {
        print('Request failed with status: ${response.statusCode}.');
        if (failure != null) {
          failure(response);
        }
      }
    });
  }

  Future getAwait(String urlString,
    void Function(Map<String, dynamic> jsonRes) success, 
    void Function(http.Response response)? failure, 
  ) async {
    // urlstr + paramsStr
    var url = Uri.parse(urlString);

    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    if (response.statusCode == HttpStatus.ok) {
      var jsonRes =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      print('Request successful. \n$jsonRes');
      success(jsonRes);
      return jsonRes;
    } else {
      print('Request failed with status: ${response.statusCode}.');
      if (failure != null) {
        failure(response);
      }
      response.statusCode;
    }
  }
}
