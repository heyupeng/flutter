import 'dart:io';

import 'package:flutter/material.dart';

import 'package:flutter_api_samples/cupertino/activity_indicator/cupertino_activity_indicator.0.dart' as cupertino_activity_indicator_0;
import 'package:flutter_api_samples/cupertino/bottom_tab_bar/cupertino_tab_bar.0.dart' as cupertino_tab_bar_0;
import 'package:flutter_api_samples/cupertino/button/cupertino_button.0.dart' as cupertino_button_0;
import 'package:flutter_api_samples/cupertino/context_menu/cupertino_context_menu.0.dart' as cupertino_context_menu_0;
import 'package:flutter_api_samples/cupertino/date_picker/cupertino_date_picker.0.dart' as cupertino_date_picker_0;
import 'package:flutter_api_samples/cupertino/date_picker/cupertino_timer_picker.0.dart' as cupertino_timer_picker_0;
import 'package:flutter_api_samples/cupertino/dialog/cupertino_action_sheet.0.dart' as cupertino_action_sheet_0;
import 'package:flutter_api_samples/cupertino/dialog/cupertino_alert_dialog.0.dart' as cupertino_alert_dialog_0;
import 'package:flutter_api_samples/cupertino/form_row/cupertino_form_row.0.dart' as cupertino_form_row_0;
import 'package:flutter_api_samples/cupertino/nav_bar/cupertino_navigation_bar.0.dart' as cupertino_navigation_bar_0;
import 'package:flutter_api_samples/cupertino/nav_bar/cupertino_sliver_nav_bar.0.dart' as cupertino_sliver_nav_bar_0;
import 'package:flutter_api_samples/cupertino/page_scaffold/cupertino_page_scaffold.0.dart' as cupertino_page_scaffold_0;
import 'package:flutter_api_samples/cupertino/picker/cupertino_picker.0.dart' as cupertino_picker_0;
import 'package:flutter_api_samples/cupertino/refresh/cupertino_sliver_refresh_control.0.dart' as cupertino_sliver_refresh_control_0;
import 'package:flutter_api_samples/cupertino/route/show_cupertino_dialog.0.dart' as show_cupertino_dialog_0;
import 'package:flutter_api_samples/cupertino/route/show_cupertino_modal_popup.0.dart' as show_cupertino_modal_popup_0;
import 'package:flutter_api_samples/cupertino/scrollbar/cupertino_scrollbar.0.dart' as cupertino_scrollbar_0;
import 'package:flutter_api_samples/cupertino/scrollbar/cupertino_scrollbar.1.dart' as cupertino_scrollbar_1;
import 'package:flutter_api_samples/cupertino/search_field/cupertino_search_field.0.dart' as cupertino_search_field_0;
import 'package:flutter_api_samples/cupertino/search_field/cupertino_search_field.1.dart' as cupertino_search_field_1;
import 'package:flutter_api_samples/cupertino/segmented_control/cupertino_segmented_control.0.dart' as cupertino_segmented_control_0;
import 'package:flutter_api_samples/cupertino/segmented_control/cupertino_sliding_segmented_control.0.dart' as cupertino_sliding_segmented_control_0;
import 'package:flutter_api_samples/cupertino/slider/cupertino_slider.0.dart' as cupertino_slider_0;
import 'package:flutter_api_samples/cupertino/switch/cupertino_switch.0.dart' as cupertino_switch_0;
import 'package:flutter_api_samples/cupertino/tab_scaffold/cupertino_tab_controller.0.dart' as cupertino_tab_controller_0;
import 'package:flutter_api_samples/cupertino/tab_scaffold/cupertino_tab_scaffold.0.dart' as cupertino_tab_scaffold_0;
import 'package:flutter_api_samples/cupertino/text_field/cupertino_text_field.0.dart' as cupertino_text_field_0;
import 'package:flutter_api_samples/cupertino/text_form_field_row/cupertino_text_form_field_row.1.dart' as cupertino_text_form_field_row_1;

import '../common/navigator_observer.dart';
import 'main_base.dart' as MB;

