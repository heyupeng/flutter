import 'package:flutter/material.dart';

class HoListCell extends StatelessWidget {
  const HoListCell({ 
    super.key, 
    this.title = '',
    this.showIndicator = true,
    this.onTap,
    this.child,
    this.builder,

    this.indicatorBuilder,
   });
  
  final String title;
  final bool showIndicator;
  final void Function()? onTap;
  final Widget? child;
  final WidgetBuilder? builder;
  final WidgetBuilder? indicatorBuilder;

  @override
  Widget build(BuildContext context) {
    Widget? trailing = indicatorBuilder != null ? indicatorBuilder!(context) :showIndicator ? buildIndicator() : null;

    Widget child = builder != null ? builder!(context) : this.child ??
     ListTile(
        title: Text(title),
        style: ListTileStyle.list,
        trailing: trailing,
        onTap: onTap
      )
    ;
    final ThemeData themeData = Theme.of(context);
    final ColorScheme colorScheme = themeData.colorScheme;
    return 
      Container(
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        decoration: BoxDecoration(
          color: colorScheme.surface.withOpacity(0.5),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey.withAlpha((255*0.3).ceil()) )
        ),
        child: child,
    );
  }
}

Widget buildIndicator() {
  return Container(
    width: 15, height: 15,
    alignment: Alignment.center,
    transformAlignment: Alignment.center,
    // transform:  Matrix4.rotationZ(3.14 * 1.0/4),
    // decoration: const ShapeDecoration(
    //   shape: Border(
    //     right: BorderSide(color: Colors.grey, width: 1.5),
    //     top: BorderSide(color: Colors.grey, width: 1.5)
    //   ),
    // ),
    transform:  Matrix4.rotationZ(3.14 * 1.0),
    child: const Icon(Icons.arrow_back_ios_new, size: 15,color: Colors.grey,),
  )
  ;
}