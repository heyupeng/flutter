import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

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
  double loadLine = 90;
  double armedLine = 120;
  RefreshState refreshState = RefreshState.none;

  int local = 0; /* 1: 在底部 */
  
  bool isDragging = false;
  bool isTouching = false;
  bool get isRefreshing => refreshState == RefreshState.loading || refreshState == RefreshState.finishing;

  void receiveScrollNotify(ScrollNotification notification) {
    if (notification.metrics.outOfRange == false) {
      return;
    }
    var metrics = notification.metrics;
    var topOut = metrics.minScrollExtent - metrics.pixels;
    var bottomOut = metrics.pixels - metrics.maxScrollExtent;
    local = topOut > 0 ? 0 : 1;
    
    // print('ScrollExtent: (${_scrollController.position.extentBefore}, ${_scrollController.position.maxScrollExtent})' + ' | viewport: ${notification.metrics.viewportDimension}');
    // print('Offset: ${offset} | top: ${offsetBy.toStringAsFixed(3)} | bottom: ${remainder.toStringAsFixed(3)}');
    print('$topOut | $bottomOut');
    
    if (notification is UserScrollNotification) {
      
    }
    else if (notification is ScrollStartNotification) {
    }
    else if (notification is ScrollUpdateNotification) {
      final hasDrag = notification.dragDetails != null;
      if (!hasDrag && !isDragging) { 
        // cancel drag & auto scroll
        isTouching = false;
        checkStateWhileEndingDragGesture();
      } else {
        isDragging = hasDrag;
        isTouching = true;
      }
      setOffset(local == 0 ? topOut: bottomOut);
    }
    else if (notification is ScrollEndNotification) {
    }
    
  }

  setOffset(double value) {
    if (isRefreshing) {
      return;
    }
    offset = value;

    var state = refreshState;
    if (offset <= 0) {
      state = RefreshState.none;
    }
    else if (offset < loadLine) {
      state = RefreshState.pullup;
    }
    else if (offset < armedLine) {
      state = RefreshState.loadmore;
    }
    else {
      // state = RefreshState.loading;
    }
    _refresh?.changeOffset(value);

    changeState(state);
  }

  void checkStateWhileEndingDragGesture() {
    if (refreshState == RefreshState.loadmore) {
      changeState(RefreshState.loading);
    }
  }

  void changeState(RefreshState state) {
    if (state == refreshState) {
      return;
    }
    refreshState = state;
    notifyListeners();

    _refresh?.changeState(state);
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

class _FootRefrshState extends State<FootRefresh> with SingleTickerProviderStateMixin {
  
  @override
  void initState() {
    super.initState();
    widget.controller._refresh = this;
  }
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    widget.controller._refresh = this;
  }

  @override
  void didUpdateWidget(covariant FootRefresh oldWidget) {
    super.didUpdateWidget(oldWidget);
    oldWidget.controller._refresh = null;
    widget.controller._refresh = this;
  }

  @override
  void dispose() {
    super.dispose();
    widget.controller._refresh = null;
  }

  double height = 60;
  double _bottom = - 60;
  double _hoverBottom = 0;
  int _milliseconds = 0;
  String text = '';
  // Animation<Color> colorAnimation = Animation();

  RefreshState get state => widget.controller.refreshState;

  Color? _color;

  @override
  Widget build(BuildContext context) {
    Color? color = _getColor();
    
    // color = color?.withOpacity(0.3);
    Color? backgroundColor = Color.lerp(
      _color,
      color,
      clampDouble(_bottom / height, 0, 1)
    );
    // _color = color;
    
    Widget child = state == RefreshState.loading ? 
      CircleAvatar(backgroundColor: Colors.blue, child: CircularProgressIndicator(),)  :
      Text(text);
    return 
    AnimatedPositioned(
      left: 0,
      right: 0,
      top: widget.controller.local == 0 ? _bottom : null,
      bottom: widget.controller.local == 1 ? _bottom : null,
      duration: Duration(milliseconds: _milliseconds),
      child: 
        AnimatedContainer(
          color: backgroundColor,
          alignment: Alignment.center,
          height: height,
          child: child,
          duration: Duration(milliseconds: _milliseconds),
        )
    );
  }

  String _getTextForState() {
    var state = widget.controller.refreshState;
    var text = 'pull up to load more';
    switch (state) {
      case RefreshState.pullup: 
      text = widget.controller.local == 1 ? 'pull up to load more' : 'pull down to refresh';
      break;
      case RefreshState.loadmore: 
      text = widget.controller.local == 1 ? 'let go to load more':  'pull down to refresh'; 
      break;
      case RefreshState.loading: text = 'loading ...'; break;
      case RefreshState.finishing: text = 'finish loading'; break;
      case RefreshState.nomore: text = 'no more'; break;
      default:
        break;
    }
    return text;
  }

  Color? _getColor() {
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
    return color;
  }

  changeOffset(double value) {
    var offset = value;
    // offset = math.min(offset, widget.controller.loadLine);
    var bottom = - height + offset;
    if (bottom < 0  && widget.controller.isRefreshing) {
      bottom = 0;
    }
    double bottomBy = bottom - _bottom;
    if(bottomBy >= 0) { bottomBy = -bottomBy; }
    
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
      case RefreshState.loading:
        translateTo(_hoverBottom, 50);
        break;

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