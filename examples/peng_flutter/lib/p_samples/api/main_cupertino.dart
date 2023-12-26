import 'package:flutter/material.dart';
import 'package:peng_flutter/base/app_base.dart';

import './lib/cupertino.dart';

void main() {
  runApp(const MyApp());

  runApp(buildApp(routes: routesMap));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // return buildApp(routes: routesMap);
    
    return MaterialApp(
      title: 'Fluttr Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const MB.MyHomePage(title: 'Home'),
      initialRoute: 'Home',
      routes: {
        'Home': (BuildContext context) => MyHomePage(title: "Home", routes: routesMap,),
        ...routesMap
      },
      navigatorObservers: [NavRouteServer.server(context)],
    );
  }
}
