import 'package:example/lib/Code.dart';
import 'package:example/lib/ThemeConfigurator.dart';
import 'package:example/lib/top_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphism/flutter_neumorphism.dart';
import 'package:flutter_neumorphism/neumorphism_theme/light_source.dart';

class TipsBorderPage extends StatefulWidget {
  TipsBorderPage({super.key});

  @override
  createState() => _WidgetPageState();
}

class _WidgetPageState extends State<TipsBorderPage> {
  @override
  Widget build(BuildContext context) {
    return NeumorphismTheme(
      themeMode: ThemeMode.light,
      theme: NeumorphismThemeData(
        lightSource: LightSource.topLeft,
        accentColor: NeumorphismColors.accent,
        depth: 4,
        intensity: 0.6,
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
          title: "Border",
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
              _CustomWidget(
                title: "Emboss Inside Flat",
                firstStyle: NeumorphismStyle(
                  shape: NeumorphismShape.flat,
                  depth: 8,
                ),
                secondStyle: NeumorphismStyle(
                  depth: -8,
                ),
              ),
              _CustomWidget(
                title: "Emboss Inside Convex",
                firstStyle: NeumorphismStyle(
                  shape: NeumorphismShape.convex,
                  depth: 8,
                ),
                secondStyle: NeumorphismStyle(
                  depth: -8,
                ),
              ),
              _CustomWidget(
                title: "Emboss Inside Concave",
                firstStyle: NeumorphismStyle(
                  shape: NeumorphismShape.concave,
                  depth: 8,
                ),
                secondStyle: NeumorphismStyle(
                  depth: -8,
                ),
              ),
              _CustomWidget(
                title: "Flat Inside Emboss",
                firstStyle: NeumorphismStyle(
                  depth: -8,
                ),
                secondStyle: NeumorphismStyle(
                  depth: 8,
                  shape: NeumorphismShape.flat,
                ),
              ),
              _CustomWidget(
                title: "Convex Inside Emboss",
                firstStyle: NeumorphismStyle(
                  depth: -8,
                ),
                secondStyle: NeumorphismStyle(
                  depth: 8,
                  shape: NeumorphismShape.convex,
                ),
              ),
              _CustomWidget(
                title: "Concave Inside Emboss",
                firstStyle: NeumorphismStyle(
                  depth: -8,
                ),
                secondStyle: NeumorphismStyle(
                  depth: 8,
                  shape: NeumorphismShape.concave,
                ),
              ),
              _CustomWidget(
                title: "Concave Inside Convex",
                firstStyle: NeumorphismStyle(
                  depth: 8,
                  shape: NeumorphismShape.convex,
                ),
                secondStyle: NeumorphismStyle(
                  depth: 8,
                  shape: NeumorphismShape.concave,
                ),
              ),
              _CustomWidget(
                title: "Convex Inside Concave",
                firstStyle: NeumorphismStyle(
                  depth: 8,
                  shape: NeumorphismShape.concave,
                ),
                secondStyle: NeumorphismStyle(
                  depth: 8,
                  shape: NeumorphismShape.convex,
                ),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}

class _CustomWidget extends StatefulWidget {
  final String title;

  final NeumorphismStyle firstStyle;
  final NeumorphismStyle secondStyle;

  _CustomWidget(
      {required this.title,
      required this.firstStyle,
      required this.secondStyle});

  @override
  createState() => _CustomWidgetState();
}

class _CustomWidgetState extends State<_CustomWidget> {
  String _describe(NeumorphismStyle style) {
    return "NeumorphismStyle(depth: ${style.depth}, oppositeShadowLightSource: ${style.oppositeShadowLightSource}, ...)";
  }

  Widget _buildCode(BuildContext context) {
    return Code("""
Neumorphism(
      padding: EdgeInsets.all(20),
      boxShape: NeumorphismBoxShape.circle(),
      style: ${_describe(widget.firstStyle)},
      child: Neumorphism(
          boxShape: NeumorphismBoxShape.circle(),
          style: ${_describe(widget.secondStyle)},
          child: SizedBox(
            height: 100,
            width: 100,
          ),
      ),
    ),
""");
  }

  Widget _buildWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 12, right: 12),
                width: 100,
                child: Text(
                  widget.title,
                  style: TextStyle(
                      color: NeumorphismTheme.defaultTextColor(context)),
                ),
              ),
              Neumorphism(
                padding: EdgeInsets.all(20),
                style: widget.firstStyle.copyWith(
                  boxShape: NeumorphismBoxShape.circle(),
                ),
                child: Neumorphism(
                  style: widget.secondStyle.copyWith(
                    boxShape: NeumorphismBoxShape.circle(),
                  ),
                  child: SizedBox(
                    height: 100,
                    width: 100,
                  ),
                ),
              ),
              SizedBox(width: 12),
            ],
          ),
          SizedBox(height: 12),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 12, right: 12),
                width: 100,
                child: Text(
                  "opposite\nchild\nlightsource",
                  style: TextStyle(
                      color: NeumorphismTheme.defaultTextColor(context)),
                ),
              ),
              Neumorphism(
                padding: EdgeInsets.all(20),
                style: widget.firstStyle.copyWith(
                  boxShape: NeumorphismBoxShape.circle(),
                ),
                child: Neumorphism(
                  style: widget.secondStyle.copyWith(
                    boxShape: NeumorphismBoxShape.circle(),
                    oppositeShadowLightSource: true,
                  ),
                  child: SizedBox(
                    height: 100,
                    width: 100,
                  ),
                ),
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
