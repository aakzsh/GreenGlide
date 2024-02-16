import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
void main()  {
   WidgetsFlutterBinding.ensureInitialized();
   SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft])
   .then((_) {
    runApp(const App());
  });
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: "Green Glide",
    home: Scaffold(
      backgroundColor: Colors.green,
      body: Center(child: Text("Green Glide App Check"),),),
    );
  }
}