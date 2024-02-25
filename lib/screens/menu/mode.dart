import 'package:flutter/material.dart';
import 'package:greenglide/constants/colors.dart';
import 'package:greenglide/screens/gameplay/singleplayer/home.dart';
import 'package:greenglide/screens/learn/learn_more.dart';
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
    return const Dialog(
        backgroundColor: AppColors.blue,
        child: SizedBox(
          width: 400,
          height: 250,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              LuckiestGuyText(text: "CHOOSE MODE", fontSize: 25.0),
              ChooseModeButton(wid: SinglePlayerHome(), title: "SINGLE PLAYER"),
              ChooseModeButton(wid: LearnMore(), title: "MULTIPLAYER RANDOM"),
              ChooseModeButton(
                  wid: LearnMore(), title: "MULTIPLAYER PRIVATE ROOM"),
              ChooseModeButton(
                  wid: LearnMore(), title: "MULTIPLAYER WITH CASH REWARDS")
            ],
          ),
        ));
  }
}
