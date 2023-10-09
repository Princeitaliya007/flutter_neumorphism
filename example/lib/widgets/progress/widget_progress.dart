import 'package:example/lib/Code.dart';
import 'package:example/lib/color_selector.dart';
import 'package:example/lib/top_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphism/flutter_neumorphism.dart';

import 'dart:math' show Random;

import 'package:flutter_neumorphism/neumorphism_theme/light_source.dart';

class ProgressWidgetPage extends StatefulWidget {
  ProgressWidgetPage({super.key});

  @override
  createState() => _WidgetPageState();
}

class _WidgetPageState extends State<ProgressWidgetPage> {
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
          title: "Progress",
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
              _SizedWidget(),
              _DurationWidget(),
              _CurveWidget(),
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
  double percent = 0.2;

  Widget _buildCode(BuildContext context) {
    return Code("""
double percent = 0.2;  

Expanded(
  child: NeumorphismProgress(
      percent: percent,
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
            child: NeumorphismProgress(
              percent: percent,
            ),
          ),
          SizedBox(width: 12),
        ],
      ),
    );
  }

  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        _buildWidget(context),
        ElevatedButton(
            child: Text('Update'),
            onPressed: () {
              setState(() {
                percent = Random().nextDouble();
              });
            }),
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
  double percent = 0.5;

  Widget _buildCode(BuildContext context) {
    return Code("""
double percent = 0.5;  

Expanded(
  child: NeumorphismProgress(
      style: ProgressStyle(
           accent: Colors.green,
           variant: Colors.purple,
      ),
      percent: percent,
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
                child: NeumorphismProgress(
                  style: ProgressStyle(
                    accent: accent,
                    variant: variant,
                  ),
                  percent: percent,
                ),
              ),
              SizedBox(width: 12),
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

class _SizedWidget extends StatefulWidget {
  @override
  createState() => _SizedWidgetState();
}

class _SizedWidgetState extends State<_SizedWidget> {
  double percent = 0.5;

  Widget _buildCode(BuildContext context) {
    return Code("""
double percent = 0.5;  

Expanded(
  child: NeumorphismProgress(
      height: 30,
      percent: percent,
  ),
),
""");
  }

  Widget _buildWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12),
      child: Column(
        children: <Widget>[
          SizedBox(height: 12),
          Row(
            children: <Widget>[
              Text(
                "Sized",
                style: TextStyle(
                    color: NeumorphismTheme.defaultTextColor(context)),
              ),
              SizedBox(width: 12),
              Expanded(
                child: NeumorphismProgress(
                  height: 30,
                  percent: percent,
                ),
              ),
              SizedBox(width: 12),
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

class _DurationWidget extends StatefulWidget {
  @override
  createState() => _DurationWidgetState();
}

class _DurationWidgetState extends State<_DurationWidget> {
  double percent = 0.2;

  Widget _buildCode(BuildContext context) {
    return Code("""
double percent = 0.2;  

Expanded(
  child: NeumorphismProgress(
      percent: percent,
      duration: Duration(seconds: 1),
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
            "Duration",
            style: TextStyle(color: NeumorphismTheme.defaultTextColor(context)),
          ),
          SizedBox(width: 12),
          Expanded(
            child: NeumorphismProgress(
              percent: percent,
              duration: Duration(seconds: 1),
            ),
          ),
          SizedBox(width: 12),
        ],
      ),
    );
  }

  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        _buildWidget(context),
        ElevatedButton(
            child: Text('Update'),
            onPressed: () {
              setState(() {
                percent = Random().nextDouble();
              });
            }),
        _buildCode(context),
      ],
    );
  }
}

class _CurveWidget extends StatefulWidget {
  @override
  createState() => _CurveWidgetState();
}

class _CurveWidgetState extends State<_CurveWidget> {
  double percent = 0.2;

  Widget _buildCode(BuildContext context) {
    return Code("""
double percent = 0.2;  

Expanded(
  child: NeumorphismProgress(
      percent: percent,
      curve: Curves.bounceOut,
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
            "Curve",
            style: TextStyle(color: NeumorphismTheme.defaultTextColor(context)),
          ),
          SizedBox(width: 12),
          Expanded(
            child: NeumorphismProgress(
              percent: percent,
              curve: Curves.bounceOut,
            ),
          ),
          SizedBox(width: 12),
        ],
      ),
    );
  }

  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        _buildWidget(context),
        ElevatedButton(
            child: Text('Update'),
            onPressed: () {
              setState(() {
                percent = Random().nextDouble();
              });
            }),
        _buildCode(context),
      ],
    );
  }
}
