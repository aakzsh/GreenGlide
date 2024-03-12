import 'package:flutter/material.dart';
import 'package:greenglide/constants/colors.dart';
import 'package:greenglide/utils/helper/helper.dart';
import 'package:greenglide/widgets/settings/settings_options.dart';
import 'package:greenglide/widgets/text/luckiest_guy.dart';

class Settings extends StatefulWidget {
  const Settings({super.key, required this.lang});
  final String lang;

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return  Dialog(
        backgroundColor: AppColors.blue,
        child: SizedBox(
          width: 400,
          height: 250,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [LuckiestGuyText(text: Helper.settings[widget.lang]!, fontSize: 25.0),
            SettingsOption(title: Helper.sounds[widget.lang]!),
            SettingsOption(title:Helper.japanese[widget.lang]!),
            ],
          ),
        ));
  }
}
