import 'dart:async';

import 'package:flutter/material.dart';
import 'package:greenglide/constants/colors.dart';
import 'package:greenglide/widgets/text/luckiest_guy.dart';
import 'dart:math' as math;

class CheckinReward extends StatefulWidget {
  const CheckinReward({super.key});

  @override
  State<CheckinReward> createState() => _CheckinRewardState();
}

class _CheckinRewardState extends State<CheckinReward>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late Timer _timer;
  bool _isFront = true;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(_controller)
      ..addListener(() {
        setState(() {});
      });
    _startTimer();
  }

  @override
  void dispose() {
    _controller.dispose();
    _timer.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(milliseconds: 500), (timer) {
      _flipCard();
    });
  }

  void _flipCard() {
    if (_controller.status != AnimationStatus.forward) {
      if (_isFront) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
      _isFront = !_isFront;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
        backgroundColor: AppColors.golden,
        child: SizedBox(
          width: 400,
          height: 250,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const LuckiestGuyText(
                  text: "DAILY CHECKIN REWARD", fontSize: 25.0),
              SizedBox(
                height: 120,
                width: 120,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Image.asset(
                        "assets/images/coin.png",
                        height: 50,
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Image.asset(
                        "assets/images/coin.png",
                        height: 50,
                      ),
                    ),
                    Transform(
                      transform: Matrix4.rotationY(_animation.value * math.pi),
                      alignment: Alignment.center,
                      child: _isFront
                          ? Align(
                              alignment: Alignment.center,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Image.asset(
                                    "assets/images/coin.png",
                                    height: 80,
                                  ),
                                  const Align(
                                    alignment: Alignment.center,
                                    child: LuckiestGuyText(
                                        text: "+100", fontSize: 15.0),
                                  )
                                ],
                              ))
                          : Align(
                              alignment: Alignment.center,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Image.asset(
                                    "assets/images/coin.png",
                                    height: 80,
                                  ),
                                  const Align(
                                    alignment: Alignment.center,
                                    child: LuckiestGuyText(
                                        text: "+100", fontSize: 15.0),
                                  )
                                ],
                              )),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
