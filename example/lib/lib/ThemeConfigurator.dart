import 'package:flutter/material.dart';
import 'package:flutter_neumorphism/flutter_neumorphism.dart';

import 'ThemeColorSelector.dart';

class ThemeConfigurator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NeumorphismButton(
      padding: EdgeInsets.all(18),
      style: NeumorphismStyle(
        shape: NeumorphismShape.flat,
        boxShape: NeumorphismBoxShape.circle(),
      ),
      child: Icon(
        Icons.settings,
        color: NeumorphismTheme.isUsingDark(context)
            ? Colors.white70
            : Colors.black87,
      ),
      onPressed: () {
        _changeColor(context);
      },
    );
  }

  void _changeColor(BuildContext context) {
    showDialog(
        useRootNavigator: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Update Theme'),
            content: SingleChildScrollView(
              child: _ThemeConfiguratorDialog(contextContainingTheme: context),
            ),
            actions: <Widget>[
              NeumorphismButton(
                child: const Text('Close'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }
}

class _ThemeConfiguratorDialog extends StatefulWidget {
  final BuildContext contextContainingTheme;

  _ThemeConfiguratorDialog({required this.contextContainingTheme});

  @override
  _ThemeConfiguratorState createState() => _ThemeConfiguratorState();
}

class _ThemeConfiguratorState extends State<_ThemeConfiguratorDialog> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ThemeColorSelector(
          customContext: widget.contextContainingTheme,
        ),
        intensitySelector(),
        depthSelector(),
      ],
    );
  }

  Widget intensitySelector() {
    final intensity = NeumorphismTheme.intensity(widget.contextContainingTheme);
    return Row(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 12),
          child: Text("Intensity"),
        ),
        Expanded(
          child: Slider(
            min: Neumorphism.MIN_INTENSITY, //in case of != 0
            max: Neumorphism.MAX_INTENSITY,
            value: intensity!,
            onChanged: (value) {
              setState(() {
                NeumorphismTheme.update(
                  widget.contextContainingTheme,
                  (current) => current!.copyWith(
                    intensity: value,
                  ),
                );
              });
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 12),
          child: Container(
            width: 40,
            child: Text(((intensity * 100).floor() / 100).toString()),
          ),
        ),
      ],
    );
  }

  Widget depthSelector() {
    final depth = NeumorphismTheme.depth(widget.contextContainingTheme);

    return Row(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 12),
          child: Text("Depth"),
        ),
        Expanded(
          child: Slider(
            min: Neumorphism.MIN_DEPTH,
            max: Neumorphism.MAX_DEPTH,
            value: depth!,
            onChanged: (value) {
              setState(() {
                NeumorphismTheme.update(
                  widget.contextContainingTheme,
                  (current) => current!.copyWith(depth: value),
                );
              });
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 12),
          child: Container(
            width: 40,
            child: Text(depth.floor().toString()),
          ),
        ),
      ],
    );
  }
}
