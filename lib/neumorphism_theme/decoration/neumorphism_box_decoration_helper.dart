import 'package:flutter/widgets.dart';

import '../colors.dart';
import '../light_source.dart';

Shader getGradientShader(
    {required Rect gradientRect,
    required LightSource source,
    double intensity = 0.25}) {
  var sourceInvert = source.invert();

  final currentIntensity = intensity * (3 / 5);

  final Gradient gradient = LinearGradient(
    begin: Alignment(source.dx, source.dy),
    end: Alignment(sourceInvert.dx, sourceInvert.dy),
    colors: <Color>[
      NeumorphismColors.gradientShaderDarkColor(intensity: currentIntensity),
      NeumorphismColors.gradientShaderWhiteColor(
          intensity: currentIntensity * (2 / 5)),
    ],
    stops: const [
      0,
      0.75, //was 1 but set to 0.75 to be less dark
    ],
  );

  return gradient.createShader(gradientRect);
}
