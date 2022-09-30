import 'dart:async';
import 'dart:developer';
import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:material_color_utilities/utils/math_utils.dart';

import '../common/navigator_observer.dart';

void main() {
  runApp(const MyApp(routes: {},));
}

Map<String, WidgetBuilder> routesMap = {};

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.routes}) : super(key: key);

  final Map<String, WidgetBuilder> routes;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    routesMap = routes;
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
      home: const MyHomePage(title: 'Home'),
      initialRoute: 'Home',
      routes: {
        'Home': (BuildContext context) => MyHomePage(title: "Home"),
        // ...routesMap
      },
      navigatorObservers: [NavRouteServer.server(context)],

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
  String _componentKey = '';

  // Widget buildSearchField(BuildContext context, void Function(TextEditingValue?)? onChanged) {
  //   return Autocomplete(optionsBuilder: (textEditingValue) {
  //     if (textEditingValue.text == null || textEditingValue.text == '') {
  //       return routesMap.keys;
  //     }
  //     return routesMap.keys.where((element) => element.contains(textEditingValue.text));
  //   },);
  // }

  final ScrollController _scrollController = ScrollController();

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
        title: 
          searchFieldBuilder(context, (String value) => {
            setState(() {
              _componentKey = value;
            })
          }),
      ),
        
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Scrollbar(
          child:  ListView(
            controller: _scrollController,
            children: 
            routesMap.keys.where((element) => element.contains(_componentKey))
              .map((String title) => listItemBuilder(context, title, onTap: () {
                _onTap(title, arguments: 'arguments');
              })
            )
            .toList()
          )
        ),
      ),
    );
  }
  
  void _onTap(String title, {Object? arguments}) {
    Route route = MaterialPageRoute<bool>(
      builder: routesMap[title]!, 
      settings: RouteSettings(name: title, arguments: arguments));
    Navigator.of(context).push(route);
  }
  
}

Widget searchFieldBuilder(BuildContext context, void Function(String)? onChanged) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 15),
    child: Theme(data: ThemeData(
      colorScheme:  ColorScheme.dark(primary: Colors.white.withAlpha((255*0.2).ceil())),
        hintColor: Colors.white,
        focusColor: Colors.green,
      ),
      child:
        TextField(
          cursorColor: Colors.white,
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.search, color: Colors.white, size: 20,),
            contentPadding: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
            border: OutlineInputBorder(borderSide: BorderSide(width: 30,)),
            // fillColor: Colors.red,
            // focusColor: Colors.orange,
            // hoverColor: Colors.green,
            // iconColor: Colors.yellow,
            hintText: 'Search',
            hintStyle: TextStyle(textBaseline: TextBaseline.alphabetic),
          ),
          onChanged: onChanged,
        )
      )
    )
    ;
  }

Widget listItemBuilder(BuildContext context, String title, {bool showIndicator = true, GestureTapCallback? onTap}) {
  return 
  Padding(
    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
    child: Container(
      // color: Colors.red,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.withAlpha((255*0.3).ceil()) )
      ),
      child: 
        ListTile(title: Text(title), 
          style: ListTileStyle.list,
          trailing: showIndicator ? buildIndicator() : null,
          onTap: onTap
        ),
      ),
  )
  ;
}

Widget buildIndicator() {
  return Container(
    width: 15, height: 15,
    alignment: Alignment.center,
    transformAlignment: Alignment.center,
    // transform:  Matrix4.rotationZ(3.14 * 1.0/4),
    // decoration: const ShapeDecoration(
    //   shape: Border(
    //     right: BorderSide(color: Colors.grey, width: 1.5),
    //     top: BorderSide(color: Colors.grey, width: 1.5)
    //   ),
    // ),
    transform:  Matrix4.rotationZ(3.14 * 1.0),
    child: const Icon(Icons.arrow_back_ios_new, size: 15,color: Colors.grey,),
  )
  ;
}



