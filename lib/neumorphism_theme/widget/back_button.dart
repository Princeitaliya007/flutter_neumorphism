import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../neumorephism_theme.dart';
import 'button.dart';

class NeumorphismBackButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final NeumorphismStyle? style;
  final EdgeInsets? padding;
  final bool forward;

  const NeumorphismBackButton({
    Key? key,
    this.onPressed,
    this.style,
    this.padding,
    this.forward = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final nThemeIcons = NeumorphismTheme.of(context)!.current!.appBarTheme.icons;
    return NeumorphismButton(
      style: style,
      padding: padding,
      tooltip: MaterialLocalizations.of(context).backButtonTooltip,
      onPressed: onPressed ?? () => Navigator.maybePop(context),
      child: forward ? nThemeIcons.forwardIcon : nThemeIcons.backIcon,
    );
  }
}
