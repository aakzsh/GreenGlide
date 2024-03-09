import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:greenglide/constants/colors.dart';
import 'package:greenglide/game/runner.dart';
import 'package:greenglide/screens/gameplay/singleplayer/home.dart';
import 'package:greenglide/screens/gameplay/singleplayer/trial.dart';
import 'package:greenglide/screens/learn/learn_more.dart';
import 'package:greenglide/screens/menu/not_available_sections.dart';
import 'package:greenglide/widgets/buttons/choose_mode.dart';
import 'package:greenglide/widgets/text/luckiest_guy.dart';

class Mode extends StatefulWidget {
  const Mode({super.key});

  @override
  State<Mode> createState() => _ModeState();
}

class _ModeState extends State<Mode> {
  @override
  Widget build(BuildContext context) {
    return  Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: AppColors.blue,
        child:const SizedBox(
          width: 400,
          height: 250,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
               LuckiestGuyText(text: "CHOOSE MODE", fontSize: 25.0),
              // ChooseModeButton(wid: SinglePlayerHome(), title: "SINGLE PLAYER"),
              ChooseModeButton(
                  wid: SinglePlayerHome(),
                  title: "SINGLE PLAYER"),
               ChooseModeButton(
                  wid: NotAvailableSections(), title: "MULTIPLAYER RANDOM"),
               ChooseModeButton(
                  wid: NotAvailableSections(), title: "MULTIPLAYER PRIVATE ROOM"),
              //  ChooseModeButton(
              //     wid: NotAvailableSections(), title: "MULTIPLAYER WITH CASH REWARDS")
            ],
          ),
        ));
  }
}
