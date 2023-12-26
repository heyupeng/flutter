import 'package:flutter/material.dart';

class HoListCell extends StatelessWidget {
  const HoListCell({ 
    super.key, 
    this.title = '', 
    this.showIndicator = false,
    this.onTap,
   });
  
  final String title;
  final bool showIndicator;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return 
    Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.withAlpha((255*0.3).ceil()) )
        ),
        child: 
          ListTile(title: Text(title), 
            style: ListTileStyle.list,
            trailing: showIndicator ? buildIndicator() : null,
            onTap: onTap
          ),
        ),
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