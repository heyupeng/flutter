import 'package:flutter/material.dart';

import './lib/material.dart';

import '../../base/app_base.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  
      MaterialApp(
      title: 'Fluttr Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // errorColor: Colors.black,
      ),
      home: MyHomePage(title: 'matrial', routes: routesMap,),
      routes: {
        ...routesMap
      },
      navigatorObservers: [NavRouteServer.server(context)],
    );
  }
}
