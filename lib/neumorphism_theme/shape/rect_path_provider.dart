
import '../flutter_neumorphism.dart';
import 'neumorphism_path_provider.dart';

class RectPathProvider extends NeumorphismPathProvider {
  const RectPathProvider({Listenable? reclip});

  @override
  bool shouldReclip(NeumorphismPathProvider oldClipper) {
    return true;
  }

  @override
  Path getPath(Size size) {
    return Path()
      ..addRect(Rect.fromLTWH(0, 0, size.width, size.height))
      ..close();
  }

  @override
  bool get oneGradientPerPath => false;
}
