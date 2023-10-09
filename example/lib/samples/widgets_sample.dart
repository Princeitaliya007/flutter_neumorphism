import 'package:flutter/material.dart';
import 'package:flutter_neumorphism/flutter_neumorphism.dart';
import 'package:flutter_neumorphism/neumorphism_theme/light_source.dart';

class WidgetsSample extends StatefulWidget {
  WidgetsSample({super.key});

  @override
  createState() => _ContainersListPageState();
}

class _ContainersListPageState extends State<WidgetsSample> {
  int? _groupValue;
  bool _switchConcaveEnabled = false;
  bool _switchConvexEnabled = false;
  bool _switchFlatEnabled = false;

  bool useDark = false;

  Color _textColor() {
    if (useDark)
      return Colors.white70;
    else {
      return Colors.black;
    }
  }

  Widget _buildProgress() {
    return Row(
      children: <Widget>[
        Text(
          "Progress",
          style: TextStyle(color: _textColor()),
        ),
        SizedBox(width: 12),
        Flexible(
          child: NeumorphismProgress(
            height: 15,
            percent: 0.55,
          ),
        ),
        SizedBox(width: 12),
      ],
    );
  }

  Widget _buildIndeterminateProgress() {
    return Row(
      children: <Widget>[
        Text(
          "Progress",
          style: TextStyle(color: _textColor()),
        ),
        SizedBox(width: 12),
        Flexible(
          child: NeumorphismProgressIndeterminate(
            height: 10,
          ),
        ),
        SizedBox(width: 12),
      ],
    );
  }

  Widget _buildButtons() {
    return Row(
      children: <Widget>[
        Text(
          "Buttons",
          style: TextStyle(color: _textColor()),
        ),
        SizedBox(width: 4),
        NeumorphismButton(
          style: NeumorphismStyle(
            shape: NeumorphismShape.flat,
            boxShape: NeumorphismBoxShape.stadium(),
          ),
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 18),
          child: Text(
            "button 1",
            style: TextStyle(color: _textColor()),
          ),
          onPressed: () {
            setState(() {
              useDark = !useDark;
            });
          },
        ),
        SizedBox(width: 10),
        NeumorphismButton(
          style: NeumorphismStyle(
            shape: NeumorphismShape.flat,
            boxShape: NeumorphismBoxShape.stadium(),
          ),
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 18),
          child: Text(
            "button 2",
            style: TextStyle(color: _textColor()),
          ),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildRadios() {
    return Row(
      children: <Widget>[
        Text(
          "Radio",
          style: TextStyle(color: _textColor()),
        ),
        SizedBox(width: 12),
        NeumorphismRadio(
          child: SizedBox(
            height: 50,
            width: 50,
            child: Center(
              child: Text(
                "1",
                style: TextStyle(color: _textColor()),
              ),
            ),
          ),
          value: 1,
          groupValue: _groupValue,
          onChanged: (value) {
            setState(() {
              _groupValue = value;
            });
          },
        ),
        SizedBox(width: 12),
        NeumorphismRadio(
          child: SizedBox(
            height: 50,
            width: 50,
            child: Center(
              child: Text(
                "2",
                style: TextStyle(color: _textColor()),
              ),
            ),
          ),
          value: 2,
          groupValue: _groupValue,
          onChanged: (value) {
            setState(() {
              _groupValue = value;
            });
          },
        ),
        SizedBox(width: 12),
        NeumorphismRadio(
          child: SizedBox(
            height: 50,
            width: 50,
            child: Center(
              child: Text(
                "3",
                style: TextStyle(color: _textColor()),
              ),
            ),
          ),
          value: 3,
          groupValue: _groupValue,
          onChanged: (value) {
            setState(() {
              _groupValue = value;
            });
          },
        ),
      ],
    );
  }

  bool check1 = false;
  bool check2 = false;
  bool check3 = false;

  Widget _buildChecks() {
    return Row(
      children: <Widget>[
        Text(
          "Checkbox",
          style: TextStyle(color: _textColor()),
        ),
        SizedBox(width: 12),
        NeumorphismCheckbox(
          value: check1,
          onChanged: (value) {
            setState(() {
              check1 = value;
            });
          },
        ),
        SizedBox(width: 12),
        NeumorphismCheckbox(
          value: check2,
          onChanged: (value) {
            setState(() {
              check2 = value;
            });
          },
        ),
        SizedBox(width: 12),
        NeumorphismCheckbox(
          value: check3,
          onChanged: (value) {
            setState(() {
              check3 = value;
            });
          },
        ),
      ],
    );
  }

  Widget _buildIndicators() {
    final width = 14.0;
    return SizedBox(
      height: 130,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          NeumorphismIndicator(
            width: width,
            percent: 0.4,
          ),
          SizedBox(width: 10),
          NeumorphismIndicator(
            width: width,
            percent: 0.2,
          ),
          SizedBox(width: 10),
          NeumorphismIndicator(
            width: width,
            percent: 0.5,
          ),
          SizedBox(width: 10),
          NeumorphismIndicator(
            width: width,
            percent: 1,
          ),
          SizedBox(width: 10),
          NeumorphismIndicator(
            width: width,
            percent: 0.4,
          ),
          SizedBox(width: 10),
          NeumorphismIndicator(
            width: width,
            percent: 0.2,
          ),
          SizedBox(width: 10),
          NeumorphismIndicator(
            width: width,
            percent: 0.5,
          ),
          SizedBox(width: 10),
          NeumorphismIndicator(
            width: width,
            percent: 1,
          ),
        ],
      ),
    );
  }

