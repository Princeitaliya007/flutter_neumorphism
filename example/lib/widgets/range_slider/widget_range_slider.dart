import 'package:example/lib/Code.dart';
import 'package:example/lib/ThemeConfigurator.dart';
import 'package:example/lib/color_selector.dart';
import 'package:example/lib/top_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphism/flutter_neumorphism.dart';
import 'package:flutter_neumorphism/neumorphism_theme/light_source.dart';

class RangeSliderWidgetPage extends StatefulWidget {
  RangeSliderWidgetPage({super.key});

  @override
  createState() => _RangeWidgetPageState();
}

class _RangeWidgetPageState extends State<RangeSliderWidgetPage> {
  @override
  Widget build(BuildContext context) {
    return NeumorphismTheme(
      themeMode: ThemeMode.light,
      theme: NeumorphismThemeData(
        lightSource: LightSource.topLeft,
        accentColor: NeumorphismColors.accent,
        depth: 4,
        intensity: 0.5,
      ),
      child: _Page(),
    );
  }
}

class _Page extends StatefulWidget {
  @override
  createState() => _PageState();
}

class _PageState extends State<_Page> {
  @override
  Widget build(BuildContext context) {
    return NeumorphismBackground(
      padding: EdgeInsets.all(8),
      child: Scaffold(
        appBar: TopBar(
          title: "Range Slider",
          actions: <Widget>[
            ThemeConfigurator(),
          ],
        ),
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              _DefaultWidget(),
              _ColorWidget(),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}

class _DefaultWidget extends StatefulWidget {
  @override
  createState() => _DefaultWidgetState();
}

class _DefaultWidgetState extends State<_DefaultWidget> {
  double lowVal = 30;
  double highVal = 70;

  Widget _buildCode(BuildContext context) {
    return Code("""
  double lowVal = 30;
  double highVal = 70;

  Expanded(
    child: NeumorphismRangeSlider(
      valueLow: lowVal,
      valueHigh: highVal,
      min: 18,
      max: 90,
      onChangedLow: (value) {
        setState(() {
          lowVal = value;
        });
      },
      onChangeHigh: (value) {
        setState(() {
          highVal = value;
        });
      },
    ),
  ),
""");
  }

  Widget _buildWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12),
      child: Row(
        children: <Widget>[
          Text(
            "Default",
            style: TextStyle(color: NeumorphismTheme.defaultTextColor(context)),
          ),
          SizedBox(width: 12),
          Expanded(
            child: NeumorphismRangeSlider(
              valueLow: lowVal,
              valueHigh: highVal,
              min: 18,
              max: 90,
              onChangedLow: (value) {
                setState(() {
                  lowVal = value;
                });
              },
              onChangeHigh: (value) {
                setState(() {
                  highVal = value;
                });
              },
            ),
          ),
          SizedBox(width: 12),
          Text(
            "${lowVal.round()} - ${highVal.round()}",
            style: TextStyle(color: NeumorphismTheme.defaultTextColor(context)),
          ),
        ],
      ),
    );
  }

  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        _buildWidget(context),
        _buildCode(context),
      ],
    );
  }
}

class _ColorWidget extends StatefulWidget {
  @override
  createState() => _ColorWidgetState();
}

class _ColorWidgetState extends State<_ColorWidget> {
  double lowVal = 30;
  double highVal = 80;

  Widget _buildCode(BuildContext context) {
    return Code("""
double lowVal = 30;
double highVal = 80;

  Expanded(
    child: NeumorphismRangeSlider(
      style: RangeSliderStyle(
        accent: accent,
        variant: variant,
      ),
      valueLow: lowVal,
      valueHigh: highVal,
      min: 18,
      max: 90,
      onChangedLow: (value) {
        setState(() {
          lowVal = value;
        });
      },
      onChangeHigh: (value) {
        setState(() {
          highVal = value;
        });
      },
    ),
  ),
),
""");
  }

  Color accent = Colors.green;
  Color variant = Colors.purple;

  Widget _buildWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Text("Accent : "),
              ColorSelector(
                onColorChanged: (color) {
                  setState(() {
                    accent = color;
                  });
                },
                color: accent,
              ),
              SizedBox(width: 12),
              Text("Variant : "),
              ColorSelector(
                onColorChanged: (color) {
                  setState(() {
                    variant = color;
                  });
                },
                color: variant,
              ),
            ],
          ),
          SizedBox(height: 12),
          Row(
            children: <Widget>[
              Text(
                "Default",
                style: TextStyle(
                    color: NeumorphismTheme.defaultTextColor(context)),
              ),
              SizedBox(width: 12),
              Expanded(
                child: NeumorphismRangeSlider(
                  style: RangeSliderStyle(
                    accent: accent,
                    variant: variant,
                  ),
                  valueLow: lowVal,
                  valueHigh: highVal,
                  min: 18,
                  max: 90,
                  onChangedLow: (value) {
                    setState(() {
                      lowVal = value;
                    });
                  },
                  onChangeHigh: (value) {
                    setState(() {
                      highVal = value;
                    });
                  },
                ),
              ),
              SizedBox(width: 12),
              Text(
                "${lowVal.round()} - ${highVal.round()}",
                style: TextStyle(
                    color: NeumorphismTheme.defaultTextColor(context)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        _buildWidget(context),
        _buildCode(context),
      ],
    );
  }
}
