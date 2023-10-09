import 'package:flutter/widgets.dart';
import '../light_source.dart';
import '../neumorephism_theme.dart';
import '../shape.dart';
import '../theme.dart';
import 'container.dart';
import 'progress.dart';

typedef void NeumorphismSliderListener(double percent);

/// A style to customize the [NeumorphismSlider]
///
/// the gradient will use [accent] and [variant]
///
/// the gradient shape will be a roundrect, using [borderRadius]
///
/// you can define a custom [depth] for the roundrect
///
@immutable
class SliderStyle {
  final double depth;
  final bool disableDepth;
  final BorderRadius borderRadius;
  final Color? accent;
  final Color? variant;
  final LightSource? lightSource;

  final NeumorphismBorder border;
  final NeumorphismBorder thumbBorder;

  const SliderStyle({
    this.depth = 0,
    this.disableDepth = false,
    this.borderRadius = const BorderRadius.all(Radius.circular(10)),
    this.accent,
    this.lightSource,
    this.variant,
    this.border = const NeumorphismBorder.none(),
    this.thumbBorder = const NeumorphismBorder.none(),
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SliderStyle &&
          runtimeType == other.runtimeType &&
          depth == other.depth &&
          disableDepth == other.disableDepth &&
          lightSource == other.lightSource &&
          borderRadius == other.borderRadius &&
          thumbBorder == other.thumbBorder &&
          border == other.border &&
          accent == other.accent &&
          variant == other.variant;

  @override
  int get hashCode =>
      depth.hashCode ^
      disableDepth.hashCode ^
      borderRadius.hashCode ^
      border.hashCode ^
      lightSource.hashCode ^
      thumbBorder.hashCode ^
      accent.hashCode ^
      variant.hashCode;
}

/// A Neumorphic Design slider.
///
/// Used to select from a range of values.
///
/// The default is to use a continuous range of values from min to max.
///
/// listeners : [onChanged], [onChangeStart], [onChangeEnd]
///
/// ```
///  //in a statefull widget
///
///  double seekValue = 0;
///
///  Widget _buildSlider() {
///    return Row(
///      children: <Widget>[
///
///        Flexible(
///          child: NeumorphismSlider(
///              height: 15,
///              value: seekValue,
///              min: 0,
///              max: 10,
///              onChanged: (value) {
///                setState(() {
///                  seekValue = value;
///                });
///              }),
///        ),
///
///        Text("value: ${seekValue.round()}"),
///
///      ],
///    );
///  }
///  ```
///
@immutable
class NeumorphismSlider extends StatefulWidget {
  final SliderStyle style;
  final double min;
  final double value;
  final double max;
  final double height;
  final NeumorphismSliderListener? onChanged;
  final NeumorphismSliderListener? onChangeStart;
  final NeumorphismSliderListener? onChangeEnd;

  final Widget? thumb;
  final double? sliderHeight;

  NeumorphismSlider({
    Key? key,
    this.style = const SliderStyle(),
    this.min = 0,
    this.value = 0,
    this.max = 10,
    this.height = 15,
    this.onChanged,
    this.onChangeStart,
    this.onChangeEnd,
    this.thumb,
    this.sliderHeight,
  });

  double get percent => (((value.clamp(min, max)) - min) / ((max - min)));

  @override
  createState() => _NeumorphismSliderState();
}

class _NeumorphismSliderState extends State<NeumorphismSlider> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return GestureDetector(
        onPanUpdate: (DragUpdateDetails details) {
          final tapPos = details.localPosition;
          final newPercent = tapPos.dx / constraints.maxWidth;
          final newValue =
              ((widget.min + (widget.max - widget.min) * newPercent))
                  .clamp(widget.min, widget.max);

          if (widget.onChanged != null) {
            widget.onChanged!(newValue);
          }
        },
        onPanStart: (DragStartDetails details) {
          if (widget.onChangeStart != null) {
            widget.onChangeStart!(widget.value);
          }
        },
        onPanEnd: (details) {
          if (widget.onChangeEnd != null) {
            widget.onChangeEnd!(widget.value);
          }
        },
        child: _widget(context),
      );
    });
  }

  Widget _widget(BuildContext context) {
    double thumbSize = widget.height * 1.5;
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: thumbSize / 2, right: thumbSize / 2),
          child: _generateSlider(context),
        ),
        Align(
            alignment: Alignment(
                //because left = -1 & right = 1, so the "width" = 2, and minValue = 1
                (widget.percent * 2) - 1,
                0),
            child: widget.thumb ?? _generateThumb(context, thumbSize))
      ],
    );
  }

  Widget _generateSlider(BuildContext context) {
    final theme = NeumorphismTheme.currentTheme(context);
    return NeumorphismProgress(
      duration: Duration.zero,
      percent: widget.percent,
      height: widget.height,
      style: ProgressStyle(
        disableDepth: widget.style.disableDepth,
        depth: widget.style.depth,
        border: widget.style.border,
        lightSource: widget.style.lightSource ?? theme.lightSource,
        borderRadius: widget.style.borderRadius,
        accent: widget.style.accent ?? theme.accentColor,
        variant: widget.style.variant ?? theme.variantColor,
      ),
    );
  }

  Widget _generateThumb(BuildContext context, double size) {
    final theme = NeumorphismTheme.currentTheme(context);
    return Neumorphism(
      style: NeumorphismStyle(
        disableDepth: widget.style.disableDepth,
        shape: NeumorphismShape.concave,
        border: widget.style.thumbBorder,
        lightSource: widget.style.lightSource ?? theme.lightSource,
        color: widget.style.accent ?? theme.accentColor,
        boxShape: NeumorphicBoxShape.circle(),
      ),
      child: SizedBox(
        height: size,
        width: size,
      ),
    );
  }
}
