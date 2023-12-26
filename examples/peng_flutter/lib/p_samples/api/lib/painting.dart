
import 'package:flutter/material.dart';

import 'package:flutter_api_samples/painting/axis_direction/axis_direction.0.dart' as axis_direction_0;
import 'package:flutter_api_samples/painting/borders/border_side.stroke_align.0.dart' as border_side_stroke_align_0;
import 'package:flutter_api_samples/painting/gradient/linear_gradient.0.dart' as linear_gradient_0;
import 'package:flutter_api_samples/painting/image_provider/image_provider.0.dart' as image_provider_0;
import 'package:flutter_api_samples/painting/linear_border/linear_border.0.dart' as linear_border_0;
import 'package:flutter_api_samples/painting/star_border/star_border.0.dart' as star_border_0;


Map<String, WidgetBuilder> routesMap = <String, WidgetBuilder> {
  'axis_direction': (context) => const axis_direction_0.ExampleApp(),
  'border_side_stroke_align': (context) => const border_side_stroke_align_0.StrokeAlignApp(),
  'linear_gradient': (context) => const linear_gradient_0.LinearGradientExampleApp(),
  'image_provider': (context) => const image_provider_0.ExampleApp(),
  'linear_border': (context) => const linear_border_0.ExampleApp(),
  'star_border': (context) => const star_border_0.StarBorderApp(),
};