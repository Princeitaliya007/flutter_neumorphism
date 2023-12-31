import 'dart:ui';

import 'package:flutter/widgets.dart';

import '../light_source.dart';
import '../neumorphism_box_shape.dart';
import '../theme.dart';
import 'neumorphism_decoration_painter.dart';
import 'neumorphism_emboss_decoration_painter.dart';

@immutable
class NeumorphismDecoration extends Decoration {
  final NeumorphismStyle style;
  final NeumorphismBoxShape shape;
  final bool splitBackgroundForeground;
  final bool renderingByPath;
  final bool isForeground;

  const NeumorphismDecoration({
    required this.style,
    required this.isForeground,
    required this.renderingByPath,
    required this.splitBackgroundForeground,
    required this.shape,
  });

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    //print("createBoxPainter : ${style.depth}");
    if (style.depth != null && style.depth! >= 0) {
      return NeumorphismDecorationPainter(
        style: style,
        drawGradient: (isForeground && splitBackgroundForeground) ||
            (!isForeground && !splitBackgroundForeground),
        drawBackground: !isForeground,
        //only box draw background
        drawShadow: !isForeground,
        //only box draw shadow
        renderingByPath: this.renderingByPath,
        onChanged: onChanged ?? () {},
        shape: shape,
      );
    } else {
      return NeumorphismEmbossDecorationPainter(
        drawBackground: !isForeground,
        style: style,
        drawShadow: (isForeground && splitBackgroundForeground) ||
            (!isForeground && !splitBackgroundForeground),
        onChanged: onChanged ?? () {},
        shape: shape,
      );
    }
  }

  @override
  NeumorphismDecoration lerpFrom(Decoration? a, double t) {
    if (a == null) return scale(t);
    if (a is NeumorphismDecoration)
      return NeumorphismDecoration.lerp(a, this, t)!;
    return super.lerpFrom(a, t) as NeumorphismDecoration;
  }

  @override
  NeumorphismDecoration lerpTo(Decoration? b, double t) {
    if (b == null) return scale(1.0 - t);
    if (b is NeumorphismDecoration)
      return NeumorphismDecoration.lerp(this, b, t)!;
    return super.lerpTo(b, t) as NeumorphismDecoration;
  }

  NeumorphismDecoration scale(double factor) {
    print("scale");
    return NeumorphismDecoration(
        isForeground: this.isForeground,
        renderingByPath: this.renderingByPath,
        splitBackgroundForeground: this.splitBackgroundForeground,
        shape: NeumorphismBoxShape.lerp(null, shape, factor)!,
        style: style.copyWith());
  }

  static NeumorphismDecoration? lerp(
      NeumorphismDecoration? a, NeumorphismDecoration? b, double t) {
    //print("lerp $t ${a.style.depth}, ${b.style.depth}");

    if (a == null && b == null) return null;
    if (a == null) return b!.scale(t);
    if (b == null) return a.scale(1.0 - t);
    if (t == 0.0) {
      //print("return a");
      return a;
    }
    if (t == 1.0) {
      //print("return b (1.0)");
      return b;
    }

    var aStyle = a.style;
    var bStyle = b.style;

    return NeumorphismDecoration(
        isForeground: a.isForeground,
        shape: NeumorphismBoxShape.lerp(a.shape, b.shape, t)!,
        splitBackgroundForeground: a.splitBackgroundForeground,
        renderingByPath: a.renderingByPath,
        style: a.style.copyWith(
          border: NeumorphismBorder.lerp(aStyle.border, bStyle.border, t),
          intensity: lerpDouble(aStyle.intensity, bStyle.intensity, t),
          surfaceIntensity:
              lerpDouble(aStyle.surfaceIntensity, bStyle.surfaceIntensity, t),
          depth: lerpDouble(aStyle.depth, bStyle.depth, t),
          color: Color.lerp(aStyle.color, bStyle.color, t),
          lightSource:
              LightSource.lerp(aStyle.lightSource, bStyle.lightSource, t),
        ));
  }

  @override
  bool get isComplex => true;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NeumorphismDecoration &&
          runtimeType == other.runtimeType &&
          style == other.style &&
          shape == other.shape &&
          splitBackgroundForeground == other.splitBackgroundForeground &&
          isForeground == other.isForeground &&
          renderingByPath == other.renderingByPath;

  @override
  int get hashCode =>
      style.hashCode ^
      shape.hashCode ^
      splitBackgroundForeground.hashCode ^
      isForeground.hashCode ^
      renderingByPath.hashCode;
}
