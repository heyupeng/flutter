import 'dart:developer';

import 'package:flutter/material.dart';

import '../common/navigator_observer.dart';
import '../components/components.dart';

export '../common/navigator_observer.dart';
export '../components/components.dart';

void main() {
  runApp(const BaseApp(routes: {},));
}

Widget buildApp({Key? key,
  Map<String, WidgetBuilder> routes = const <String, WidgetBuilder>{},
  String title = 'Flutter',
  }) {
  return BaseApp(key: key, routes: routes, title: title);
}

class BaseApp extends StatelessWidget {
  const BaseApp({ 
    Key? key, 
    this.routes = const <String, WidgetBuilder>{}, 
    this.title = 'Flutter',
    this.child,
  }) : super(key: key);

  final String title;
  final Map<String, WidgetBuilder> routes;
  final Widget? child;
  
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      title: title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: child ??  MyHomePage(title: title, routes: routes,),
      // initialRoute: 'Home',
      // routes: {
      //   'Home': (BuildContext context) => MyHomePage(title: 'Home', routes: routes),
      //   // ...routes
      // },
      onGenerateRoute: generateRoute,
      navigatorObservers: [NavRouteServer.server(context)],

    );
  }

  Route generateRoute (RouteSettings settings) {
    log('onGenerateRoute: ${settings.name!}');
    final WidgetBuilder builder = routes[settings.name]!;
    final Route route = CTM_MaterialPageRoute(builder: builder, settings: settings);
    return route;
  }
}

typedef RouteMap = Map<String, Widget Function(BuildContext)>;
const RouteMap RouteMapEmpty = <String, Widget Function(BuildContext)>{};

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title, this.routes = RouteMapEmpty }) : super(key: key);
  final String title;
  final RouteMap routes;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _componentKey = '';

  final ScrollController _scrollController = ScrollController(
    onAttach: (ScrollPosition position) {
      print('Scroll attach: ${position}');
    }, onDetach: (position) {
      print('Scroll detach: ${position}');
    },
  );


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: HoSearchBar( onChanged: _searchBarValueChanged ),
      ),
        
      body: Center(
        child: Scrollbar(
          controller: _scrollController,
          child:  ListView(
            controller: _scrollController,
            children: 
            widget.routes.keys.where((element) => element.contains(_componentKey))
              .map((String title) => 
                HoListCell( title: title, onTap: () => _onTap(title, arguments: widget.title) )
            )
            .toList()
          )
        ),
      ),
    );
  }
  
  void _searchBarValueChanged(String value) {
    setState(() {
      _componentKey = value;
    });
  }

  void _onTap(String title, {Object? arguments}) {

    final Route route = CTM_MaterialPageRoute<bool>(
      builder: widget.routes[title]!, 
      settings: RouteSettings(name: title, arguments: arguments));
    Navigator.of(context).push(route);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    log('${widget.title} didChangeDependencies');
  }

  @override
  void deactivate() {
    super.deactivate();
    log('deactivate');
  }
  
  @override
  void dispose() {
    super.dispose();
    log('dispose');
  }
}

void goback(BuildContext context) {
  /* goback */
  var currtenRoute = ModalRoute.of(context);
  final bool first = currtenRoute?.isFirst ?? true;
  Navigator.of(context, rootNavigator: first).pop();
}
