import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class RenderDots extends RenderConstrainedBox {
  RenderDots(this.color) : super(additionalConstraints: const BoxConstraints.expand());

  final Color color;
  final behavior = HitTestBehavior.translucent;

  // Makes this render box hittable so that we'll get pointer events.
  @override
  bool hitTestSelf(Offset position) => true;
  
  final Map<int, Offset> _dots = <int, Offset>{};

  @override
  @override
bool hitTest(BoxHitTestResult result, { required Offset position }) {
  if (!GestureIndicator._isOpenStrack) return false;
  bool hitTarget = false;
  // if (size.contains(position)) {
    // hitTarget = hitTestChildren(result, position: position) || hitTestSelf(position);
    // if (hitTarget || behavior == HitTestBehavior.translucent)
      result.add(BoxHitTestEntry(this, position));
  // }
  return hitTarget;
}

  @override
  void handleEvent(PointerEvent event, BoxHitTestEntry entry) {
    if (event is PointerDownEvent || event is PointerMoveEvent) {
      _dots[event.pointer] = event.position;
      markNeedsPaint();
    } else if (event is PointerUpEvent || event is PointerCancelEvent) {
      _dots.remove(event.pointer);
      markNeedsPaint();
      
    }
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    final Canvas canvas = context.canvas;
    // canvas.drawRect(offset & size, Paint()..color = const Color(0xFF0000FF));

    final Paint paint = Paint()..color = color;
    for (final Offset point in _dots.values) {
      canvas.drawCircle(point, 40.0, paint);
    }

    super.paint(context, offset);
  }
}

class GestureIndicator extends SingleChildRenderObjectWidget {
  static var _isOpenStrack = true;
  static track(bool isTrack) {
    _isOpenStrack = isTrack;
  }

  const GestureIndicator({ super.key, super.child, this.color = const Color(0x7742A5F5) });
  final Color color;
  
  @override
  RenderDots createRenderObject(BuildContext context) => RenderDots(color);
}