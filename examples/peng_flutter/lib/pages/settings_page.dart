// ignore_for_file: non_constant_identifier_names

import 'dart:async';
import 'dart:developer';
import 'dart:ffi';
import 'dart:io';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_examples_layers/widgets/spinning_mixed.dart';
import 'package:peng_flutter/common/file_storage.dart';
import 'package:peng_flutter/pages/webview_page.dart';

// import 'package:path/path.dart';
import 'package:http/http.dart' as http;
import 'package:peng_flutter/common/http/http_io.dart';

import '../common/navigator_observer.dart';
import '../components/components.dart';

void main() {
  runApp(const SettingsApp(routes: {},));
  
}

extension WidgetBackground on Widget {
  R withBackground< R>(R Function(Widget sender) builder)  {
    return builder(this);
  }
}

Widget buildApp({Key? key,
  Map<String, WidgetBuilder> routes = const <String, WidgetBuilder>{},
  String title = 'Flutter',
  }) {
  return SettingsApp(key: key, routes: routes, title: title);
}

class SettingsApp extends StatelessWidget {
  const SettingsApp({ 
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
    ThemeData theme = Theme.of(context);
    
    return MaterialApp(
      title: title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: child ??  SettingsPage(title: title),
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

class ListItemModel {
  ListItemModel({
    this.title = '', 
    this.subtitle = '',
    this.index = -1,
  });

  String title;
  String subtitle;
  int index;
  dynamic value;

  // extension
  String Function()? subtitleGetter; 

  void Function(dynamic value)? trailingAction;

  T config<T>( T Function(ListItemModel item) setter) => setter(this);
}

class SettingsPage extends StatefulWidget {  
  const SettingsPage({
    Key? key, required this.title
  }) : super(key: key);

  final String title;

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  final ScrollController _scrollController = ScrollController(
    onAttach: (ScrollPosition position) {
      // print('Scroll attach: ${position}');
    }, onDetach: (position) {
      // print('Scroll detach: ${position}');
    },
  );
  final XHttpServer localServer = XHttpServer();

  @override
  void initState() {
    super.initState();

    samList = List.generate(10, (index) => ListItemModel(index: index) );

    samList[0].config((item) {
      item.title = '开启指示器';
      item.value = MapFileStorage.share.get(key: 'gesturetrack', defaultValue: true);
      item.trailingAction = ((value) {
        item.value = value;
        MapFileStorage.share.get(key: 'gesturetrack', defaultValue: value);
        GestureIndicator.track(value);
        setState(() { });
      });
    });

    samList[1].config((item) {
      item.title = '开启本地服务';
      item.value ??= localServer.isOpening;
      item.subtitleGetter = () { 
        return localServer.host + ':${localServer.port}'; 
        };
      item.trailingAction = ((value) {
        item.value = value; 
        setState(() {});
        openServer(item);
      });
    });
  }
  
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
  }

  List<ListItemModel> samList = [];

  @override
  Widget build(BuildContext context) {
    double height = 60;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      
      body: Stack(
        children:[
          Scrollbar(
          controller: _scrollController,
          child:  
          ListView.builder(
            controller: _scrollController,
            itemCount: samList.length,
            itemBuilder: listItemBuilder
          ),
          )
        ],         
      ),
    );
  }

  Widget listItemBuilder(context, index) {
    var item = samList[index];
    WidgetBuilder? builder;
    if (index == 0 || index == 1)  {
      var themeData = Theme.of(context);
      final ColorScheme colorScheme = themeData.colorScheme;
      Color textColor = colorScheme.brightness ==Brightness.light ? Colors.black : themeData.primaryColor;
      textColor = textColor.withOpacity(item.value == true ? 1: 0.5);

      String subtitle = item.subtitleGetter != null ? item.subtitleGetter!() : item.subtitle;
      Widget tralling = Switch(value: item.value, onChanged: item.trailingAction);
      return
      ListTile(
        title: Text(item.title, style: TextStyle(color: textColor),),
        style: ListTileStyle.list,
        trailing: tralling,
        subtitle: subtitle.isEmpty ? null : Text(subtitle),
        // onTap: onTap
      )
      .withBackground((sender) => Container(
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.withOpacity(0.3) )  
        ),
        child: sender,
        )
      )
      ;
    }
    return 
      HoListCell( 
        title: '${item.index}',
        onTap: () {
          _onTap(index);
        },
        builder: builder,
      )
      ;
  }