  double seekValue = 0;

  Widget _buildSlider() {
    return Row(
      children: <Widget>[
        Text(
          "Slider",
          style: TextStyle(color: _textColor()),
        ),
        SizedBox(width: 12),
        Flexible(
          child: NeumorphismSlider(
              height: 15,
              value: seekValue,
              min: 0,
              max: 10,
              onChanged: (value) {
                setState(() {
                  seekValue = value;
                });
              }),
        ),
        SizedBox(width: 12),
        Text(
          "value: ${seekValue.round()}",
          style: TextStyle(color: _textColor()),
        ),
        SizedBox(width: 12),
      ],
    );
  }

  Widget _buildSwitches() {
    return Row(children: <Widget>[
      Text(
        "Switch",
        style: TextStyle(color: _textColor()),
      ),
      SizedBox(width: 15),
      NeumorphismSwitch(
        value: _switchConcaveEnabled,
        style: NeumorphismSwitchStyle(
          thumbShape:
              NeumorphismShape.concave, // concave or flat with elevation
        ),
        onChanged: (value) {
          setState(() {
            _switchConcaveEnabled = value;
          });
        },
      ),
      SizedBox(width: 15),
      NeumorphismSwitch(
        value: _switchFlatEnabled,
        style: NeumorphismSwitchStyle(
          thumbShape: NeumorphismShape.flat, // concave or flat with elevation
        ),
        onChanged: (value) {
          setState(() {
            _switchFlatEnabled = value;
          });
        },
      ),
      SizedBox(width: 15),
      NeumorphismSwitch(
        value: _switchConvexEnabled,
        style: NeumorphismSwitchStyle(
          thumbShape: NeumorphismShape.convex,
        ),
        onChanged: (value) {
          setState(() {
            _switchConvexEnabled = value;
          });
        },
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return NeumorphismTheme(
      themeMode: useDark ? ThemeMode.dark : ThemeMode.light,
      darkTheme: NeumorphismThemeData(
        baseColor: NeumorphismColors.darkBackground,
        accentColor: NeumorphismColors.darkAccent,
        lightSource: LightSource.topLeft,
        depth: 6,
        intensity: 0.3,
      ),
      theme: NeumorphismThemeData(
        baseColor: NeumorphismColors.background,
        lightSource: LightSource.topLeft,
        depth: 10,
        intensity: 0.5,
      ),
      child: Scaffold(
        body: FractionallySizedBox(
          //match parent height
          heightFactor: 1,
          child: NeumorphismBackground(
            //margin: EdgeInsets.all(10),
            //borderRadius: BorderRadius.circular(40),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Stack(
                    children: <Widget>[
                      Neumorphism(
                        child: AppBar(
                          iconTheme: IconThemeData.fallback(),
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                          title: Text(
                            "Widgets",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        style: NeumorphismStyle(depth: -8),
                      ),
                      /*
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: NeumorphismButton(
                          onClick: (){
                            setState(() {
                              useDark = !useDark;
                            });
                          },
                          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                          child: Text(useDark ? "Dark" : "Light"),
                        ),
                      )
                       */
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        SizedBox(height: 30),
                        _buildProgress(),
                        SizedBox(height: 12),
                        _buildIndeterminateProgress(),
                        SizedBox(height: 30),
                        _buildButtons(),
                        SizedBox(height: 30),
                        _buildRadios(),
                        SizedBox(height: 30),
                        _buildIndicators(),
                        SizedBox(height: 30),
                        _buildChecks(),
                        SizedBox(height: 30),
                        _buildSlider(),
                        SizedBox(height: 30),
                        _buildSwitches(),
                        SizedBox(height: 30),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
