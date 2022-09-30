import 'dart:developer';
import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';

import '../../material/scaffold/scaffold.0.dart' as scaffold_0;
import '../../material/scaffold/scaffold.1.dart' as scaffold_1;
import '../../material/scaffold/scaffold.2.dart' as scaffold_2;
import '../../material/scaffold/scaffold.drawer.0.dart' as scaffold_drawer_0;
import '../../material/scaffold/scaffold.end_drawer.0.dart' as scaffold_end_drawer_0;
import '../../material/scaffold/scaffold.of.0.dart' as scaffold_of_0;
import '../../material/scaffold/scaffold.of.1.dart' as scaffold_of_1;
import '../../material/scaffold/scaffold_messenger.0.dart' as scaffold_messenger_0;
import '../../material/scaffold/scaffold_messenger.of.0.dart' as scaffold_messenger_of_0;
import '../../material/scaffold/scaffold_messenger.of.1.dart' as scaffold_messenger_of_1;
import '../../material/scaffold/scaffold_messenger_state.show_material_banner.0.dart' as scaffold_messenger_state_show_material_banner_0;
import '../../material/scaffold/scaffold_messenger_state.show_snack_bar.0.dart' as scaffold_messenger_state_show_snack_bar_0;
import '../../material/scaffold/scaffold_state.show_bottom_sheet.0.dart' as scaffold_state_show_bottom_sheet_0;
import '../../material/scaffold/scaffold_state.show_snack_bar.0.dart' as scaffold_state_show_snack_bar_0;

Map<String, WidgetBuilder> builderMap = <String, WidgetBuilder> {
  'scaffold_0': (context) => scaffold_0.MyApp(),
  'scaffold_1': (context) => scaffold_1.MyApp(),
  'scaffold_2': (context) => scaffold_2.MyApp(),
  'scaffold_of_0': (context) => scaffold_of_0.MyApp(),
  'scaffold_of_1': (context) => scaffold_of_1.MyApp(),
  'scaffold_drawer_0': (context) => scaffold_drawer_0.MyApp(),
  'scaffold_end_drawer_0': (context) => scaffold_end_drawer_0.MyApp(),
  'scaffold_messenger_0': (context) => scaffold_messenger_0.MyApp(),
  'scaffold_messenger_of_0': (context) => scaffold_messenger_of_0.MyApp(),
  'scaffold_messenger_of_1': (context) => scaffold_messenger_of_1.MyApp(),
  'scaffold_messenger_state_show_snack_bar_0': (context) => scaffold_messenger_state_show_snack_bar_0.MyApp(),
  'scaffold_messenger_state_show_material_banner_0': (context) => scaffold_messenger_state_show_material_banner_0.MyApp(),
  'scaffold_state_show_snack_bar_0': (context) => scaffold_state_show_snack_bar_0.MyApp(),
  'scaffold_state_show_bottom_sheet_0': (context) => scaffold_state_show_bottom_sheet_0.MyApp(),

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
        ...builderMap
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
          builderMap.keys.map
          ((String e) => ListTile(title: Text(e), onTap: () => {
            Navigator.of(context).pushNamed(e)
          },))
          .toList()
        )
      ),
    );
  }
}



