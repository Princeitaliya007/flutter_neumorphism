import 'package:flutter/material.dart' as material;
import 'package:flutter/widgets.dart';

import '../neumorephism_theme.dart';
import '../neumorphism_box_shape.dart';
import '../decoration/neumorphism_decorations.dart';
import 'clipper/neumorphism_box_shape_clipper.dart';

export '../neumorphism_box_shape.dart';
export '../decoration/neumorphism_decorations.dart';
/// The main container of the Neumorphic UI KIT
/// it takes a Neumorphic style @see [NeumorphicStyle]
///
/// it's clipped using a [NeumorphicBoxShape] (circle, roundrect, stadium)
///
/// It can be, depending on its [NeumorphicStyle.shape] : [NeumorphicShape.concave],  [NeumorphicShape.convex],  [NeumorphicShape.flat]
///
/// if [NeumorphicStyle.depth] < 0 ----> use the emboss shape
///
/// The container animates any change for you, with [duration] ! (including style / theme / size / etc.)
///
/// [drawSurfaceAboveChild] enable to draw emboss, concave, convex effect above this widget child
///
/// drawSurfaceAboveChild - UseCase 1 :
///
///   put an image inside a neumorphic(concave) :
///   drawSurfaceAboveChild=false -> the concave effect is below the image
///   drawSurfaceAboveChild=true -> the concave effect is above the image, the image seems concave
///
/// drawSurfaceAboveChild - UseCase 2 :
///   put an image inside a neumorphic(emboss) :
///   drawSurfaceAboveChild=false -> the emboss effect is below the image -> not visible
///   drawSurfaceAboveChild=true -> the emboss effeect effect is above the image -> visible
///
@immutable
class Neumorphism extends StatelessWidget {
  static const DEFAULT_DURATION = Duration(milliseconds: 100);
  static const DEFAULT_CURVE = Curves.linear;

  static const double MIN_DEPTH = -20.0;
  static const double MAX_DEPTH = 20.0;

  static const double MIN_INTENSITY = 0.0;
  static const double MAX_INTENSITY = 1.0;

  static const double MIN_CURVE = 0.0;
  static const double MAX_CURVE = 1.0;

  final Widget? child;

  final NeumorphismStyle? style;
  final TextStyle? textStyle;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final Curve curve;
  final Duration duration;
  final bool
      drawSurfaceAboveChild; //if true => boxDecoration & foreground decoration, else => boxDecoration does all the work

  Neumorphism({
    Key? key,
    this.child,
    this.duration = Neumorphism.DEFAULT_DURATION,
    this.curve = Neumorphism.DEFAULT_CURVE,
    this.style,
    this.textStyle,
    this.margin = const EdgeInsets.all(0),
    this.padding = const EdgeInsets.all(0),
    this.drawSurfaceAboveChild = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = NeumorphismTheme.currentTheme(context);
    final NeumorphismStyle style = (this.style ?? const NeumorphismStyle())
        .copyWithThemeIfNull(theme)
        .applyDisableDepth();

    return _NeumorphismContainer(
      padding: padding,
      textStyle: textStyle,
      drawSurfaceAboveChild: drawSurfaceAboveChild,
      duration: duration,
      style: style,
      curve: curve,
      margin: margin,
      child: child,
    );
  }
}

class _NeumorphismContainer extends StatelessWidget {
  final NeumorphismStyle style;
  final TextStyle? textStyle;
  final Widget? child;
  final EdgeInsets margin;
  final Duration duration;
  final Curve curve;
  final bool drawSurfaceAboveChild;
  final EdgeInsets padding;

  _NeumorphismContainer({
    Key? key,
    this.child,
    this.textStyle,
    required this.padding,
    required this.margin,
    required this.duration,
    required this.curve,
    required this.style,
    required this.drawSurfaceAboveChild,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final shape = style.boxShape ?? NeumorphicBoxShape.rect();

    return DefaultTextStyle(
      style: textStyle ?? material.Theme.of(context).textTheme.bodyText2!,
      child: AnimatedContainer(
        margin: margin,
        duration: duration,
        curve: curve,
        child: NeumorphismBoxShapeClipper(
          shape: shape,
          child: Padding(
            padding: padding,
            child: child,
          ),
        ),
        foregroundDecoration: NeumorphismDecoration(
          isForeground: true,
          renderingByPath: shape.customShapePathProvider.oneGradientPerPath,
          splitBackgroundForeground: drawSurfaceAboveChild,
          style: style,
          shape: shape,
        ),
        decoration: NeumorphismDecoration(
          isForeground: false,
          renderingByPath: shape.customShapePathProvider.oneGradientPerPath,
          splitBackgroundForeground: drawSurfaceAboveChild,
          style: style,
          shape: shape,
        ),
      ),
    );
  }
}
