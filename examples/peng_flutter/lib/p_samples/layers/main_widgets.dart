import 'package:flutter/material.dart';

import 'package:flutter_examples_layers/widgets/custom_render_box.dart' as custom_render_box;
import 'package:flutter_examples_layers/widgets/gestures.dart' as gestures;
import 'package:flutter_examples_layers/widgets/media_query.dart' as media_query;
import 'package:flutter_examples_layers/widgets/sectors.dart' as sectors;
import 'package:flutter_examples_layers/widgets/spinning_mixed.dart' as spinning_mixed;
import 'package:flutter_examples_layers/widgets/spinning_square.dart' as spinning_square;
import 'package:flutter_examples_layers/widgets/styled_text.dart' as styled_text;


Map<String, WidgetBuilder> routesMap = {
  'custom_render_box': (context) => RenderDots(),
  'gestures': (context) => const gestures.GestureDemo(),
  'media_query': (context) => MediaQuery(),
  'sectors': (context) => const sectors.SectorApp(),
  // 'spinning_mixed': (context) => const spinning_mixed.Rectangle(),
  'spinning_square': (context) => Container(color: Colors.white, child: Center(child: spinning_square.SpinningSquare()) ),
  'styled_text': (context) => const StyledTextDemo(),
};

/* RenderDots */
class RenderDots extends StatelessWidget {
  const RenderDots({super.key});
  @override
  Widget build(BuildContext context) {
    return const
      Directionality(
        textDirection: TextDirection.ltr,
        child: custom_render_box.Dots(
          child: Center(
            child: Text('Touch me!'),
          ),
        ),
      )
    ;
  }
}

/* media_query */
List<String> _initNames() => List<String>.generate(30, (int i) => 'Item $i');

final List<String> _kNames = _initNames();

class MediaQuery extends StatelessWidget {
  const MediaQuery({super.key});

  @override
  Widget build(BuildContext context) {  
    return MaterialApp(
      title: 'Media Query Example',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Media Query Example'),
        ),
        body: Material(child: media_query.AdaptiveContainer(names: _kNames)),
      ),
    )
    ;
  }
}

class StyledTextDemo extends StatelessWidget {
  const StyledTextDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    theme: ThemeData.light(),
    home: Scaffold(
      appBar: AppBar(
        title: const Text('Hal and Dave'),
      ),
      body: Material(
        color: Colors.grey.shade50,
        child: const styled_text.StyledTextDemo(),
      ),
    ),
  );
  }
}