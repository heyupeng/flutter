import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:peng_flutter/base/app_base.dart';
import 'package:peng_flutter/examples_demo.dart';
import 'package:peng_flutter/pages/history_page.dart';
import 'package:peng_flutter/pages/settings_page.dart';

import 'SampleDemo/ListViewDemo.dart';
import './p_samples/main.dart' as samples;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
      home: 0 == 0 ? buildTabApp() : const ExampleListPage(),
    );
  }

  buildTabApp() {
    return 
    BaseApp(
      child: 
        TabPage(
          children: [
            MyHomePage(title: 'title', routes: 
            {
              ...samples.homeRoutes,
              'dev': (context) => const ExampleListPage(), 
            },), 
            HistroyPage(title: 'History'),
            SettingsPage(title: 'Settings',)
          ],
          items: const [
            TabBarItem(text: 'Home', icon: Icon(Icons.home), tooltip: 'home'),
            TabBarItem(text: 'history', icon: Icon(Icons.history), tooltip: 'history'),
            TabBarItem(text: 'Settings', icon: Icon(Icons.settings), tooltip: 'settings'),
          ]
        )
      , 
    )
    ;
  }
}




