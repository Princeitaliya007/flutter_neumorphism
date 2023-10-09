import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'inherited_neumorphism_theme.dart';
import 'theme.dart';
import 'theme_wrapper.dart';

export 'inherited_neumorphism_theme.dart';
export 'theme.dart';
export 'theme_wrapper.dart';

/// The NeumorphismTheme (provider)
/// 1. Defines the used neumorphic theme used in child widgets
///
///   @see NeumorphismThemeData
///
///   NeumorphismTheme(
///     theme: NeumorphismThemeData(...),
///     darkTheme: NeumorphismThemeData(...),
///     currentTheme: CurrentTheme.LIGHT,
///     child: ...
///
/// 2. Provide by static methods the current theme
///
///   NeumorphismThemeData theme = NeumorphismTheme.getCurrentTheme(context);
///
/// 3. Provide by static methods the current theme's colors
///
///   Color baseColor = NeumorphismTheme.baseColor(context);
///   Color accent = NeumorphismTheme.accentColor(context);
///   Color variant = NeumorphismTheme.variantColor(context);
///
/// 4. Tells if the current theme is dark
///
///   bool dark = NeumorphismTheme.isUsingDark(context);
///
/// 5. Provides a way to update the current theme
///
///   NeumorphismTheme.of(context).updateCurrentTheme(
///     NeumorphismThemeData(
///       /* new values */
///     )
///   )
///
class NeumorphismTheme extends StatefulWidget {
  final NeumorphismThemeData theme;
  final NeumorphismThemeData darkTheme;
  final Widget child;
  final ThemeMode themeMode;

  NeumorphismTheme({
    Key? key,
    required this.child,
    this.theme = neumorphicDefaultTheme,
    this.darkTheme = neumorphicDefaultDarkTheme,
    this.themeMode = ThemeMode.system,
  });

  @override
  _NeumorphismThemeState createState() => _NeumorphismThemeState();

  static NeumorphismThemeInherited? of(BuildContext context) {
    try {
      return context
          .dependOnInheritedWidgetOfExactType<NeumorphismThemeInherited>();
    } catch (t) {
      return null;
    }
  }

  static void update(BuildContext context, NeumorphismThemeUpdater updater) {
    final theme = of(context);
    if (theme == null) return;
    return theme.update(updater);
  }

  static bool isUsingDark(BuildContext context) {
    final theme = of(context);
    if (theme == null) return false;
    return theme.isUsingDark;
  }

  static Color accentColor(BuildContext context) {
    return currentTheme(context).accentColor;
  }

  static Color baseColor(BuildContext context) {
    return currentTheme(context).baseColor;
  }

  static Color variantColor(BuildContext context) {
    return currentTheme(context).variantColor;
  }

  static Color disabledColor(BuildContext context) {
    return currentTheme(context).disabledColor;
  }

  static double? intensity(BuildContext context) {
    return currentTheme(context).intensity;
  }

  static double? depth(BuildContext context) {
    return currentTheme(context).depth;
  }

  static double? embossDepth(BuildContext context) {
    if (currentTheme(context).depth == null) return null;
    return -currentTheme(context).depth.abs();
  }

  static Color defaultTextColor(BuildContext context) {
    return currentTheme(context).defaultTextColor;
  }

  static NeumorphismThemeData currentTheme(BuildContext context) {
    final provider = NeumorphismTheme.of(context);
    if (provider == null) return neumorphicDefaultTheme;
    return provider.current == null
        ? neumorphicDefaultTheme
        : provider.current!;
  }
}

double applyThemeDepthEnable(
    {required BuildContext context,
      required bool styleEnableDepth,
      required double depth}) {
  final NeumorphismThemeData theme = NeumorphismTheme.currentTheme(context);
  return wrapDepthWithThemeData(
      themeData: theme, styleEnableDepth: styleEnableDepth, depth: depth);
}

double wrapDepthWithThemeData(
    {required NeumorphismThemeData themeData,
      required bool styleEnableDepth,
      required double depth}) {
  if (themeData.disableDepth) {
    return 0;
  } else {
    return depth;
  }
}

class _NeumorphismThemeState extends State<NeumorphismTheme> {
  late ThemeWrapper _themeHost;

  @override
  void initState() {
    super.initState();
    _themeHost = ThemeWrapper(
      theme: widget.theme,
      themeMode: widget.themeMode,
      darkTheme: widget.darkTheme,
    );
  }

  @override
  void didUpdateWidget(NeumorphismTheme oldWidget) {
    super.didUpdateWidget(oldWidget);
    setState(() {
      _themeHost = ThemeWrapper(
        theme: widget.theme,
        themeMode: widget.themeMode,
        darkTheme: widget.darkTheme,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return NeumorphismThemeInherited(
      value: _themeHost,
      onChanged: (value) {
        setState(() {
          _themeHost = value;
        });
      },
      child: widget.child,
    );
  }
}
