import 'package:flutter/material.dart';
import 'package:greenglide/constants/colors.dart';
import 'package:greenglide/widgets/text/luckiest_guy.dart';
import 'package:greenglide/widgets/text/normal_text.dart';

showNotAvailableDialog(context){
  showDialog(context: context, builder: ((context) =>const Dialog(
        backgroundColor: AppColors.blue,
        child: SizedBox(
          width: 400,
          height: 250,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [LuckiestGuyText(text: "SORRY :(", fontSize: 25.0),
            NormalText(text: "This Mode isn't live yet, but we're definitely gonna work on it pretty soon!", fontSize: 18.0)
            ],
          ),
        ))));
}