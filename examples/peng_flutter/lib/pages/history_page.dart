// ignore_for_file: non_constant_identifier_names

import 'dart:async';
import 'dart:developer';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:peng_flutter/common/http/http.dart';
import 'package:peng_flutter/common/file_storage.dart';
import 'package:peng_flutter/common/http/http_io.dart';
import 'package:peng_flutter/pages/webview_page.dart';

import '../common/navigator_observer.dart';
import '../components/components.dart';
import '../model/news_model.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(const HistroyApp(routes: {},));
  getTemporaryDirectory();
}

Widget buildApp({Key? key,
  Map<String, WidgetBuilder> routes = const <String, WidgetBuilder>{},
  String title = 'Flutter',
  }) {
  return HistroyApp(key: key, routes: routes, title: title);
}

class HistroyApp extends StatelessWidget {
  const HistroyApp({ 
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
      home: child ??  HistroyPage(title: title),
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


class HistroyPage extends StatefulWidget {
  const HistroyPage({
    Key? key, required this.title
  }) : super(key: key);

  final String title;

  @override
  State<HistroyPage> createState() => _HistroyPageState();
}

class _HistroyPageState extends State<HistroyPage> {
  ScrollNotificationObserverState? _scrollNotificationObserver;

  final ScrollController _scrollController = ScrollController(
    onAttach: (ScrollPosition position) {
      // print('Scroll attach: ${position}');
    }, onDetach: (position) {
      // print('Scroll detach: ${position}');
    },
  );

  static final NewsHttpController _newController = NewsHttpController();
  final RefreshController _refreshController = RefreshController();

  void setScrollNotificationObserver (ScrollNotificationObserverState? newOberver) {
    _scrollNotificationObserver?.removeListener(_onScrollNotify);
    _scrollNotificationObserver = newOberver;
    _scrollNotificationObserver?.addListener(_onScrollNotify);
  }

  @override
  void initState() {
    super.initState();
    _refreshController.addListener(_onRefreshNotify);

    if (_newController.list.isEmpty) {
      fecthNextPage();
    }
    print("12");
  }
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    setScrollNotificationObserver(ScrollNotificationObserver.maybeOf(context));
  }

  @override
  void dispose() {
    _refreshController.removeListener(_onRefreshNotify);
    setScrollNotificationObserver(null);
    super.dispose();
  }

  void _onScrollNotify(ScrollNotification notification) {
    _refreshController.receiveScrollNotify(notification);
  }

  void _onRefreshNotify() {
    switch (_refreshController.refreshState) {
      case RefreshState.loading:
        // var offset = _scrollController.position.maxScrollExtent;
        // var millsec = 1000;
        // _scrollController.animateTo(offset, duration: Duration(milliseconds: millsec), curve: Curves.bounceInOut);
        if (_refreshController.local == 1) {
          fecthNextPage();
        } else {
          refreshNews();
        }
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {

    var widgets = _newController.list.map((item) {
      return 
      GestureDetector(
        onTapDown: (details) {
          openDetail(item);
        },
        
        child:
      CustomListItem(
        thumbnail: CachedNetworkImage(
          fit: BoxFit.cover,
          imageUrl: item.img,
          placeholder: (context, url) => AspectRatio(aspectRatio: 1, child: Container(color: Colors.grey.shade300,),),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ), 
        title: item.title, 
        subtitle: '', 
        author: '', 
        publishDate: item.news_date, 
        readDuration: item.date,
      )
      );
    })
    .toList();

    return Scaffold(
      appBar: AppBar(
      ),
      body: Stack(
        children:[
          Scrollbar(
            controller: _scrollController,
            child:  
            LayoutBuilder(builder: (context, constraints) {
              if (constraints.maxWidth <= constraints.maxHeight) {
              return
              ListView(
                controller: _scrollController,
                children: 
                    widgets
                );
              }
              else {
                return
                SafeArea(
                  child: GridView.extent(
                    controller: _scrollController,
                    maxCrossAxisExtent: constraints.maxWidth / 2 ,
                    childAspectRatio: 4,
                    children: widgets
                ));
              }
            })
          ),

          FootRefresh(controller: _refreshController),
        ],         
      ),
    );
  }

  void _onTap(String title ) async {
    // var url = Uri.https('example.com', 'whatsit/create');
    // var response = await http.post(url, body: {'name': 'doodle', 'color': 'blue'});
    // print('Response status: ${response.statusCode}');
    // print('Response body: ${response.body}');

    // print(await http.read(Uri.https('example.com', 'foobar.txt')));

  }

  void openDetail(NewsModel item) {
    // var url = 'https://sports.sina.cn/china/2023-12-26/detail-imzzihhh6279562.d.html?pos=10';
    // Webview(true)
    // .setTitle("title")
    // .setSize(1280, 800, SizeHint.none)
    // .navigate('url')
    // .run();
    
    String url = item.link;
    Navigator.of(context).push(CTM_CupertinoPageRoute(builder: (context) => WebViewExample(url: url)));
  }

  void fecthNextPage() {
    _newController.fecthNextPage((successful) {
      if (!mounted) return;
      _refreshController.changeState(successful ? RefreshState.finishing: RefreshState.error);
      setState(() { });
    });
  }
  void refreshNews() {
    _newController.fecthNextPage((successful) {
      if (!mounted) return;
      _refreshController.changeState(successful ? RefreshState.finishing: RefreshState.error);
      setState(() { });
    });
  }
}

class NewsHttpController extends XHttpController {
  List<NewsModel> list = [];
  int page = -1;
  static const _newsIDDirectory = '/news/news_id.txt'; // {id: date}

  final MapFileStorage _storage = MapFileStorage(_newsIDDirectory);
  
  void fecth(void Function(bool successful) completion) {
    if (this.page == -1) {
      this.page = 0;
    }
    var urlstr = "https://interface.sina.cn/ent/feed.d.json?";
    var date = DateTime.now();
    var time = date.second;
    var page = this.page;
    var paramsStr = 'ch=sports&col=sports&act=more&t=${time}&show_num=10&page=${page}';
    
    get(urlstr + paramsStr, (jsonRes) {
      list += NewsModel.formJsonList(jsonRes['data']);
      writeToFile(list);
      completion(true);
    }, (response) {
      completion(false);
    });
  }

  void fecthNextPage(void Function(bool successful) completion, {bool refresh = false}) {
    if (refresh) {page = -1;};
    page += 1;
    fecth(((successful) {
      if (refresh) { this.list = []; }
      this.list += list;
      completion(successful);
      print('asd123');
    }));
  }

  void writeToFile(List<NewsModel> list) async {
    for (var element in list) {
      _storage.set(key: element.docID, value: element.news_date);
      MapFileStorage fs = MapFileStorage(_getNewsFilepath(element));
      fs.value = element.jsonObject;
      fs.save();
    }
    _storage.save();
  }
  void readNewsList(Function(bool successful) completion) {
    _storage.read().then((value) {
      list = value.keys.toList()
      .sublist(list.length, math.min(list.length, value.length - list.length))
      .map((key) => NewsModel.formJson(value[key]))
      .toList();
      completion(true);
    });
  }

  String _getNewsFilepath(NewsModel element) {
    return 'news/info/' + element.docID + '.json';
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
        //   child: 
          // Text(
          //   subtitle,
          //   maxLines: 2,
          //   overflow: TextOverflow.ellipsis,
          //   style: const TextStyle(
          //     fontSize: 12.0,
          //     color: Colors.black54,
          //   ),
          // ),
        // ),
        // Text(
        //   author,
        //   style: const TextStyle(
        //     fontSize: 12.0,
        //     color: Colors.black87,
        //   ),
        // ),
        Expanded(child: Container()),
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
        height: 80,
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
