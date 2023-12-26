import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:peng_flutter/SampleDemo/ListTile.dart';
import 'package:peng_flutter/SampleDemo/HelloWorld.dart';
import 'SampleDemo/bottom_app_bar.dart';
import 'SampleDemo//bottom_nav_bar.dart';
import 'SampleDemo/ListViewDemo.dart';
import 'SampleDemo/Animate5.dart';

// var tapped = (BuildContext context) {
//   Route route =  MaterialPageRoute<bool>(builder: (context) {
//     return const HelloWorldPage(title: "title");
//   },);
//   Navigator.of(context).push(route);
// };
class ExampleItem {
  final String title;
  Widget Function(BuildContext context)? builder;
  void Function(BuildContext context, Object? arguments)? onTap;

  ExampleItem({this.title = "", this.builder, this.onTap});

  // ExampleItem(this.title, [this.builder, this.onTap]);
  
  external ExampleItem._internal(String? title, Widget Function(BuildContext context)? builder, void Function(BuildContext context)? onTap);

  ExampleItem.build({
    String? title, 
    Widget Function(BuildContext context)? builder, 
    void Function(BuildContext context)? onTap}
    ): this._internal(title, builder, onTap);
}

var examples = [
  ExampleItem(
    title: "Hello World",
    // builder: (BuildContext context) {
    //   return const HelloWorldPage(title: "Hello World Page ");
    // },
    onTap: (BuildContext context, Object? arguments) {
      Route route =  MaterialPageRoute<bool>(builder: (context) {
        var item = arguments as ExampleItem;
        return  HelloWorldPage(title: item.title);
      },);
      Navigator.of(context).push(route);
    },
  ),
  ExampleItem(
    title: "Bottom App Bar", 
    builder: (BuildContext context) {
      return const BottomAppBarDemo();
    },
  ),
  ExampleItem(
    title: "Bottom Nav Bar", 
    builder: (BuildContext context) {
      return const BottomNavBarPage(title: "Bottom Nav Bar Page");
    },
  ),
  ExampleItem(
    title: "ListView", 
    builder: (BuildContext context) {
      return const  ListViewPage(title: "ListView Page");
    },
  ),
  ExampleItem(
    title: "List Tile", 
    builder: (BuildContext context) {
      return const  ListTileDemo();
    },
  ),

  ExampleItem(
    title: "Animate 5", 
    builder: (BuildContext context) {
      return const  LogoApp();
    },
  ),
];

class ExampleListPage extends StatefulWidget {
  const ExampleListPage({super.key});

  @override
  State<ExampleListPage> createState() => _ExampleListPageState();
}

class _ExampleListPageState extends State<ExampleListPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  onTapListItem(BuildContext context, ExampleItem item) {
    var  onTap = item.onTap;
    var  builder = item.builder;
    if (builder != null) {
      RouteSettings settings = RouteSettings(arguments: {
        'item': item
      });
      Route route = MaterialPageRoute(builder: builder, settings: settings);
      Navigator.of(context).push(route);
      return;
    }
    if (onTap != null) {
      onTap(context, item);
    }
  }

  listView(BuildContext context) {
    return ListView(
      children: examples.map((item) {
        var title = item.title;
        return Column(
          
        );  
      }).toList(),
    );
  }

  Widget listItemBuilder(context, index) {
    var item = examples[index];
    return 
    ListTile(title: Text(item.title), 
      tileColor: Colors.green.withOpacity(index%2 == 0 ? 0.1: 0.3),
      onTap: () {
        onTapListItem(context, item);
      },
    );
  }

  listViewWithSeparated(BuildContext context) {
    return ListView.separated(
      itemBuilder: listItemBuilder,
      separatorBuilder: (context, index) {
        return const Divider(color:   Color.fromARGB(71, 143, 94, 90), height: 1, indent: 15,endIndent: 15 ,);
      },
      itemCount: examples.length
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Flutter Demo / Examples Page")),
      body: Center(
        child: listViewWithSeparated(context)
      ),
    );
  }
}
