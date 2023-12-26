import 'dart:math';

import 'package:flutter/material.dart';

enum TabBarPosition {
  bottom,
  top,
}

class TabPage extends StatefulWidget {
  const TabPage({ 
    super.key, 
    required this.children,
    required this.items,
  });

  final List<Widget> children;
  final List<TabBarItem>? items;

  @override
  State<TabPage> createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> with TickerProviderStateMixin {
  late TabController _tabController;
  TabBarPosition tabPosition = TabBarPosition.bottom;

  int get currentIndex => _tabController.index;
  int _childrenLength = 0;
  
  void _setupTabController() {
    _childrenLength = widget.children.length;
    _tabController = TabController(length: _childrenLength, vsync: this, animationDuration: Duration.zero);
    _tabController.addListener(() {
      if (!_tabController.indexIsChanging) {
      }
      print('Tab index: ${_tabController.index}');
    });
  }

  @override
  void initState() {
    super.initState();
    
    _setupTabController();
  }

  @override
  Widget build(BuildContext context) {
    List<TabBarItem>? items = widget.items ?? [];
    AppBar? appBar;
    if (tabPosition == TabBarPosition.top ) {
      appBar =  AppBar(
        title: TabBar( controller: _tabController, tabs: TabBarItem.tabsOf(items),),
      );
    }

    Widget? bottomNavigationBar;
    if (tabPosition == TabBarPosition.bottom) {
      bottomNavigationBar = BottomNavigationBar(
        currentIndex: _tabController.index, // _currentIndex,
        items: TabBarItem.bottomNavigationTabBarItems(items),
        onTap: (int value) => _changedIndex(value)
      );
    }
    
    print('${widget.children.length}');
    List<Widget>? children =  widget.children;

    return
      Scaffold(
        appBar: appBar,
        bottomNavigationBar: bottomNavigationBar,
        body: 
        TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          controller: _tabController,
          children: children,
        ),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_childrenLength != widget.children.length) {
      _setupTabController();
      // setState(() { });
    }
  }

  void _changedIndex(int value) {
    print('$value');
    _tabController.index = value;
    setState(() {

    });
  }

  void _changeTabbarPosition() {
    tabPosition = tabPosition == TabBarPosition.top ? TabBarPosition.bottom: TabBarPosition.top;
    setState(() {
      
    });
  }
}

class TabBarItem {
  
  const TabBarItem({
    this.text,
    this.icon, 
    this.backgroundColor,
    this.tooltip,
  });
  
  final String? text;
  final Widget? icon;

  /* BottomNavigationTabBarItem */
  final Color? backgroundColor;
  final String? tooltip;

  static List<Tab> tabsOf(List<TabBarItem> items) {
    return items.map( (e) => 
      Tab(text: e.text, icon: e.icon,) 
    )
    .toList();
  }

  static List<BottomNavigationBarItem> bottomNavigationTabBarItems(List<TabBarItem> items) {
    return items.map( (e) => 
      BottomNavigationBarItem(
        icon: e.icon!,
        label: e.text,
        tooltip: e.tooltip,
      )
    )
    .toList();
  }

  static const List<TabBarItem> items = [
    TabBarItem(
      icon: Icon(Icons.home),
      text: 'Home',
      tooltip: 'home',
      ),
    TabBarItem(
      icon: Icon(Icons.history),
      text: 'History',
      tooltip: 'history',
      ),
    TabBarItem(
      icon: Icon(Icons.settings),
      text: 'Settings',
      tooltip: 'settings',
      ),
  ];
}
