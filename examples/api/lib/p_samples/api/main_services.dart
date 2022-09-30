import 'package:flutter/material.dart';
import 'main_base.dart' as MB;

import '../../services/keyboard_key/logical_keyboard_key.0.dart' as logical_keyboard_key;
import '../../services/keyboard_key/physical_keyboard_key.0.dart' as physical_keyboard_key;
import '../../services/mouse_cursor/mouse_cursor.0.dart' as mouse_cursor;
import '../../services/system_chrome/system_chrome.set_system_u_i_overlay_style.1.dart' as system_chrome_set_system_ui_overlay_style;

Map<String, WidgetBuilder> routesMap = {
  'mouse_cursor':(context) => const mouse_cursor.MyApp()  ,
  'physical_keyboard_key':(context) => const physical_keyboard_key.KeyExampleApp(),
  'logical_keyboard_key':(context) => const logical_keyboard_key.KeyExampleApp(),
  'system_chrome_set_system_ui_overlay_style':(context) => const system_chrome_set_system_ui_overlay_style.MyApp(),

};

void main() {
  // runApp(MyApp());
  runApp(MB.MyApp(routes: routesMap));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MB.MyApp(routes: routesMap);
  }
}
