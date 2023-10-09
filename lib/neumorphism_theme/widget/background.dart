import 'package:flutter/widgets.dart';

import '../neumorephism_theme.dart';

/// A container that takes the current [NeumorphicTheme] baseColor as backgroundColor
/// @see [NeumorphicTheme]
///
///
/// It can provide too a roundRect clip of the screen border using [borderRadius], [margin] and [backendColor]
///
/// ```
/// NeumorphismBackground(
///      borderRadius: BorderRadius.circular(12),
///      margin: EdgeInsets.all(12),
///      child: ...`
/// )
/// ```
@immutable
class NeumorphismBackground extends StatelessWidget {
  final Widget? child;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Color backendColor;
  final BorderRadius? borderRadius;

  const NeumorphismBackground({
    this.child,
    this.padding,
    this.margin,
    this.borderRadius,
    this.backendColor = const Color(0xFF000000),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: margin,
      color: backendColor,
      child: ClipRRect(
        borderRadius: borderRadius ?? BorderRadius.circular(0),
        child: AnimatedContainer(
          color: NeumorphismTheme.baseColor(context),
          padding: padding,
          duration: const Duration(milliseconds: 100),
          child: child,
        ),
      ),
    );
  }
}
