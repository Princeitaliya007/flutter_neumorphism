import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_neumorphism/flutter_neumorphism.dart';
import 'package:flutter_neumorphism/neumorphism_theme/light_source.dart';

class AppBarWidgetPage extends StatelessWidget {
  AppBarWidgetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        _FirstThemeWidgetPage(),
        _SecondThemeWidgetPage(),
        _ThirdThemeWidgetPage(),
        _CustomIcon(),
      ],
    );
  }
}

class _FirstThemeWidgetPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NeumorphismTheme(
      themeMode: ThemeMode.light,
      theme: NeumorphismThemeData(
        lightSource: LightSource.topLeft,
        accentColor: NeumorphismColors.accent,
        appBarTheme: NeumorphismAppBarThemeData(
          buttonStyle: NeumorphismStyle(boxShape: NeumorphismBoxShape.circle()),
          textStyle: TextStyle(color: Colors.black54),
          iconTheme: IconThemeData(color: Colors.black54, size: 30),
        ),
        depth: 4,
        intensity: 0.9,
      ),
      child: AppBarPageUsingTheme(),
    );
  }
}

class _SecondThemeWidgetPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NeumorphismTheme(
      themeMode: ThemeMode.light,
      theme: NeumorphismThemeData(
        lightSource: LightSource.topLeft,
        accentColor: NeumorphismColors.accent,
        appBarTheme: NeumorphismAppBarThemeData(
          buttonStyle: NeumorphismStyle(
              boxShape: NeumorphismBoxShape.beveled(BorderRadius.circular(12))),
          textStyle: TextStyle(color: Colors.black54),
          iconTheme: IconThemeData(color: Colors.black54, size: 30),
        ),
        depth: 4,
        intensity: 0.9,
      ),
      child: AppBarPageUsingTheme(),
    );
  }
}

class _ThirdThemeWidgetPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NeumorphismTheme(
      themeMode: ThemeMode.light,
      theme: NeumorphismThemeData(
        lightSource: LightSource.topLeft,
        accentColor: NeumorphismColors.accent,
        appBarTheme: NeumorphismAppBarThemeData(
          buttonStyle: NeumorphismStyle(
              color: Colors.black54,
              boxShape:
                  NeumorphismBoxShape.roundRect(BorderRadius.circular(12))),
          textStyle: TextStyle(color: Colors.black54, fontSize: 20),
          iconTheme: IconThemeData(color: Colors.white, size: 20),
        ),
        depth: 4,
        intensity: 0.9,
      ),
      child: SizedAppBarPageUsingTheme(),
    );
  }
}

class AppBarPageUsingTheme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Scaffold(
          appBar: NeumorphismAppBar(
            title: Text("App bar"),
            actions: <Widget>[
              NeumorphismButton(
                child: Icon(Icons.add),
                onPressed: () {},
              ),
            ],
          ),
          body: Container()),
    );
  }
}

class SizedAppBarPageUsingTheme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(60.0),
            child: NeumorphismAppBar(
              title: Text("App bar custom size"),
              actions: <Widget>[
                NeumorphismButton(
                  child: Icon(Icons.add),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          body: Container()),
    );
  }
}

class FirstThemeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Scaffold(
          appBar: NeumorphismAppBar(
            title: Text("App bar"),
            actions: <Widget>[
              NeumorphismButton(
                child: Icon(Icons.add),
                onPressed: () {},
              ),
            ],
          ),
          body: Container()),
    );
  }
}

class _MyDrawer extends StatelessWidget {
  final bool isLead;

  const _MyDrawer({this.isLead = true, super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: NeumorphismTheme.baseColor(context),
        child: Column(
          children: [
            ConstrainedBox(
              constraints: BoxConstraints.tightFor(
                  height: NeumorphismAppBar.toolbarHeight),
              child: NeumorphismAppBar(
                title: Text('Menu'),
                leading:
                    isLead ? NeumorphismBackButton() : NeumorphismCloseButton(),
                actions: <Widget>[
                  NeumorphismButton(
                    child: Icon(Icons.style),
                    onPressed: () {},
                  ),
                  isLead
                      ? NeumorphismCloseButton()
                      : NeumorphismBackButton(forward: true),
                ],
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}

class _CustomIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: NeumorphismTheme(
        themeMode: ThemeMode.light,
        theme: NeumorphismThemeData(
          lightSource: LightSource.topLeft,
          accentColor: NeumorphismColors.accent,
          appBarTheme: NeumorphismAppBarThemeData(
              buttonStyle: NeumorphismStyle(
                boxShape: NeumorphismBoxShape.circle(),
                shape: NeumorphismShape.concave,
                depth: 10,
                intensity: 1,
              ),
              textStyle: TextStyle(color: Colors.black, fontSize: 20),
              iconTheme: IconThemeData(color: Colors.green, size: 25),
              icons: NeumorphismAppBarIcons(
                  menuIcon: Icon(Icons.list, color: Colors.pink),
                  closeIcon: Icon(Icons.delete),
                  backIcon: Icon(Icons.reply))),
          depth: 2,
          intensity: 0.5,
        ),
        child: Scaffold(
          appBar: NeumorphismAppBar(
            title: Text("Custom icons + drawer"),
          ),
          endDrawer: _MyDrawer(isLead: false),
          body: Container(),
        ),
      ),
    );
  }
}
