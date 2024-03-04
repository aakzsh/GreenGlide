import 'package:flutter/material.dart';
import 'package:greenglide/constants/colors.dart';
import 'package:greenglide/widgets/text/luckiest_guy.dart';
import 'package:greenglide/widgets/text/normal_text.dart';
import 'package:greenglide/widgets/text/normal_text_center.dart';

class NotAvailableSections extends StatelessWidget {
  const NotAvailableSections({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.blue,
      body: Center(child: SizedBox(
          width: 400,
          height: 250,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [LuckiestGuyText(text: "SORRY :(", fontSize: 25.0),
            NormalTextCenter(text: "This Mode isn't live yet, but we're definitely gonna work on it pretty soon!", fontSize: 18.0)
            ],
          ),
        ),),
    );
  }
}