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
  var baseTheme = ThemeData(brightness: brightness,
  );
 

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

    class CustomPageRoute<T> extends PageRoute<T> {
      CustomPageRoute(this.child);
      @override
      // TODO: implement barrierColor
      Color get barrierColor => Colors.black;

      @override
      String? get barrierLabel => null;

      final Widget child;

      @override
      Widget buildPage(BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      }

      @override
      bool get maintainState => true;

      @override
      Duration get transitionDuration => Duration(milliseconds: 500);
    }