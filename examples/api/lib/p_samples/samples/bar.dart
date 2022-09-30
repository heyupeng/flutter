import 'dart:developer';
import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:flutter_api_samples/material/app_bar/app_bar.0.dart' as app_bar_0;
import 'package:flutter_api_samples/material/app_bar/app_bar.1.dart' as app_bar_1;
import 'package:flutter_api_samples/material/app_bar/app_bar.2.dart' as app_bar_2;

import 'package:flutter_api_samples/material/app_bar/sliver_app_bar.1.dart' as sliver_app_bar_1;
import 'package:flutter_api_samples/material/app_bar/sliver_app_bar.2.dart' as sliver_app_bar_2;
import 'package:flutter_api_samples/material/app_bar/sliver_app_bar.3.dart' as sliver_app_bar_3;

import 'package:flutter_api_samples/material/bottom_app_bar/bottom_app_bar.1.dart' as bottom_app_bar_1;

import 'package:flutter_api_samples/material/bottom_navigation_bar/bottom_navigation_bar.0.dart' as bottom_navigation_bar_0;
import 'package:flutter_api_samples/material/bottom_navigation_bar/bottom_navigation_bar.1.dart' as bottom_navigation_bar_1;
import 'package:flutter_api_samples/material/bottom_navigation_bar/bottom_navigation_bar.2.dart' as bottom_navigation_bar_2;

Map<String, WidgetBuilder> routes123 = <String, WidgetBuilder> {
  'app_bar_0': (BuildContext context) => const app_bar_0.AppBarApp(),
  'app_bar_1': (BuildContext context) => const app_bar_1.AppBarApp(),
  'app_bar_2': (BuildContext context) => const app_bar_2.AppBarApp(),

  'sliver_app_bar_1': (BuildContext context) => const sliver_app_bar_1.AppBarApp(),
  'sliver_app_bar_2': (BuildContext context) => const sliver_app_bar_2.AppBarMediumApp(),
  'sliver_app_bar_3': (BuildContext context) => const sliver_app_bar_3.AppBarLargeApp() ,

  'bottom_app_bar_1': (context) => const bottom_app_bar_1.BottomAppBarDemo(),

  'bottom_navigation_bar_0': (context) => const bottom_navigation_bar_0.MyApp(),
  'bottom_navigation_bar_1': (context) => const bottom_navigation_bar_1.MyApp(),
  'bottom_navigation_bar_2': (context) => const bottom_navigation_bar_2.MyApp(),
};

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
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
      ),
      home: const MyHomePage(title: 'Bar Home'),
      initialRoute: 'Home',
      routes: {
        'Home': (BuildContext context) => MyHomePage(title: "Home"),
        ...routes123
      }
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int _selectedIndex = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  void _bottomBarTappedForItem(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
        
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child:  ListView(
          children: 
          routes123.keys.map
          ((String e) => ListTile(title: Text(e), onTap: () => {
            
            Navigator.of(context).pushNamed(e)
          },))
          .toList()
        )
      ),
    );
  }
}



