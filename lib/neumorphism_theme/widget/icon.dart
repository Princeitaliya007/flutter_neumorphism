import 'package:flutter_neumorphism/neumorphism_theme/widget/text.dart';
import 'package:flutter/widgets.dart';

import '../theme.dart';
import 'container.dart';
export '../decoration/neumorphism_decorations.dart';
export '../neumorphism_box_shape.dart';

@immutable
class NeumorphismIcon extends StatelessWidget {
  final IconData icon;
  final NeumorphismStyle? style;
  final Curve curve;
  final double size;
  final Duration duration;

  NeumorphismIcon(
    this.icon, {
    Key? key,
    this.duration = Neumorphism.DEFAULT_DURATION,
    this.curve = Neumorphism.DEFAULT_CURVE,
    this.style,
    this.size = 20,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NeumorphismText(
      String.fromCharCode(icon.codePoint),
      textStyle: NeumorphismTextStyle(
        fontSize: size,
        fontFamily: icon.fontFamily,
        package: icon.fontPackage,
      ),
      duration: duration,
      style: style,
      curve: curve,
    );
  }
}
