import 'package:flutter/material.dart';
import 'package:flutter_neumorphism/flutter_neumorphism.dart';
import 'package:flutter_neumorphism/neumorphism_theme/light_source.dart';

class ButtonSample extends StatefulWidget {
  @override
  createState() => _ButtonSampleState();
}

class _ButtonSampleState extends State<ButtonSample> {
  @override
  Widget build(BuildContext context) {
    return NeumorphismTheme(
        themeMode: ThemeMode.light,
        theme: NeumorphismThemeData(
          baseColor: Color(0xFFFFFFFF),
          intensity: 0.5,
          lightSource: LightSource.topLeft,
          depth: 10,
        ),
        darkTheme: NeumorphismThemeData(
          baseColor: Color(0xFF000000),
          intensity: 0.5,
          lightSource: LightSource.topLeft,
          depth: 10,
        ),
        child: _Page());
  }
}

class _Page extends StatefulWidget {
  @override
  createState() => __PageState();
}

class __PageState extends State<_Page> {
  bool _useDark = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("back"),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _useDark = !_useDark;
                  NeumorphismTheme.of(context)?.themeMode =
                      _useDark ? ThemeMode.dark : ThemeMode.light;
                });
              },
              child: Text("toggle theme"),
            ),
            SizedBox(height: 34),
            _buildTopBar(context),
          ],
        ),
      ),
    );
  }

  Widget _buildTopBar(BuildContext context) {
    return Center(
      child: NeumorphismButton(
        onPressed: () {
          print("click");
        },
        style: NeumorphismStyle(
          shape: NeumorphismShape.flat,
          boxShape: NeumorphismBoxShape.circle(),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Icon(
            Icons.favorite_border,
            color: _iconsColor(),
          ),
        ),
      ),
    );
  }

  Color? _iconsColor() {
    final theme = NeumorphismTheme.of(context);
    if (theme!.isUsingDark) {
      return theme.current!.accentColor;
    } else {
      return null;
    }
  }
}
