
// import 'package:flame/game.dart';
// import 'package:flutter/material.dart';
// import 'package:greenglide/flame_game/endless_runner.dart';
// import 'package:greenglide/flame_game/game_levels.dart';
// import 'package:greenglide/widgets/text/luckiest_guy.dart';

// /// This widget defines the properties of the game screen.
// ///
// /// It mostly sets up the overlays (widgets shown on top of the Flame game) and
// /// the gets the [AudioController] from the context and passes it in to the
// /// [EndlessRunner] class so that it can play audio.
// class GameScreen extends StatelessWidget {
//   const GameScreen({required this.level, super.key});

//   final  level;

//   static const String winDialogKey = 'win_dialog';
//   static const String backButtonKey = 'back_buttton';

//   @override
//   Widget build(BuildContext context) {
//     // final audioController = context.read<AudioController>();
//     return Scaffold(
       
//       body: GameWidget<EndlessRunner>(
//         key: const Key('play session'),
//         game: EndlessRunner(
// level: gameLevels.first
//           // level: level,
//           // playerProgress: context.read<PlayerProgress>(),
//           // audioController: audioController,
//         ),
//         overlayBuilderMap: {

//           backButtonKey: (BuildContext context, EndlessRunner game) {
//             return Positioned(
//               top: 20,
//               right: 10,
//               child: LuckiestGuyText(fontSize: 30.0, text: "23%",)
//             );
//           },
          
//           winDialogKey: (BuildContext context, EndlessRunner game) {
//             return Text("hemhe");
//           },
//         },
//       ),
//     );
//   }
// }
