import 'package:example/playground/neumorphic_playground.dart';
import 'package:example/tips/tips_home.dart';
import 'package:example/widgets/widgets_home.dart';
import 'package:flutter_neumorphism/flutter_neumorphism.dart';
import 'accessibility/neumorphic_accessibility.dart';
import 'playground/text_playground.dart';
import 'samples/sample_home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return NeumorphismApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      title: 'Flutter Neumorphism',
      home: FullSampleHomePage(),
    );
  }
}

class FullSampleHomePage extends StatelessWidget {
  Widget _buildButton({String? text, VoidCallback? onClick}) {
    return NeumorphismButton(
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.symmetric(
        vertical: 18,
        horizontal: 24,
      ),
      style: NeumorphismStyle(
        boxShape: NeumorphismBoxShape.roundRect(
          BorderRadius.circular(12),
        ),
        //border: NeumorphismBorder(
        //  isEnabled: true,
        //  width: 0.3,
        //),
        shape: NeumorphismShape.flat,
      ),
      child: Center(child: Text(text!)),
      onPressed: onClick,
    );
  }

  @override
  Widget build(BuildContext context) {
    return NeumorphismTheme(
      theme: NeumorphismThemeData(depth: 8),
      child: Scaffold(
        backgroundColor: NeumorphismColors.background,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  _buildButton(
                    text: "Neumorphism Playground",
                    onClick: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return NeumorphismPlayground();
                      }));
                    },
                  ),
                  SizedBox(height: 24),
                  _buildButton(
                    text: "Text Playground",
                    onClick: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return NeumorphismTextPlayground();
                      }));
                    },
                  ),
                  SizedBox(height: 24),
                  _buildButton(
                      text: "Samples",
                      onClick: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return SamplesHome();
                        }));
                      }),
                  SizedBox(height: 24),
                  _buildButton(
                      text: "Widgets",
                      onClick: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return WidgetsHome();
                        }));
                      }),
                  SizedBox(height: 24),
                  _buildButton(
                      text: "Tips",
                      onClick: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return TipsHome();
                        }));
                      }),
                  SizedBox(height: 24),
                  _buildButton(
                      text: "Accessibility",
                      onClick: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return NeumorphismAccessibility();
                        }));
                      }),
                  SizedBox(height: 12),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
