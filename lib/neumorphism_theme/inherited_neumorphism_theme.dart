import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'flutter_neumorphism.dart';
import 'theme.dart';
import 'theme_wrapper.dart';

export 'theme.dart';
export 'theme_wrapper.dart';

typedef NeumorphismThemeUpdater = NeumorphismThemeData Function(
    NeumorphismThemeData? current);

class NeumorphismThemeInherited extends InheritedWidget {
  final Widget child;
  final ThemeWrapper value;
  final ValueChanged<ThemeWrapper> onChanged;

  NeumorphismThemeInherited(
      {Key? key,
      required this.child,
      required this.value,
      required this.onChanged})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(NeumorphismThemeInherited old) => value != old.value;

  NeumorphismThemeData? get current {
    return this.value.current;
  }

  bool get isUsingDark {
    return value.useDark;
  }

  ThemeMode get themeMode => value.themeMode;

  set themeMode(ThemeMode currentTheme) {
    this.onChanged(value.copyWith(currentTheme: currentTheme));
  }

  void updateCurrentTheme(NeumorphismThemeData update) {
    if (value.useDark) {
      final newValue = value.copyWith(darkTheme: update);
      //this.value = newValue;
      this.onChanged(newValue);
    } else {
      final newValue = value.copyWith(theme: update);
      //this.value = newValue;
      this.onChanged(newValue);
    }
  }

  void update(NeumorphismThemeUpdater themeUpdater) {
    final update = themeUpdater(value.current);
    if (value.useDark) {
      final newValue = value.copyWith(darkTheme: update);
      //this.value = newValue;
      this.onChanged(newValue);
    } else {
      final newValue = value.copyWith(theme: update);
      //this.value = newValue;
      this.onChanged(newValue);
    }
  }
}