  void _onTap(int index ) async {
    index -= 1;
    switch (index) {
      case 1:
        var path = '/dart';
        var urlstr = '127.0.0.1:8888' + path;
        getUrl(urlstr);
        break;
      case 2:
        var path = '/data.json';
        var urlstr = 'localhost:8888' + path;
        
        getUrl(urlstr);
        break;
      case 3: 
          var url = Uri.https('example.com', 'whatsit/create');
          var response = await http.post(url, body: {'name': 'doodle', 'color': 'blue'});
          print('1. Response status: ${response.statusCode}');
          print('2. Response body: ${response.body}');

          // print(await http.read(Uri.https('example.com', 'foobar.txt')));
    break;
    
      default:
    }

    // var client = HttpClient();
    // HttpClientRequest request = await client.get('localhost', 80, '/file.txt');
    // request.headers.contentType =
    //     ContentType('application', 'json', charset: 'utf-8');
    // request.write('text content👍🎯'); // Strings written will be UTF-8 encoded.
  
  // If no charset is provided the default of ISO-8859-1 (Latin 1) is used.
    // var client = HttpClient();
    // HttpClientRequest request = await client.get('localhost', 80, '/file.txt');
    // request.headers.add(HttpHeaders.contentTypeHeader, "text/plain");
    // request.write('blåbærgrød');
  }

  void openServer(ListItemModel item) {
    if (item.value == false) {
        localServer.close().then((socket) {
        });
      } else {
        showCupertinoDialog1(context, "", (index, values) {
          if (index == 0) {
            item.value = false;
            setState(() {});
          }
          else {
            localServer.open(
              host: values[0] as String, port: int.parse(values[1]),
              completion: (isOpening) {
                showTipDialog('已开启服务。', '');
                setState(() {});
              } ,
              onError: (socketException) {
                item.value = false;
                setState(() {});
                showTipDialog('提示', socketException.osError!.message);
                return;
              },
            )
            .then((value){
              item.value = localServer.isOpening;
              setState(() {});
              if (value == 0) showTipDialog("已关闭服务","");
            });
          }
                
         });
      }
  }

  void getUrl(String urlstr, {
    // String unencodedPath = '',
    // Map<String, dynamic>? queryParameters,
    void Function(Object data)? onSuccess, 
    void Function(int code)? onError,
    }
  ) {
    XHttpClient.get(urlstr).then((response) {  
      debugPrint('Response ${response.statusCode}: ${response.body}');
      if (response.statusCode != HttpStatus.ok) {
        onError?.call(response.statusCode);
        return;
      }

      dynamic object = response.body;
      try {
        var jsonObject = json.decode(object);
        debugPrint('jsonObject type: ${jsonObject.runtimeType}');
        showTipDialog('', '$jsonObject');
        
        onSuccess?.call(jsonObject);
      } catch (e) {
        debugPrint('json can\'t decode this string, it is a string object.');
        showTipDialog('', '$object');
        onSuccess?.call(object);
      }
      finally {
        
      }
    });
  }

  void showTipDialog(String title, String message) {
    showDialog(
      context: this.context, 
      barrierColor: Colors.black.withOpacity(0.3),
      builder: (context) =>
      CupertinoAlertDialog
        (
          title: title.length > 1 ? Text(title) : null,
          content: message.length > 1 ? Text(message) : null,
        )
    )
    .then((value) {
      print('1: $value');
    });
  }

  void showCupertinoDialog1(BuildContext context, 
    String title, void Function(int index, List<String> texts)callback
  ) {
    var host = localServer.host;
    var port = localServer.port;
    showCupertinoDialog(context: context, builder: (context) {
      return
        CupertinoAlertDialog(
        title: Text(title),
        content: Column(
          children: [ 
             Material(
            child: 
          TextFormField(
            keyboardType: TextInputType.url,
            controller: TextEditingController(text: '$host', ),
            decoration: const InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 10)),
            onChanged: ((value) {
              host = value;
            }),
            ),
          ),
          Material(
            child: 
          TextFormField(
            keyboardType: TextInputType.url,
            controller: TextEditingController(text: '$port', ),
            decoration: const InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 10)),
            onChanged: ((value) {
              port = int.parse(value);
            }),
            ),
          ),
          ],
        ),
        actions: [
          CupertinoDialogAction(
            onPressed: (() {
              Navigator.of(context).pop();
              callback(0, [host, '$port']);
            }), 
            child: const Text('取消')
          ),
          CupertinoDialogAction(onPressed: (() {
            Navigator.of(context).pop();
            callback(1, [host, '$port']);
          }), child: const Text('确定'))
        ],
        );
    });
  }
}