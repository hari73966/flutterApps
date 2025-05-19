import 'package:dice/Gradient_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((fn) {
    runApp(
      /// The code `const MaterialApp(...)` is creating a MaterialApp widget, which is the root widget for
      /// a Flutter application. Inside the MaterialApp widget, there is a Scaffold widget defined as the
      /// home property. The Scaffold widget provides a basic structure for the visual layout of the app,
      /// and in this case, it contains a Text widget with the text 'hello world' as its body.
      const MaterialApp(
        home: Scaffold(
          /// The code `body: GradientContainer( Color.fromARGB(255, 5, 2, 80), Color.fromARGB(255, 5, 2,
          /// 80),),` is setting the body of the Scaffold widget to be a GradientContainer widget with a
          /// specific gradient color.
          body: GradientContainer(
            Color.fromARGB(255, 5, 2, 80),
            Color.fromARGB(255, 5, 2, 80),
          ),
        ),
      ),
    );
  });
}
