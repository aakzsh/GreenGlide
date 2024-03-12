import 'package:flutter/material.dart';
import 'package:greenglide/constants/colors.dart';
import 'package:greenglide/screens/gameplay/singleplayer/home.dart';
import 'package:greenglide/screens/menu/not_available_sections.dart';
import 'package:greenglide/utils/helper/helper.dart';
import 'package:greenglide/widgets/buttons/choose_mode.dart';
import 'package:greenglide/widgets/text/luckiest_guy.dart';

class Mode extends StatefulWidget {
  const Mode({super.key, required this.sound, required this.lang});
  final bool sound;
  final String lang;

  @override
  State<Mode> createState() => _ModeState();
}

class _ModeState extends State<Mode> {
  @override
  Widget build(BuildContext context) {
    return  Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: AppColors.blue,
        child: SizedBox(
          width: 400,
          height: 250,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [ 
               LuckiestGuyText(text: Helper.chooseMode[widget.lang]!, fontSize: 25.0),
              // ChooseModeButton(wid: SinglePlayerHome(), title: "SINGLE PLAYER"),
              ChooseModeButton(
                sound: widget.sound,
                  wid: SinglePlayerHome(sound: widget.sound, lang: widget.lang),
                  title:Helper.singlePlayer[widget.lang]!),
               ChooseModeButton(
                  sound: widget.sound,
                  wid: const NotAvailableSections(), title: Helper.multiplayerRandom[widget.lang]!),
               ChooseModeButton(
                  sound: widget.sound,
                  wid: const NotAvailableSections(), title: Helper.multiplayerPrivate[widget.lang]!),
              //  ChooseModeButton(
              //     wid: NotAvailableSections(), title: "MULTIPLAYER WITH CASH REWARDS")
            ],
          ),
        ));
  }
}
