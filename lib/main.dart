import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:greenglide/screens/intro/screen1_haxk.dart';
import 'package:greenglide/utils/themes/theme_builder.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft])
      .then((_) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [])
        .then((value) => {runApp(const App())});
  });
}


class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Green Glide",
        theme: buildTheme(Brightness.dark),
        home: const HaxkIntro());
  }
}
