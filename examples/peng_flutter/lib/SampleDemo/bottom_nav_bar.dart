import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';

// Custom

void main() {
  runApp(const BottomNavBarDemoApp());
}

class BottomNavBarDemoApp extends StatelessWidget {
  const BottomNavBarDemoApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bottom Nav Bar Demo',
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
      home: const BottomNavBarPage(title: 'BottomNavBar Page'),
    );
  }
}

class BottomNavBarPage extends StatefulWidget {
  const BottomNavBarPage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<BottomNavBarPage> createState() => _BottomNavBarPageState();
}

class _BottomNavBarPageState extends State<BottomNavBarPage> {
  static int _selectedIndex = 0;
  static Map<int, Widget> _innerWidgets = {};

  final _items = const <BottomNavigationBarItem>[
    BottomNavigationBarItem(label: "Play", tooltip: "Play", icon: Icon(Icons.play_arrow)),
    BottomNavigationBarItem(label: "Stop", tooltip: "Stop", icon: Icon(Icons.stop)),
    BottomNavigationBarItem(label: "Refresh", tooltip: "Refresh", icon: Icon(Icons.refresh))
  ];
        
  @override
  void initState() {
    // TODO: implement initState
    print("1");
  }

  void _bottomBarTappedForItem(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _buildBottomBarCurrentWidget(int selectedIndex) {
    if (_innerWidgets.containsKey(selectedIndex)) {
      // Widget widget = _innerWidgets[selectedIndex]!;
      // return widget;
    }

    Widget widget = Text("Selected Index $selectedIndex : " +  _items[selectedIndex].label!, style: const TextStyle(fontSize: 15,fontWeight: FontWeight.bold),);
    if (selectedIndex == 1) {
      // widget = const ListViewPage(title: "ListView Demo");
    } else {
      // widget = const HelloWorldPage(title: "Hello Word Demo");
    }
    
    _innerWidgets[selectedIndex] = widget;
    return widget;
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    AppBar? appBar;
    if (widget.title.isNotEmpty) {
      appBar = AppBar(
        // Here we take the value from the BottomNavBarPage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      );
    }
    return Scaffold(
      appBar: appBar,
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: _buildBottomBarCurrentWidget(_selectedIndex)
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: _items,
        backgroundColor: Colors.blue,
        fixedColor: Colors.black,
        unselectedItemColor: Colors.white,
        onTap: _bottomBarTappedForItem,
        currentIndex: _selectedIndex,
      ) ,
    );
  }
}