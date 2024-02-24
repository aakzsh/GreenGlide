import 'package:flutter/material.dart';
import 'package:greenglide/constants/colors.dart';

class CheckinReward extends StatefulWidget {
  const CheckinReward({super.key});

  @override
  State<CheckinReward> createState() => _CheckinRewardState();
}

class _CheckinRewardState extends State<CheckinReward> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      
      backgroundColor: AppColors.golden,
      child: Container(width: 400, height: 250,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [Text(
                                    "DAILY CHECKIN REWARD",
                                    style: TextStyle(
                                        fontFamily: "Luckiest Guy",
                                        fontSize: 25,
                                        shadows: const [
                                          Shadow(
                                              // bottomLeft
                                              offset: Offset(-1.5, -1.5),
                                              color: Colors.black),
                                          Shadow(
                                              // bottomRight
                                              offset: Offset(1.5, -1.5),
                                              color: Colors.black),
                                          Shadow(
                                              // topRight
                                              offset: Offset(1.5, 1.5),
                                              color: Colors.black),
                                          Shadow(
                                              // topLeft
                                              offset: Offset(-1.5, 1.5),
                                              color: Colors.black),
                                        ]),
                                  )],),
      )
      );
  
  }
}