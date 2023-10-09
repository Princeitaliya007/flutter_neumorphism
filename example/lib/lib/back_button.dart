import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_neumorphism/flutter_neumorphism.dart';

class NeumorphismBack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NeumorphismButton(
      padding: EdgeInsets.all(18),
      style: NeumorphismStyle(
        boxShape: NeumorphismBoxShape.circle(),
        shape: NeumorphismShape.flat,
      ),
      child: Icon(
        Icons.arrow_back,
        color: NeumorphismTheme.isUsingDark(context)
            ? Colors.white70
            : Colors.black87,
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
  }
}
