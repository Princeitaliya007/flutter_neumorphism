
import '../flutter_neumorphism.dart';
import 'button.dart';

const BoxConstraints _kSizeConstraints = BoxConstraints.tightFor(
  width: 56.0,
  height: 56.0,
);

const BoxConstraints _kMiniSizeConstraints = BoxConstraints.tightFor(
  width: 40.0,
  height: 40.0,
);

class NeumorphismFloatingActionButton extends StatelessWidget {
  final Widget? child;
  final NeumorphismButtonClickListener? onPressed;
  final bool mini;
  final String? tooltip;
  final NeumorphismStyle? style;

  const NeumorphismFloatingActionButton({
    Key? key,
    this.mini = false,
    this.style,
    this.tooltip,
    @required this.child,
    @required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: this.mini ? _kMiniSizeConstraints : _kSizeConstraints,
      child: NeumorphismButton(
        padding: EdgeInsets.all(0),
        onPressed: this.onPressed,
        tooltip: this.tooltip,
        style: this.style ??
            NeumorphismTheme.currentTheme(context).appBarTheme.buttonStyle,
        child: this.child,
      ),
    );
  }
}
