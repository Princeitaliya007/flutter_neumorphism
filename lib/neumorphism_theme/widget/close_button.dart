import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../neumorephism_theme.dart';
import '../theme.dart';
import 'button.dart';

class NeumorphismCloseButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final NeumorphismStyle? style;
  final EdgeInsets? padding;

  const NeumorphismCloseButton({
    Key? key,
    this.onPressed,
    this.style,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final nThemeIcons = NeumorphismTheme.of(context)!.current!.appBarTheme.icons;
    return NeumorphismButton(
      style: style,
      padding: padding,
      tooltip: MaterialLocalizations.of(context).closeButtonTooltip,
      onPressed: onPressed ?? () => Navigator.maybePop(context),
      child: nThemeIcons.closeIcon,
    );
  }
}
