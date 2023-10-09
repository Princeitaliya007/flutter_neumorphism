
import '../flutter_neumorphism.dart';
import 'neumorphism_path_provider.dart';

class RRectPathProvider extends NeumorphismPathProvider {
  final BorderRadius borderRadius;

  const RRectPathProvider(this.borderRadius, {Listenable? reclip});

  @override
  bool shouldReclip(NeumorphismPathProvider oldClipper) {
    return true;
  }

  @override
  Path getPath(Size size) {
    return Path()
      ..addRRect(RRect.fromLTRBAndCorners(0, 0, size.width, size.height,
          topLeft: borderRadius.topLeft,
          topRight: borderRadius.topRight,
          bottomLeft: borderRadius.bottomLeft,
          bottomRight: borderRadius.bottomRight))
      ..close();
  }

  @override
  bool get oneGradientPerPath => false; //because only 1 path
}
