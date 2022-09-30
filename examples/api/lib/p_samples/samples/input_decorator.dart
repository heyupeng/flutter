import 'dart:developer';
import 'dart:ffi';
import 'dart:io';
import 'dart:async';

import 'package:flutter/material.dart';

/* */
import '../../material/input_decorator/input_decoration.0.dart' as input_decoration_0;
import '../../material/input_decorator/input_decoration.1.dart' as input_decoration_1;
import '../../material/input_decorator/input_decoration.2.dart' as input_decoration_2;
import '../../material/input_decorator/input_decoration.3.dart' as input_decoration_3;
import '../../material/input_decorator/input_decoration.floating_label_style_error.0.dart' as input_decoration_floating_label_style_error_0;
import '../../material/input_decorator/input_decoration.label.0.dart' as input_decoration_label_0;
import '../../material/input_decorator/input_decoration.label_style_error.0.dart' as input_decoration_label_style_error_0;
import '../../material/input_decorator/input_decoration.material_state.0.dart' as input_decoration_material_state_0;
import '../../material/input_decorator/input_decoration.material_state.1.dart' as input_decoration_material_state_1;
import '../../material/input_decorator/input_decoration.prefix_icon.0.dart' as input_decoration_prefix_icon_0;
import '../../material/input_decorator/input_decoration.prefix_icon_constraints.0.dart' as input_decoration_prefix_icon_constraints_0;
import '../../material/input_decorator/input_decoration.suffix_icon.0.dart' as input_decoration_suffix_icon_0;
import '../../material/input_decorator/input_decoration.suffix_icon_constraints.0.dart' as input_decoration_suffix_icon_constraints_0;

Map<String, WidgetBuilder> builderMap = <String, WidgetBuilder> {
  'input_decoration_0':(BuildContext context) => const input_decoration_0.MyStatelessWidget(),
  'input_decoration_1':(BuildContext context) => const input_decoration_1.MyStatelessWidget(),
  'input_decoration_2':(BuildContext context) => const input_decoration_2.MyStatelessWidget(),
  'input_decoration_3':(BuildContext context) => const input_decoration_3.MyStatelessWidget(),
  'input_decoration_floating_label_style_error_0':(BuildContext context) => const input_decoration_floating_label_style_error_0.InputDecoratorExample(),
  'input_decoration_label_0':(BuildContext context) => const input_decoration_label_0.MyStatelessWidget(),
  'input_decoration_label_style_error_0':(BuildContext context) => const input_decoration_label_style_error_0.InputDecoratorExample(),
  'input_decoration_material_state_0':(BuildContext context) => const input_decoration_material_state_0.MyStatelessWidget(),
  'input_decoration_material_state_1':(BuildContext context) => const input_decoration_material_state_1.MyStatelessWidget(),
  'input_decoration_prefix_icon_0':(BuildContext context) => const input_decoration_prefix_icon_0.InputDecoratorExample(),
  'input_decoration_prefix_icon_constraints_0':(BuildContext context) => const input_decoration_prefix_icon_constraints_0.MyStatelessWidget(),
  'input_decoration_suffix_icon_0':(BuildContext context) => const input_decoration_suffix_icon_0.InputDecoratorExample(),
  'input_decoration_suffix_icon_constraints_0':(BuildContext context) => const input_decoration_suffix_icon_constraints_0.MyStatelessWidget(),
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
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Input Decoration'),
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
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
        
      body: Center(
        child:  ListView(
          children: 
          builderMap.keys.map((key) {
            return buildListItem(context, key);
          } )
          .toList()
        )
      ),
    );
  }

  Widget buildListItem(BuildContext context, String key) {
    WidgetBuilder? builder = builderMap[key];       
    return 
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10), 
        child: Column(children: [
          Text(key),
          builder!(context)
        ],),
      )
    ;
  }
}



