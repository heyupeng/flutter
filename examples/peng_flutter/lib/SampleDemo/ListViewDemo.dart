import 'dart:developer';
import 'dart:io' show Directory;

import 'package:flutter/material.dart';

import 'HelloWorld.dart';

class ListViewPage extends StatefulWidget {
  const ListViewPage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<ListViewPage> createState() => _MyListViewPageState();
}

class _MyListViewPageState extends State<ListViewPage> {
  int _counter = 5;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
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
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: ListExample(count: _counter,)
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class ListExample extends StatefulWidget {
  const ListExample({ Key? key, 
    required this.count, 
    this.items, 
    }) : super(key: key);

  // keys
  final int count;
  final List<Directory>? items;

  @override
  State<ListExample> createState() => _ListExampleState();
}

class _ListExampleState extends State<ListExample> {
  
  @override
  void initState() {
    super.initState();
  
  }

  @override
  void dispose() {
    super.dispose();
  
  }
  
  @override
  Widget build(BuildContext context) {
    final itemCount = widget.count * 2 - 1;
    return ListView.builder(
      itemCount: itemCount, 
      itemBuilder: (context, index) {
        if (index.isOdd) {
          return const Divider(height: 1, indent: 30,);
        }
        
        var itemIndex = index ~/ 2;
        return buildListItem(context, itemIndex);
      },
    );
  }
  Widget buildListItem(BuildContext context, int index) {
    var text = '$index ${['', 'focusColor', 'hoverColor', 'splashColor', 'tileColor', 'textColor',
    ][index%6]}';
    return 
      ListTile(title: Text(text),
        style: ListTileStyle.drawer,
        focusColor:   index%6 != 1? null: Colors.red,
        hoverColor:   index%6 != 2? null: Colors.orange,
        splashColor:  index%6 != 3? null: Colors.yellow,
        tileColor:    index%6 != 4? null: Colors.green.withOpacity((index/6).ceil()%2 == 0 ? 0.3: 0.1),
        textColor:    index%6 != 5? null: Colors.teal,
        onTap: () {
          tapListItem(context, index);
        },
      );
  }

  tapListItem(context, itemIndex) {
    var item = Item('$itemIndex', "This is the page oredered $itemIndex");
    // ignore: prefer_function_declarations_over_variables
    var builder = (context) { return DetailPage(item: item); };
    Route route =  MaterialPageRoute<bool>(
      builder: builder,
      // settings: RouteSettings(arguments: item)),
    );
    Navigator.of(context).push(route);
  }
}

class Item {
  final String title;
  final String detail;

  const Item(this.title, this.detail);
}

class DetailPage extends StatelessWidget {
  // In the constructor, require a Todo.
  const DetailPage({super.key, required this.item});

  // Declare a field that holds the Todo.
  final Item item;

  @override
  Widget build(BuildContext context) {
    /* */ 
    // final arguments = ModalRoute.of(context)!.settings.arguments;
    // final item = arguments as Item;

    // Use the Todo to create the UI.
    return Scaffold(
      appBar: AppBar(
        title: Text(item.title),
        backgroundColor: colors['background'],
        foregroundColor: colors['foreground'],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Text(item.detail),
      ),
    );
  }
}

const Map<String, Color> colors = {
  'background': Color.fromARGB(255, 0xf9, 0xf9, 0xf9),
  'foreground': Colors.black87,
};