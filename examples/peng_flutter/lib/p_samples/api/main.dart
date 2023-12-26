import 'package:flutter/material.dart';
import 'package:peng_flutter/base/app_base.dart';

import 'main_cupertino.dart' as main_cupertino;
import 'main_material.dart' as main_material;
import 'main_services.dart' as main_services;
import 'main_widgets.dart' as main_widgets;

import './lib/painting.dart' as painting;
import './lib/rendering.dart' as rendering;
import './lib/ui.dart' as ui;
import './lib/gestures.dart' as gestures;


void main() {
  // runApp(MyApp());
  runApp(const MyApp());
}

class UIApp extends StatelessWidget {
  const UIApp({Key? key, }) : super(key: key);
  final String title = 'UI';

  @override
  Widget build(BuildContext context) {
    return buildApp(routes: ui.routesMap, title: title);
  }
}

class PaintingApp extends StatelessWidget {
  const PaintingApp({Key? key}) : super(key: key);
  final String title = 'Painting';

  @override
  Widget build(BuildContext context) {
    return buildApp(routes: painting.routesMap, title: title);
  }
}

class RenderingApp extends StatelessWidget {
  const RenderingApp({Key? key}) : super(key: key);
  final String title = 'Rendering';

  @override
  Widget build(BuildContext context) {
    return buildApp(routes: rendering.routesMap, title: title);
  }
}

Map<String, WidgetBuilder> routesMap = <String, WidgetBuilder> {
  'material':(BuildContext context) => const main_material.MyApp(), //.MyHomePage(title: 'material'),
  'widgets':(BuildContext context) => const main_widgets.MyApp(),//.MyHomePage(title: 'widgets'),
  'cupertino':(BuildContext context) => const main_cupertino.MyApp(), //.MyHomePage(title: 'cupertino'),
  'services':(context) => const main_services.MyApp(),
  'ui': (BuildContext context) => const UIApp(),
  'paint': (BuildContext context) => const PaintingApp(),
  'render': (BuildContext context) => const RenderingApp(),
  'gestures': (BuildContext context) => buildApp(routes: gestures.routesMap),
};

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  final String title = 'API';

  @override
  Widget build(BuildContext context) {
    return buildApp(routes: routesMap, title: title);
  }
}
