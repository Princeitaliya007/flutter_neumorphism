import 'package:flutter/widgets.dart';

import '../../neumorphism_box_shape.dart';

class NeumorphismBoxShapeClipper extends StatelessWidget {
  final NeumorphicBoxShape shape;
  final Widget? child;

  NeumorphismBoxShapeClipper({required this.shape, this.child});

  CustomClipper<Path>? _getClipper(NeumorphicBoxShape shape) {
    return shape.customShapePathProvider;
  }

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: _getClipper(this.shape),
      child: child,
    );
  }
}
