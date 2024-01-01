import 'dart:io';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

extension String2JsonObject on String {
  T toJsonObject<T>() {
    return convert.jsonDecode(this) as T;
  }
}

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
        try {
          Map<String, dynamic> jsonRes = response.body.toJsonObject();
          print('Request successful. \n$jsonRes');
          success(jsonRes);
        } catch(e) { 
          failure?.call(response);
        }
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
      try  {
        Map<String, dynamic> jsonRes =response.body.toJsonObject();
        print('Request successful. \n$jsonRes');
        success(jsonRes);
        return jsonRes;
      }
      catch (e) {
        failure?.call(response);
        return response.body;
      }
    } else {
      print('Request failed with status: ${response.statusCode}.');  
      failure?.call(response);

      response.statusCode;
    }
  }

  void post() {
    // var url = Uri.https('example.com', 'whatsit/create');
    // var response = await http.post(url, body: {'name': 'doodle', 'color': 'blue'});
    // print('Response status: ${response.statusCode}');
    // print('Response body: ${response.body}');

    // print(await http.read(Uri.https('example.com', 'foobar.txt')));
  }
}
