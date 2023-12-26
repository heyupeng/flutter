// ignore_for_file: non_constant_identifier_names

import 'dart:async';
import 'dart:developer';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:peng_flutter/common/Http.dart';

import '../common/navigator_observer.dart';
import '../components/components.dart';
import '../model/news_model.dart';

void main() {
  runApp(const HistroyApp(routes: {},));
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
      print('Scroll attach: ${position}');
    }, onDetach: (position) {
      print('Scroll detach: ${position}');
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
    var metrics = notification.metrics;
    var offsetBy = metrics.pixels - metrics.minScrollExtent; /* v1 <= 0, 头部*/
    var remainder = metrics.maxScrollExtent - metrics.pixels; /* v2 <= 0, 底部 */
    
    print('ScrollExtent: (${_scrollController.position.extentBefore}, ${_scrollController.position.maxScrollExtent})' + ' | viewport: ${notification.metrics.viewportDimension}');
    print('Offset: ${notification.metrics.pixels} | top: ${offsetBy.toStringAsFixed(3)} | bottom: ${remainder.toStringAsFixed(3)}');

    if (remainder < 0) {
      // load more
        _refreshController.setOffset(-remainder);
    }
    if (offsetBy < 0) {
      // refresh
    }
  }

  void _onRefreshNotify() {
    switch (_refreshController.refreshState) {
      case RefreshState.loading:
        // var offset = _scrollController.position.maxScrollExtent;
        // var millsec = 1000;
        // _scrollController.animateTo(offset, duration: Duration(milliseconds: millsec), curve: Curves.bounceInOut);
        
        _newController.fecthNextPage((successful){
          _refreshController.changeState(successful ? RefreshState.finishing: RefreshState.error);
          setState(() { });
        });
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {

    var widgets = _newController.list.map((item) {
      return CustomListItem(
        thumbnail: Image.network(item.img), 
        title: item.title, 
        subtitle: item.wap_title, 
        author: '', 
        publishDate: item.news_date, 
        readDuration: item.date,
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
            child:  ListView(
              controller: _scrollController,
              children: 
                  widgets
              )
          ),

          FootRefresh(controller: _refreshController),
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

    _newController.fecthNextPage((successful){
      setState(() { });
    });
  }
}

class NewsHttpController extends XHttpController {
  List<NewsModel> list = [];
  int page = -1;

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
      list += NewsModel.list(jsonRes['data']);
      completion(true);
    }, (response) {
      completion(false);
    });
  }

  void fecthNextPage(void Function(bool successful) completion) {
    page += 1;
    fecth(completion);
  }
}

enum RefreshState {
  none,
  pullup,
  loadmore,
  loading,
  finishing,
  nomore,
  error,
}

class RefreshController extends ChangeNotifier {
  _FootRefrshState? _refresh;
  
  double offset = 0;
  double loadLine = 120;
  RefreshState refreshState = RefreshState.none;

  /* scroll direction */
  bool isUp = false ;
  bool get isRefreshing => refreshState == RefreshState.loading || refreshState == RefreshState.finishing;

  setOffset(double value) {
    var diff = value - offset;
    isUp = diff > 0.0 ? true: false;
    if (isRefreshing) {
      return;
    }
    offset = value;

    var state = refreshState;
    
    if (value <= 0) {
      state = RefreshState.none;
    }
    else if (value >= loadLine * 3/2) {
      state = RefreshState.loading;
    }
    else if (refreshState != RefreshState.loading && value >= loadLine) {
      state = RefreshState.loadmore;
    }
    else if (value > 0) {
      state = RefreshState.pullup;
    }
    if (value > -0.1) {
      _refresh?.changeOffset(value);
    }

    changeState(state);
  }

  void changeState(state) {
    if (state == refreshState) {
      return;
    }
    refreshState = state;
    notifyListeners();

    _refresh?.changeState(state);
    if (state == RefreshState.finishing) {

    }
  }
  
}

class FootRefresh extends StatefulWidget {
  const FootRefresh({
    super.key, required this.controller 
  });

