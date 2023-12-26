import 'package:flutter/material.dart';
import 'package:peng_flutter/base/app_base.dart';

import './lib/widgets.dart';

void main() {
  // runApp(MyApp());
  runApp(buildApp(routes: routesMap));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return buildApp(routes: routesMap, title: 'widgets');
  }
}
