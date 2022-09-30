import 'dart:async';
import 'dart:developer';
import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'common/navigator_observer.dart';

import 'api/main_base.dart' as main_base;

import 'api/main_material.dart' as main_material;
import 'api/main_widgets.dart' as main_widgets;
import 'api/main_cupertino.dart' as main_cupertino;
import 'api/main_services.dart' as main_services;

Map<String, WidgetBuilder> routesMap = <String, WidgetBuilder> {
  'material':(BuildContext context) => const main_material.MyApp(), //.MyHomePage(title: 'material'),
  'widgets':(BuildContext context) => const main_widgets.MyApp(),//.MyHomePage(title: 'widgets'),
  'cupertino':(BuildContext context) => const main_cupertino.MyApp(), //.MyHomePage(title: 'cupertino'),
  'services':(context) => const main_services.MyApp(),
};

void main() {
  Future<Directory> directory = Directory('/Users/peng/Desktop/flutter/examples/api/lib/material').create(recursive: true);
  print(directory);
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
      home: const MyTabPage(),
      // initialRoute: 'Home',
      // routes: {
      //   'Home': (BuildContext context) => MyHomePage(title: "Home"),
      //   ...routesMap
      // },
      onGenerateRoute: (RouteSettings settings) {
        log('onGenerateRoute: ${settings.name!}');
        CTM_MaterialPageRoute route = CTM_MaterialPageRoute(builder: routesMap[settings.name]!, settings: settings);
        return route;
      },
      navigatorObservers: [NavRouteServer.shared],
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
  Widget buildAppBarTitle(BuildContext context) {
    // return Autocomplete(optionsBuilder: (textEditingValue) {
    //   if (textEditingValue.text == null || textEditingValue.text == '') {
    //     return routes123.keys;
    //   }
    //   return routes123.keys.where((element) => element.contains(textEditingValue.text));
    // },);
    return main_base.searchFieldBuilder(context, (value){
      setState(() {
        _componentKey = value;  
      });
    })
    ;
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
        title: main_base.searchFieldBuilder(context, (value){
          setState(() {
            _componentKey = value;  
          });
        }),
        leading:  IconButton(
          onPressed: (){
            SystemNavigator.pop(animated: true); 
          },
          icon: const Icon(Icons.home)
          )
      ),
        
      body:
        Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Scrollbar(
            child: ListView(
            controller: ScrollController(),
            children: 
            routesMap.keys.where((String element) => element.contains(_componentKey)).map
            ((String e) => 
              main_base.listItemBuilder(context, e, onTap: () => {
                Navigator.of(context).pushNamed(e, arguments: e)
              },)
            )
            .toList(),
          )
        ),
        )
    );
  }
}

enum TabBarPosition {
  bottom,
  top,
}

class MyTabPage extends StatefulWidget {
  const MyTabPage({super.key});
  
  @override
  State<MyTabPage> createState() => _MyTabPageState();
}

class _MyTabPageState extends State<MyTabPage> with TickerProviderStateMixin {
  int _currentIndex = 0;
  late TabController _tabController;
  TabBarPosition tabPosition = TabBarPosition.bottom;

  void _setupTabController() {
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      if (!_tabController.indexIsChanging) {
      }
      print('Tab index: ${_tabController.index}');
    });
  }

  @override
  void initState() {
    super.initState();
    _setupTabController();
  }

  @override
  Widget build(BuildContext context) {
    return 
    // DefaultTabController(
    //   initialIndex: _currentIndex,
    //   length: tabs.length,
    //   child: 
      Scaffold(
      appBar: 
        tabPosition == TabBarPosition.top ? 
        AppBar(
          title: 
            TabBar(
              controller: _tabController,
              tabs: tabs,
            )
        )
        : null
      ,

      bottomNavigationBar: 
      tabPosition == TabBarPosition.bottom ?
        BottomNavigationBar(
          currentIndex: _tabController.index, // _currentIndex,
          items: bottomNavigationBarItems,
          onTap: (int value) => _changedIndex(value)
        )
        : null
      ,
      
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _tabController,
        children: <Widget>[
          const Center(
            child:  MyHomePage(title: "Home"),
          ),
          const Center(
            child: Text("It's rainy here"),
          ),
          Center( 
            child: 
            ElevatedButton(
              child: Text('switch Tab style'),
              onPressed: () {
                _changeTabbarPosition();
              },
            )
          ),
        ],
      ),
    // ),
    );
  }

  void _changedIndex(int value) {
    print('$value');
    _currentIndex = value;
    _tabController.index = value;
    setState(() {

    });
  }

  void _changeTabbarPosition() {
    tabPosition = tabPosition == TabBarPosition.top ? TabBarPosition.bottom: TabBarPosition.top;
    setState(() {
      
    });
  }
}

const List<Tab> tabs = [
  Tab(text: "One"),
  Tab(text: "Two"),
  Tab(text: "Three"),
];

const List<BottomNavigationBarItem> bottomNavigationBarItems = [
  BottomNavigationBarItem(
    icon: Icon(Icons.home),  
    label: "Home",
    tooltip: "home",
    ),
  BottomNavigationBarItem(
    icon: Icon(Icons.history),  
    label: "History",
    tooltip: "history",
    ),
  BottomNavigationBarItem(
    icon: Icon(Icons.settings),  
    label: "Settings",
    tooltip: "settings",
    ),
];
