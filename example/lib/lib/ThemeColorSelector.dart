import 'package:flutter/material.dart';
import 'package:flutter_neumorphism/flutter_neumorphism.dart';

import 'color_selector.dart';

class ThemeColorSelector extends StatefulWidget {
  final BuildContext customContext;

  ThemeColorSelector({required this.customContext});

  @override
  _ThemeColorSelectorState createState() => _ThemeColorSelectorState();
}

class _ThemeColorSelectorState extends State<ThemeColorSelector> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      color: Colors.black,
      child: ColorSelector(
        color: NeumorphismTheme.baseColor(widget.customContext ?? context),
        onColorChanged: (color) {
          setState(() {
            NeumorphismTheme.update(widget.customContext ?? context,
                (current) => current!.copyWith(baseColor: color));
          });
        },
      ),
    );
  }
}
