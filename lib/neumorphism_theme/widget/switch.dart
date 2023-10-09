import 'package:flutter/widgets.dart';
import 'package:flutter_neumorphism/neumorphism_theme/widget/animation/animated_scale.dart'
    as animationScale;
import '../light_source.dart';
import '../neumorephism_theme.dart';
import '../neumorphism_box_shape.dart';
import '../shape.dart';
import '../theme.dart';
import 'container.dart';

/// A style to customize the [NeumorphismSwitch]
///
/// you can define the track : [activeTrackColor], [inactiveTrackColor], [trackDepth]
///
/// you can define the thumb : [activeTrackColor], [inactiveTrackColor], [thumbDepth]
/// and [thumbShape] @see [NeumorphicShape]
///
class NeumorphismSwitchStyle {
  final double? trackDepth;
  final Color? activeTrackColor;
  final Color? inactiveTrackColor;
  final Color? activeThumbColor;
  final Color? inactiveThumbColor;
  final NeumorphismShape? thumbShape;
  final double? thumbDepth;
  final LightSource? lightSource;
  final bool disableDepth;

  final NeumorphismBorder thumbBorder;
  final NeumorphismBorder trackBorder;

  const NeumorphismSwitchStyle({
    this.trackDepth,
    this.thumbShape = NeumorphismShape.concave,
    this.activeTrackColor,
    this.inactiveTrackColor,
    this.activeThumbColor,
    this.inactiveThumbColor,
    this.thumbDepth,
    this.lightSource,
    this.disableDepth = false,
    this.thumbBorder = const NeumorphismBorder.none(),
    this.trackBorder = const NeumorphismBorder.none(),
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NeumorphismSwitchStyle &&
          runtimeType == other.runtimeType &&
          trackDepth == other.trackDepth &&
          trackBorder == other.trackBorder &&
          thumbBorder == other.thumbBorder &&
          lightSource == other.lightSource &&
          activeTrackColor == other.activeTrackColor &&
          inactiveTrackColor == other.inactiveTrackColor &&
          activeThumbColor == other.activeThumbColor &&
          inactiveThumbColor == other.inactiveThumbColor &&
          thumbShape == other.thumbShape &&
          thumbDepth == other.thumbDepth &&
          disableDepth == other.disableDepth;

  @override
  int get hashCode =>
      trackDepth.hashCode ^
      activeTrackColor.hashCode ^
      trackBorder.hashCode ^
      thumbBorder.hashCode ^
      lightSource.hashCode ^
      inactiveTrackColor.hashCode ^
      activeThumbColor.hashCode ^
      inactiveThumbColor.hashCode ^
      thumbShape.hashCode ^
      thumbDepth.hashCode ^
      disableDepth.hashCode;
}

/// Used to toggle the on/off state of a single setting.
///
/// The switch itself does not maintain any state. Instead, when the state of the switch changes, the widget calls the onChanged callback.
/// Most widgets that use a switch will listen for the onChanged callback and rebuild the switch with a new value to update the visual appearance of the switch.
///
/// ```
///  bool _switch1Value = false;
///  bool _switch2Value = false;
///
///  Widget _buildSwitches() {
///    return Row(children: <Widget>[
///
///      NeumorphismSwitch(
///        value: _switch1Value,
///        style: NeumorphismSwitchStyle(
///          thumbShape: NeumorphicShape.concave,
///        ),
///        onChanged: (value) {
///          setState(() {
///            _switch1Value = value;
///          });
///        },
///      ),
///
///      NeumorphismSwitch(
///        value: _switch2Value,
///        style: NeumorphismSwitchStyle(
///          thumbShape: NeumorphicShape.flat,
///        ),
///        onChanged: (value) {
///          setState(() {
///            _switch2Value = value;
///          });
///        },
///      ),
///
///    ]);
///  }
///  ```
///
@immutable
class NeumorphismSwitch extends StatelessWidget {
  static const MIN_EMBOSS_DEPTH = -1.0;

  final bool value;
  final ValueChanged<bool>? onChanged;
  final NeumorphismSwitchStyle style;
  final double height;
  final Duration duration;
  final Curve curve;
  final bool isEnabled;

  const NeumorphismSwitch({
    this.style = const NeumorphismSwitchStyle(),
    Key? key,
    this.curve = Neumorphism.DEFAULT_CURVE,
    this.duration = const Duration(milliseconds: 200),
    this.value = false,
    this.onChanged,
    this.height = 40,
    this.isEnabled = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final NeumorphismThemeData theme = NeumorphismTheme.currentTheme(context);
    return SizedBox(
      height: height,
      child: AspectRatio(
        aspectRatio: 2 / 1,
        child: GestureDetector(
          onTap: () {
            // animation breaking prevention
            if (!isEnabled) {
              return;
            }
            if (onChanged != null) {
              onChanged!(!value);
            }
          },
          child: Neumorphism(
            drawSurfaceAboveChild: false,
            style: NeumorphismStyle(
              boxShape: NeumorphismBoxShape.stadium(),
              lightSource: style.lightSource ?? theme.lightSource,
              border: style.trackBorder,
              disableDepth: style.disableDepth,
              depth: _getTrackDepth(theme.depth),
              shape: NeumorphismShape.flat,
              color: _getTrackColor(theme, isEnabled),
            ),
            child: animationScale.AnimatedScale(
              scale: isEnabled ? 1 : 0,
              alignment: value ? Alignment(0.5, 0) : Alignment(-0.5, 0),
              child: AnimatedThumb(
                curve: curve,
                disableDepth: style.disableDepth,
                depth: _thumbDepth,
                duration: duration,
                alignment: _alignment,
                shape: _getThumbShape,
                lightSource: style.lightSource ?? theme.lightSource,
                border: style.thumbBorder,
                thumbColor: _getThumbColor(theme),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Alignment get _alignment {
    if (value) {
      return Alignment.centerRight;
    } else {
      return Alignment.centerLeft;
    }
  }

  double get _thumbDepth {
    if (!isEnabled) {
      return 0;
    } else
      return style.thumbDepth ?? neumorphismDefaultTheme.depth;
  }

  NeumorphismShape get _getThumbShape {
    return style.thumbShape ?? NeumorphismShape.flat;
  }

  double? _getTrackDepth(double? themeDepth) {
    if (themeDepth == null) return themeDepth;
    //force negative to have emboss
    final double depth = -1 * (style.trackDepth ?? themeDepth).abs();
    return depth.clamp(
        Neumorphism.MIN_DEPTH, NeumorphismSwitch.MIN_EMBOSS_DEPTH);
  }

  Color _getTrackColor(NeumorphismThemeData theme, bool enabled) {
    if (!enabled) {
      return style.inactiveTrackColor ?? theme.baseColor;
    }

    return value == true
        ? style.activeTrackColor ?? theme.accentColor
        : style.inactiveTrackColor ?? theme.baseColor;
  }

  Color _getThumbColor(NeumorphismThemeData theme) {
    Color? color =
        value == true ? style.activeThumbColor : style.inactiveThumbColor;
    return color ?? theme.baseColor;
  }
}

class AnimatedThumb extends StatelessWidget {
  final Color? thumbColor;
  final Alignment alignment;
  final Duration duration;
  final NeumorphismShape shape;
  final double? depth;
  final Curve curve;
  final bool disableDepth;
  final NeumorphismBorder border;
  final LightSource lightSource;

  AnimatedThumb({
    Key? key,
    this.thumbColor,
    required this.alignment,
    required this.duration,
    required this.shape,
    this.depth,
    this.curve = Curves.linear,
    this.border = const NeumorphismBorder.none(),
    this.lightSource = LightSource.topLeft,
    this.disableDepth = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // This Container is actually the inner track containing the thumb
    return AnimatedAlign(
      curve: curve,
      alignment: alignment,
      duration: duration,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Neumorphism(
          style: NeumorphismStyle(
            boxShape: NeumorphismBoxShape.circle(),
            disableDepth: disableDepth,
            shape: shape,
            depth: depth,
            color: thumbColor,
            border: border,
            lightSource: lightSource,
          ),
          child: AspectRatio(
            aspectRatio: 1,
            child: FractionallySizedBox(
              heightFactor: 1,
              child: Container(),
              //width: THUMB_WIDTH,
            ),
          ),
        ),
      ),
    );
  }
}
