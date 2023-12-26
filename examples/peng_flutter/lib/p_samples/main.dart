import 'dart:async';
import 'dart:developer';
import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:peng_flutter/base/app_base.dart';

import 'api/main.dart' as apiApp;
import 'layers/main_widgets.dart' as layersApp;

Map<String, Widget Function(BuildContext)> homeRoutes = 
{
  // ...apiApp.routesMap,
  'API': (context) => apiApp.MyApp(),
  'Other': (context) => MyHomePage(title: 'Other', routes: layersApp.routesMap,)
};

void main() {
  String path = '/Users/peng/Desktop/flutter/examples/api/lib/material';
  Future<Directory> directory = Directory(path).create(recursive: true);
  print('directory: ${directory}');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ModalRoute<Object?>? route = ModalRoute.of(context);
    log('ModalRoute: ${route}');
    log('${this.runtimeType} - ${context.runtimeType}');
    return MaterialApp(
      title: 'Fluttr Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        hintColor: Colors.white,
      ),
      home: const TabPage(
        children: [
          
        ],
        items: [],
      ),
      // initialRoute: 'Home',
      // routes: {
      //   'Home': (BuildContext context) => MyHomePage(title: "Home"),
      //   ...routesMap
      // },
      onGenerateRoute: (RouteSettings settings) {
        log('onGenerateRoute: ${settings.name!}');
        CTM_MaterialPageRoute route = CTM_MaterialPageRoute(builder: apiApp.routesMap[settings.name]!, settings: settings);
        return route;
      },
      navigatorObservers: [NavRouteServer.shared],
    );
  }
}

