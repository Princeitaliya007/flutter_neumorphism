import 'package:example/lib/Code.dart';
import 'package:example/lib/ThemeConfigurator.dart';
import 'package:example/lib/top_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphism/flutter_neumorphism.dart';
import 'package:flutter_neumorphism/neumorphism_theme/light_source.dart';

class RadioButtonWidgetPage extends StatefulWidget {
  RadioButtonWidgetPage({super.key});

  @override
  createState() => _WidgetPageState();
}

class _WidgetPageState extends State<RadioButtonWidgetPage> {
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
          title: "Radios",
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
              CircleRadios(),
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
  int? groupValue;

  Widget _buildCode(BuildContext context) {
    return Code("""
int groupValue;

NeumorphismRadio(
    groupValue: groupValue
    value: 1991,
    onChanged: (value) {
        setState(() {
          groupValue = value;
        });
    },
    child: Text("2012"),
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
          NeumorphismRadio(
            //uncomment to test colors
            //style: NeumorphismRadioStyle(
            //  selectedColor: Colors.black,
            //  unselectedColor: Colors.blue
            //),
            groupValue: groupValue,
            value: 1991,
            onChanged: (value) {
              setState(() {
                groupValue = value;
              });
            },
            padding: EdgeInsets.all(8.0),
            child: Text("1991"),
          ),
          SizedBox(width: 12),
          NeumorphismRadio(
            value: 2000,
            groupValue: groupValue,
            onChanged: (value) {
              setState(() {
                groupValue = value;
              });
            },
            padding: EdgeInsets.all(8.0),
            child: Text("2000"),
          ),
          SizedBox(width: 12),
          NeumorphismRadio(
            groupValue: groupValue,
            value: 2012,
            onChanged: (value) {
              setState(() {
                groupValue = value;
              });
            },
            padding: EdgeInsets.all(8.0),
            child: Text("2012"),
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

class CircleRadios extends StatefulWidget {
  @override
  createState() => _CircleRadiosState();
}

class _CircleRadiosState extends State<CircleRadios> {
  String? groupValue;

  Widget _buildCode(BuildContext context) {
    return Code("""
String groupValue;

NeumorphismRadio(
    groupValue: groupValue
    style: NeumorphismRadioStyle(boxShape: NeumorphismBoxShape.circle()),
    value: "A",
    onChanged: (value) {
        setState(() {
          groupValue = value;
        });
    },
    child: Text("A"),
),
""");
  }

  Widget _buildWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12),
      child: Row(
        children: <Widget>[
          Text(
            "Circle",
            style: TextStyle(color: NeumorphismTheme.defaultTextColor(context)),
          ),
          SizedBox(width: 12),
          NeumorphismRadio(
            style: NeumorphismRadioStyle(
              boxShape: NeumorphismBoxShape.circle(),
            ),
            groupValue: groupValue,
            value: "A",
            onChanged: (value) {
              setState(() {
                groupValue = value;
              });
            },
            padding: EdgeInsets.all(18.0),
            child: Text("A"),
          ),
          SizedBox(width: 12),
          NeumorphismRadio(
            value: "B",
            style: NeumorphismRadioStyle(
              boxShape: NeumorphismBoxShape.circle(),
            ),
            groupValue: groupValue,
            onChanged: (value) {
              setState(() {
                groupValue = value;
              });
            },
            padding: EdgeInsets.all(18.0),
            child: Text("B"),
          ),
          SizedBox(width: 12),
          NeumorphismRadio(
            style: NeumorphismRadioStyle(
              boxShape: NeumorphismBoxShape.circle(),
            ),
            groupValue: groupValue,
            value: "C",
            onChanged: (value) {
              setState(() {
                groupValue = value;
              });
            },
            padding: EdgeInsets.all(18.0),
            child: Text("C"),
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

class _EnabledDisabledWidget extends StatefulWidget {
  @override
  createState() => _EnabledDisabledWidgetState();
}

class _EnabledDisabledWidgetState extends State<_EnabledDisabledWidget> {
  int? groupValue;

  Widget _buildWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12),
      child: Row(
        children: <Widget>[
          Text(
            "Enabled :",
            style: TextStyle(color: NeumorphismTheme.defaultTextColor(context)),
          ),
          SizedBox(width: 12),
          NeumorphismRadio(
            groupValue: groupValue,
            value: 1,
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 18),
            child: Text("First"),
            onChanged: (value) {
              setState(() {
                groupValue = value;
              });
            },
          ),
          SizedBox(width: 24),
          Text(
            "Disabled :",
            style: TextStyle(color: NeumorphismTheme.defaultTextColor(context)),
          ),
          SizedBox(width: 12),
          NeumorphismRadio(
            isEnabled: false,
            groupValue: groupValue,
            value: 2,
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 18),
            child: Text("Second"),
            onChanged: (value) {
              setState(() {
                groupValue = value;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildCode(BuildContext context) {
    return Code("""    
int groupValue;

NeumorphismRadio(
     isEnabled: false,
     groupValue: groupValue,
     value: 2,
     onChanged: (value) {
       setState(() {
         isChecked = value;
       });
     },
     child: Text("Second"),
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
