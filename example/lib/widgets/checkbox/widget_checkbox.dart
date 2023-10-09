import 'package:example/lib/Code.dart';
import 'package:example/lib/ThemeConfigurator.dart';
import 'package:example/lib/color_selector.dart';
import 'package:example/lib/top_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphism/flutter_neumorphism.dart';
import 'package:flutter_neumorphism/neumorphism_theme/light_source.dart';

class CheckboxWidgetPage extends StatefulWidget {
  CheckboxWidgetPage({super.key});

  @override
  createState() => _WidgetPageState();
}

class _WidgetPageState extends State<CheckboxWidgetPage> {
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
          title: "Checkbox",
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
              _EnabledDisabledWidget(),
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
  bool check1 = false;
  bool check2 = false;
  bool check3 = false;

  Widget _buildCode(BuildContext context) {
    return Code("""
    
bool isChecked = false;  

NeumorphismCheckbox(
    value: isChecked,
    onChanged: (value) {
        setState(() {
          isChecked = value;
        });
    },
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
  Color customColor = Colors.green;

  bool checkColor1 = false;
  bool checkColor2 = false;
  bool checkColor3 = false;

  Widget _buildWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12),
      child: Row(
        children: <Widget>[
          Text(
            "Colorizable",
            style: TextStyle(color: NeumorphismTheme.defaultTextColor(context)),
          ),
          SizedBox(width: 12),
          ColorSelector(
            color: customColor,
            onColorChanged: (color) {
              setState(() {
                customColor = color;
              });
            },
          ),
          SizedBox(width: 12),
          NeumorphismCheckbox(
            style: NeumorphismCheckboxStyle(selectedColor: customColor),
            value: checkColor1,
            onChanged: (value) {
              setState(() {
                checkColor1 = value;
              });
            },
          ),
          SizedBox(width: 12),
          NeumorphismCheckbox(
            style: NeumorphismCheckboxStyle(selectedColor: customColor),
            value: checkColor2,
            onChanged: (value) {
              setState(() {
                checkColor2 = value;
              });
            },
          ),
          SizedBox(width: 12),
          NeumorphismCheckbox(
            value: checkColor3,
            style: NeumorphismCheckboxStyle(selectedColor: customColor),
            onChanged: (value) {
              setState(() {
                checkColor3 = value;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildCode(BuildContext context) {
    return Code("""
    
bool isChecked = false;  

NeumorphismCheckbox(
    value: isChecked,
    style: NeumorphismCheckboxStyle(
        selectedColor: Colors.green,
    ),
    onChanged: (value) {
        setState(() {
          isChecked = value;
        });
    },
),
""");
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

class _EnabledDisabledWidget extends StatefulWidget {
  @override
  createState() => _EnabledDisabledWidgetState();
}

class _EnabledDisabledWidgetState extends State<_EnabledDisabledWidget> {
  bool check1 = false;
  bool check2 = false;

  Widget _buildWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12),
      child: Row(
        children: <Widget>[
          Text(
            "Enabled",
            style: TextStyle(color: NeumorphismTheme.defaultTextColor(context)),
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
          SizedBox(width: 24),
          Text(
            "Disabled",
            style: TextStyle(color: NeumorphismTheme.defaultTextColor(context)),
          ),
          SizedBox(width: 12),
          NeumorphismCheckbox(
            isEnabled: false,
            value: check2,
            onChanged: (value) {
              setState(() {
                check2 = value;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildCode(BuildContext context) {
    return Code("""
    
bool isChecked = false;  

NeumorphismCheckbox(
     isEnabled: false,
     value: isChecked,
     onChanged: (value) {
       setState(() {
         isChecked = value;
       });
     },
),
""");
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
