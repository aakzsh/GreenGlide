import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:greenglide/screens/intro/screen1_haxk.dart';
import 'package:greenglide/screens/intro/screen2_flutter.dart';
import 'package:greenglide/screens/intro/screen3_greenglide.dart';
void main()  {
   WidgetsFlutterBinding.ensureInitialized();
   SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft])
   .then((_) {
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []

    ).then((value) => {
      runApp(const App())
    });
  });
}


ThemeData _buildTheme(brightness) {
  var baseTheme = ThemeData(brightness: brightness);

  return baseTheme.copyWith(
    // textTheme: GoogleFonts.luckiestGuyTextTheme(baseTheme.textTheme),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(title: "Green Glide",
     theme: _buildTheme(Brightness.dark),
    home:const HaxkIntro()
    );
  }
}