  final RefreshController controller;

  @override
  State<StatefulWidget> createState() => _FootRefrshState();
}

class _FootRefrshState extends State<FootRefresh> {
  
  @override
  void initState() {
    super.initState();
    widget.controller._refresh = this;
    log('1');
  }
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    widget.controller._refresh = this;
    log('2');
  }

  @override
  void didUpdateWidget(covariant FootRefresh oldWidget) {
    super.didUpdateWidget(oldWidget);
    oldWidget.controller._refresh = null;
    widget.controller._refresh = this;
    log('3');
  }

  @override
  void dispose() {
    super.dispose();
    widget.controller._refresh = null;
  }

  double height = 60;
  double _bottom = - 60;
  int _milliseconds = 0;
  String text = '';

  RefreshState get state => widget.controller.refreshState;

  @override
  Widget build(BuildContext context) {
    Color? color;
    switch (state) {
      case RefreshState.pullup: color = Colors.green.shade100; break;
      case RefreshState.loadmore: color = Colors.green.shade300; break;
      case RefreshState.loading: color = Colors.green.shade500; break;
      case RefreshState.finishing: color = Colors.green.shade700; break;
      case RefreshState.error: color = Colors.red; break;
      default:
      break;
    }
    log('$state');
    return 
    AnimatedPositioned(
      left: 0,
      right: 0,
      bottom: _bottom,
      duration: Duration(milliseconds: _milliseconds),
      child: 
        AnimatedContainer(
          color: color?.withOpacity(0.5),
          alignment: Alignment.center,
          height: height,
          child: Text(text),
          duration: Duration(milliseconds: _milliseconds),
        )
    );
  }

  String _getTextForState() {
    var state = widget.controller.refreshState;
    var text = 'pull up to load more';
    switch (state) {
      case RefreshState.pullup: text = 'pull up to load more';
        break;
      case RefreshState.loadmore: text = 'touch up to load more';
        break;
      case RefreshState.loading: text = 'loading more';
        break;
      case RefreshState.finishing: text = 'finish loading';
        break;
      case RefreshState.nomore: text = 'no more';
        break;
      default:
        break;
    }
    return text;
  }

  changeOffset(double value) {
    var offset = value;
    offset = math.min(offset, widget.controller.loadLine);
    var bottom = - height + offset;
    if (bottom < 0  && widget.controller.isRefreshing) {
      bottom = 0;
    }
    double bottomBy = bottom - _bottom;
    if(bottomBy >= 0) { bottomBy = -bottomBy; }
    
    log('$_bottom : $bottom');
    int milliseconds = 0;
    translateTo(bottom, milliseconds);
  }
  setText(String text) {
    if (this.text == text) {
      return;
    }
    this.text = text;
    setState(() {});
  }

  changeState(RefreshState state, {String? text}) {
    setText(text ?? _getTextForState());

    switch (state) {
      case RefreshState.finishing:
        doFinishAnimation(1500, () {
          var bottom = - height;
          int milliseconds = 500;
          translateTo(bottom, milliseconds);
          Timer(Duration(milliseconds: milliseconds), (){ widget.controller.refreshState = RefreshState.none; });
        });
        break;
      case RefreshState.error:
        doError(1500, () {
          var bottom = - height;
          int milliseconds = 500;
          translateTo(bottom, milliseconds);
          Timer(Duration(milliseconds: milliseconds), (){ widget.controller.refreshState = RefreshState.none; });
        });
        break;
      default:
    }
    
  }
  void doFinishAnimation(int milliseconds, void Function() completeion) {
    // Todo: 模拟提示等待。
    Timer(
      Duration(milliseconds: milliseconds), 
      () { completeion(); });
  }
  void doError(int milliseconds, void Function() completeion) {
    // Todo: 模拟提示等待。
    Timer(
      Duration(milliseconds: milliseconds), 
      () { completeion(); });
  }

  void translateTo(double bottom, int milliseconds) {
    _bottom = bottom;
    _milliseconds = milliseconds;
    setState(() {});
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