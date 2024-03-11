import 'package:flutter/material.dart';
import 'package:greenglide/constants/colors.dart';
import 'package:greenglide/widgets/text/luckiest_guy.dart';
import 'package:greenglide/widgets/text/normal_text_center.dart';

class CheckinRewardPending extends StatefulWidget {
  const CheckinRewardPending({super.key});

  @override
  State<CheckinRewardPending> createState() => _CheckinRewardPendingState();
}

class _CheckinRewardPendingState extends State<CheckinRewardPending>
    with SingleTickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    return const Dialog(
        backgroundColor: AppColors.golden,
        child: SizedBox(
          width: 400,
          height: 250,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               LuckiestGuyText(
                  text: "NOT AVAILABLE RIGHT NOW", fontSize: 25.0),
               NormalTextCenter(text: "Please wait for 2 hours to get daily checkin reward again!", fontSize: 15)
            ],
          ),
        ));
  }
}
