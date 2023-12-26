import 'package:flutter/material.dart';

class HoSearchBar extends StatelessWidget {
    const HoSearchBar({ 
    super.key, 
    this.hintText = 'Search',
    this.onChanged,
   });

  final String hintText;
  final void Function(String)? onChanged;

//   @override
//   State<HoSearchBar> createState() => _HoSearchBarState();
// }

// class _HoSearchBarState extends State<HoSearchBar> {

  @override
  Widget build(BuildContext context) {
  /* InputDecorator 
    border color:
      forcused:
        - true : primary
        - false : useMaterial3 ? onBackground: onSurface_0_33
   */
  final ThemeData t = Theme.of(context);
  final ColorScheme colorScheme = ColorScheme.light(
    primary: t.primaryColor,
    onSurface: t.primaryColor.withOpacity(1),
    onBackground: t.primaryColor.withOpacity(1),
  );
  const Color tintColor = Colors.white;
  
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        color:  t.primaryColor
      ),
      child: Theme(data: ThemeData(
          colorScheme:  colorScheme,
          hintColor: tintColor,
          useMaterial3: false
        ),
        child:
          TextField(
            cursorColor: tintColor,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search, color: tintColor, size: 20,),
              contentPadding: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
              border: const OutlineInputBorder(borderSide: BorderSide(width: 30,)),
              // fillColor: Colors.red,
              // focusColor: Colors.orange,
              // hoverColor: Colors.green,
              // iconColor: Colors.yellow,
              hintText: hintText,
              hintStyle: const TextStyle(textBaseline: TextBaseline.alphabetic),
            ),
            onChanged: onChanged,
          )
      )
    )
  )
    ;
  }
}