Map<String, WidgetBuilder> routesMap = <String, WidgetBuilder> {
  'activity_indicator_0': (context) => const cupertino_activity_indicator_0.CupertinoIndicatorApp(),
  'tab_bar_0': (context) => const cupertino_tab_bar_0.CupertinoTabBarApp(),
  'button_0': (context) => const cupertino_button_0.CupertinoButtonApp(),
  'context_menu_0': (context) => const cupertino_context_menu_0.ContextMenuApp(),
  'date_picker_0': (context) => const cupertino_date_picker_0.DatePickerApp(),
  'timer_picker_0': (context) => const cupertino_timer_picker_0.TimerPickerApp(),
  'action_sheet_0': (context) => const cupertino_action_sheet_0.ActionSheetApp(),
  'alert_dialog_0': (context) => const cupertino_alert_dialog_0.AlertDialogApp(),
  'form_row_0': (context) => const cupertino_form_row_0.CupertinoFormRowApp(),
  'navigation_bar_0': (context) => const cupertino_navigation_bar_0.NavBarApp(),
  'sliver_nav_bar_0': (context) => const cupertino_sliver_nav_bar_0.SliverNavBarApp(),
  'page_scaffold_0': (context) => const cupertino_page_scaffold_0.PageScaffoldApp(),
  'picker_0': (context) => const cupertino_picker_0.CupertinoPickerApp(),
  'sliver_refresh_control_0': (context) => const cupertino_sliver_refresh_control_0.RefreshControlApp(),
  'tino_dialog_0': (context) => const show_cupertino_dialog_0.CupertinoDialogApp(),
  'tino_modal_popup_0': (context) => const show_cupertino_modal_popup_0.ModalPopupApp(),
  'scrollbar_0': (context) => const cupertino_scrollbar_0.ScrollbarApp(),
  'scrollbar_1': (context) => const cupertino_scrollbar_1.ScrollbarApp(),
  'search_field_0': (context) => const cupertino_search_field_0.SearchTextFieldApp(),
  'search_field_1': (context) => const cupertino_search_field_1.SearchTextFieldApp(),
  'segmented_control_0': (context) => const cupertino_segmented_control_0.SegmentedControlApp(),
  'sliding_segmented_control_0': (context) => const cupertino_sliding_segmented_control_0.SegmentedControlApp(),
  'slider_0': (context) => const cupertino_slider_0.CupertinoSliderApp(),
  'switch_0': (context) => const cupertino_switch_0.CupertinoSwitchApp(),
  'tab_controller_0': (context) => const cupertino_tab_controller_0.TabControllerApp(),
  'tab_scaffold_0': (context) => const cupertino_tab_scaffold_0.TabScaffoldApp(),
  'text_field_0': (context) => const cupertino_text_field_0.CupertinoTextFieldApp(),
  'text_form_field_row_1': (context) => const cupertino_text_form_field_row_1.FormSectionApp(),
};

void main() {
  runApp(const MyApp());

  runApp(MB.MyApp(routes: routesMap));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MB.MyApp(routes: routesMap);
    
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
        ...routesMap
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
  Widget buildAppBarTitle(BuildContext context) {
    // return Autocomplete(optionsBuilder: (textEditingValue) {
    //   if (textEditingValue.text == null || textEditingValue.text == '') {
    //     return routes123.keys;
    //   }
    //   return routes123.keys.where((element) => element.contains(textEditingValue.text));
    // },);
    return Padding(padding: EdgeInsets.symmetric(vertical: 13, horizontal: 15),
      child: TextField(
        cursorColor: Colors.orange,
        decoration: const InputDecoration(
          icon: Icon(Icons.search, color: Colors.white,),
          contentPadding: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
          border: OutlineInputBorder(borderSide: BorderSide(width: 30,)),
          // fillColor: Colors.red,
          // focusColor: Colors.orange,
          // hoverColor: Colors.green,
          // iconColor: Colors.yellow,
          hintText: 'list',
        ),
        onChanged: (String value) => {
          setState(() {
            _componentKey = value;  
          })
        },
      )
    )
      
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
        title: this.buildAppBarTitle(context),
      ),
        
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child:  ListView(
          controller: ScrollController(),
          children: 
          routesMap.keys.where((element) => element.contains(_componentKey)).map
          ((String title) => ListTile(title: Text(title), onTap: () {
            _onTap(title, arguments: 'cupertino');
          },))
          .toList(),
        )
      ),
    );
  }



  void _onTap(String title, {Object? arguments}) {
    Route route = MaterialPageRoute<bool>(builder: routesMap[title]!, 
      settings: RouteSettings(name: title, arguments: arguments));
    Navigator.of(context).push(route);
  }

  void goback(BuildContext context) {
    /* goback */
    var currtenRoute = ModalRoute.of(context);
    final bool first = currtenRoute?.isFirst ?? true;
    Navigator.of(context, rootNavigator: first).pop();
  }

}



