// ignore_for_file: non_constant_identifier_names

import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'dart:math' as math;

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import '../common/navigator_observer.dart';
import '../components/components.dart';
import '../model/news_model.dart';

void main() {
  runApp(const SettingsApp(routes: {},));
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
      print('Scroll attach: ${position}');
    }, onDetach: (position) {
      print('Scroll detach: ${position}');
    },
  );

  @override
  void initState() {
    super.initState();
  }
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
  }

  List<int> samList = List.generate(10, (index) => index);

  @override
  Widget build(BuildContext context) {

    double height = 60;

    return Scaffold(
      appBar: AppBar(
        
      ),
      
      body: Stack(
        children:[
          Scrollbar(
          controller: _scrollController,
          child:  ListView(
            controller: _scrollController,
            children: 
                samList.map((v) => HoListCell( 
                  title: '$v', 
                  onTap: () {
                    _onTap('title');
                  }
                )
                ).toList()

                // ...widgets,
            )
          ),
        ],         
      ),
    );
  }

  void _onTap(String title ) async {
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
  
    // var url = Uri.https('example.com', 'whatsit/create');
    // var response = await http.post(url, body: {'name': 'doodle', 'color': 'blue'});
    // print('Response status: ${response.statusCode}');
    // print('Response body: ${response.body}');

    // print(await http.read(Uri.https('example.com', 'foobar.txt')));
  }
}

class _ArticleDescription extends StatelessWidget {
  const _ArticleDescription({
    required this.title,
    required this.subtitle,
    required this.author,
    required this.publishDate,
    required this.readDuration,
  });

  final String title;
  final String subtitle;
  final String author;
  final String publishDate;
  final String readDuration;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        const Padding(padding: EdgeInsets.only(bottom: 2.0)),
        // Expanded(
          // child: 
          Text(
            subtitle,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 12.0,
              color: Colors.black54,
            ),
          ),
        // ),
        // Text(
        //   author,
        //   style: const TextStyle(
        //     fontSize: 12.0,
        //     color: Colors.black87,
        //   ),
        // ),
        Spacer(),
        Text(
          '$publishDate - $readDuration',
          style: const TextStyle(
            fontSize: 11.0,
            color: Colors.black54,
          ),
        ),
      ],
    );
  }
}

class CustomListItem extends StatelessWidget {
  const CustomListItem({
    super.key,
    required this.thumbnail,
    required this.title,
    required this.subtitle,
    required this.author,
    required this.publishDate,
    required this.readDuration,
  });

  final Widget thumbnail;
  final String title;
  final String subtitle;
  final String author;
  final String publishDate;
  final String readDuration;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5),
      child: SizedBox(
        height: 100,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 4/3,
              child: thumbnail,
            ),
            Expanded(
              child: 
              Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 0.0, 2.0, 0.0),
                child: _ArticleDescription(
                  title: title,
                  subtitle: subtitle,
                  author: author,
                  publishDate: publishDate,
                  readDuration: readDuration,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}