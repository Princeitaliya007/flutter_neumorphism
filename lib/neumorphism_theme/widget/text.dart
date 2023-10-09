import 'dart:ui' as ui show FontFeature;

import 'package:flutter/material.dart' as material;
import 'package:flutter/widgets.dart';
import '../decoration/neumorphism_text_decorations.dart';
import '../neumorephism_theme.dart';
import '../theme.dart';
import 'container.dart';

export '../decoration/neumorphism_decorations.dart';
export '../neumorphism_box_shape.dart';

class NeumorphismTextStyle {
  final bool inherit;
  final double? fontSize;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final double? letterSpacing;
  final double? wordSpacing;
  final TextBaseline? textBaseline;
  final double? height;
  final Locale? locale;
  final List<ui.FontFeature>? fontFeatures;
  final TextDecoration? decoration;
  final String? debugLabel;
  final String? fontFamily;
  final List<String>? fontFamilyFallback;
  final String? package;
  //final Color color;
  //final Color backgroundColor;
  //final Paint foreground,
  //final Paint background,
  //final TextDecoration decoration,
  //final Color decorationColor;
  //final TextDecorationStyle decorationStyle;
  //final double decorationThickness;

  TextStyle get textStyle => TextStyle(
        inherit: inherit,
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontStyle: fontStyle,
        letterSpacing: letterSpacing,
        wordSpacing: wordSpacing,
        textBaseline: textBaseline,
        height: height,
        locale: locale,
        fontFeatures: fontFeatures,
        decoration: decoration,
        debugLabel: debugLabel,
        fontFamily: fontFamily,
        fontFamilyFallback: fontFamilyFallback,
        package: package,
        //color: color,
        //backgroundColor: backgroundColor,
        //foreground: foreground,
        //background: background,
        //decoration: decoration,
        //decorationColor: decorationColor,
        //decorationStyle: decorationStyle,
        //decorationThickness: decorationThickness,
      );

  /// Creates a text style.
  ///
  /// The `package` argument must be non-null if the font family is defined in a
  /// package. It is combined with the `fontFamily` argument to set the
  /// [fontFamily] property.
  NeumorphismTextStyle({
    this.inherit = true,
    this.fontSize,
    this.fontWeight,
    this.fontStyle,
    this.letterSpacing,
    this.wordSpacing,
    this.textBaseline,
    this.height,
    this.locale,
    this.fontFeatures,
    this.decoration,
    this.debugLabel,
    this.fontFamily,
    //this.color,
    //this.backgroundColor,
    //this.foreground,
    //this.background,
    //this.decoration,
    //this.decorationColor,
    //this.decorationStyle,
    //this.decorationThickness,
    this.fontFamilyFallback,
    this.package,
  });

  NeumorphismTextStyle copyWith({
    bool? inherit,
    String? fontFamily,
    List<String>? fontFamilyFallback,
    double? fontSize,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    double? letterSpacing,
    double? wordSpacing,
    TextBaseline? textBaseline,
    double? height,
    Locale? locale,
    List<ui.FontFeature>? fontFeatures,
    String? debugLabel,
    //Color color,
    //Color backgroundColor,
    //Paint foreground,
    //Paint background,
    //TextDecoration decoration,
    //Color decorationColor,
    //TextDecorationStyle decorationStyle,
    //double decorationThickness,
  }) {
    return NeumorphismTextStyle(
      inherit: inherit ?? this.inherit,
      fontFamily: fontFamily ?? this.fontFamily,
      fontFamilyFallback: fontFamilyFallback ?? this.fontFamilyFallback,
      fontSize: fontSize ?? this.fontSize,
      fontWeight: fontWeight ?? this.fontWeight,
      fontStyle: fontStyle ?? this.fontStyle,
      letterSpacing: letterSpacing ?? this.letterSpacing,
      wordSpacing: wordSpacing ?? this.wordSpacing,
      textBaseline: textBaseline ?? this.textBaseline,
      height: height ?? this.height,
      locale: locale ?? this.locale,
      fontFeatures: fontFeatures ?? this.fontFeatures,
      debugLabel: debugLabel ?? this.debugLabel,
      //color: this.foreground == null && foreground == null ? color ?? this.color : null,
      //backgroundColor: this.background == null && background == null ? backgroundColor ?? this.backgroundColor : null,
      //foreground: foreground ?? this.foreground,
      //background: background ?? this.background,
      //shadows: shadows ?? this.shadows,
      //decoration: decoration ?? this.decoration,
      //decorationColor: decorationColor ?? this.decorationColor,
      //decorationStyle: decorationStyle ?? this.decorationStyle,
      //decorationThickness: decorationThickness ?? this.decorationThickness,
    );
  }
}

@immutable
class NeumorphismText extends StatelessWidget {
  final String text;
  final NeumorphismStyle? style;
  final TextAlign textAlign;
  final NeumorphismTextStyle? textStyle;
  final Curve curve;
  final Duration duration;

  NeumorphismText(
    this.text, {
    Key? key,
    this.duration = Neumorphism.DEFAULT_DURATION,
    this.curve = Neumorphism.DEFAULT_CURVE,
    this.style,
    this.textAlign = TextAlign.center,
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = NeumorphismTheme.currentTheme(context);
    final NeumorphismStyle style = (this.style ?? NeumorphismStyle())
        .copyWithThemeIfNull(theme)
        .applyDisableDepth();

    return _NeumorphismText(
      textStyle: (textStyle ?? NeumorphismTextStyle()).textStyle,
      textAlign: textAlign,
      text: text,
      duration: duration,
      style: style,
      curve: curve,
    );
  }
}

class _NeumorphismText extends material.StatefulWidget {
  final String text;

  final NeumorphismStyle style;
  final TextStyle textStyle;
  final Duration duration;
  final Curve curve;

  final TextAlign textAlign;

  _NeumorphismText({
    Key? key,
    required this.duration,
    required this.curve,
    required this.textAlign,
    required this.style,
    required this.textStyle,
    required this.text,
  }) : super(key: key);

  @override
  __NeumorphismTextState createState() => __NeumorphismTextState();
}

class __NeumorphismTextState extends material.State<_NeumorphismText> {
  @override
  Widget build(BuildContext context) {
    final TextPainter _textPainter = TextPainter(
        textDirection: TextDirection.ltr, textAlign: widget.textAlign);
    final textStyle = widget.textStyle;
    _textPainter.text = TextSpan(
      text: widget.text,
      style: widget.textStyle,
    );

    return LayoutBuilder(builder: (context, constraints) {
      _textPainter.layout(minWidth: 0, maxWidth: constraints.maxWidth);
      final double width = _textPainter.width;
      final double height = _textPainter.height;

      return DefaultTextStyle(
        style: textStyle,
        child: AnimatedContainer(
          duration: widget.duration,
          curve: widget.curve,
          foregroundDecoration: NeumorphismTextDecoration(
            isForeground: true,
            textStyle: textStyle,
            textAlign: widget.textAlign,
            renderingByPath: true,
            style: widget.style,
            text: widget.text,
          ),
          child: SizedBox(
            width: width,
            height: height,
          ),
        ),
      );
    });
  }
}
