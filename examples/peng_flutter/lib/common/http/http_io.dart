import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import '../convert.dart';

export '../convert.dart';

class DirectoryUtil {
  static Directory get systemTemp => Directory.systemTemp;
  static Directory get applicationHome =>  systemTemp.parent;
  static Directory get applicationDocuments =>  Directory(applicationHome.path + '/Documents');
}

extension HttpRequestDescription on HttpRequest {
  String get description => 
     '''HttpRequest
  - url: $uri 
  - method: $method
  - headers: $headers
  '''
  ;
}

class XHttpServer {
  static const int defaultPort = 8888;
  static const String localhost = '127.0.0.1';// 'localhost';

  static final XHttpServer _share = XHttpServer();
  static XHttpServer get share => _share;

  static final Map<String, XHttpServer> _activeServers = {};
  static List<XHttpServer> get activeServers => _activeServers.values.toList();
  // ChangeNotifier? notifier;
  HttpServer? server;
  String host = localhost;
  int port = defaultPort;

  bool isOpening = false;
  
  void _store(XHttpServer server) {
    _activeServers[host + ':$port'] = this;
  }
  
  void _remove(XHttpServer server) {
    _activeServers.remove([host + ':$port']);
  }

  Future open({ 
    String host = localhost,
    int port = defaultPort,
    void Function(bool isOpening)? completion,
    void Function(SocketException socketException)? onError
  }) async {
    try {
      debugPrint('bind...');
      final requests = await HttpServer.bind(host, port);

      debugPrint('did open');
      server = requests;
      isOpening = true; this.host = host; this.port = port;
      _store(this);
      completion?.call(true);

      await for (final request in requests) {
        processRequest(request);
      }
    } 
    catch (error) {
      SocketException exception = error as SocketException;
      debugPrint('$exception');
      onError?.call(exception);
      return false;
    } 
    finally {
      _remove(this);
      debugPrint('finally');
    }
    return false;
  }

  Future close({bool force = false}) {
    isOpening = false;
    return server?.close(force: force) ?? Future(() => false);
  }

  processRequest(HttpRequest request) async {
    debugPrint('Got request for ' + request.description);
    
    final response = request.response;
    if (request.uri.path == '/dart') {
      response
        ..headers.contentType = ContentType(
          'text',
          'plain',
          charset: 'utf-8',
        )
        ..write('Hello from the server')
        ..write('this is the text content 中文 👍🎯');
        
        response.close();
    }
    else if (request.uri.path == '/data.json') {
      _readFile(response, './data.json');
      
    }
    else {
      response.statusCode = HttpStatus.notFound;
      response.close();
    }
    
  }

  String homeDir = '/Users/peng/Desktop/flutter/examples/peng_flutter';
  void foreach(Directory dir) {
    dir.list()
      .forEach((element) { 
        print(element.path.substring(DirectoryUtil.applicationHome.path.length));
        foreach(Directory(element.path));
       })
       
    ;
  }

  void _readFile(HttpResponse response, String file) async {
    final tempDir = Directory.systemTemp;
    // foreach(tempDir.parent);
    debugPrint('systemTemp: $tempDir)}');
    file = homeDir + '/lib/model/data.json';
    
    var config = File(file);
    Stream<List<int>> inputStream = config.openRead();
    var content = '';
    try {
      // content = await inputStream.join(); /* bytes_string */
      content = await inputStream.toJsonString();
      response.write(content);
      response.close();

      debugPrint('file is now closed');
    } catch (e) {
      print(e);
    }
  }
}

class XResponse {
  const XResponse(HttpClientResponse response, this.body): _response = response;
  
  final HttpClientResponse _response;
  
  final String body;

  int get statusCode => _response.statusCode;

  String get reasonPhrase =>_response.reasonPhrase;

  int get contentLength => _response.contentLength;
}

class XHttpClient {  
  static Future<XResponse> get(String uriString, {
    String unencodedPath = '',
    Map<String, dynamic>? queryParameters 
    }) {
    if (!uriString.startsWith('http://')) {
      uriString = 'http://' + uriString;
    }
    var url = Uri.parse(uriString);
    url.replace(queryParameters: queryParameters);

    var httpClient = HttpClient();
    // var request = await httpClient.getUrl(url);
    // var response = await request.close();
    // var data = await utf8.decoder.bind(response).toList();
    // print('Response ${response.statusCode}: $data');
    // httpClient.close();

    return httpClient.getUrl(url)
      .then((request) => request.close())
      .then((response) {        
        httpClient.close();
        return utf8.decodeStream(response)
          .then((jsonString) { 
            return XResponse(response, jsonString);
          });
      });
  }

  // static Future<XResponse> post(String uri, Map<String, String> parameters) {
  //   var url = Uri.parse(uri);
  //   var httpClient = HttpClient();
    
  //   httpClient.postUrl(url).then((request) {
  //     request
  //   })
  //   ;
  // }
}