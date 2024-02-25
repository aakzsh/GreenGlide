import 'package:flutter/material.dart';
import 'package:greenglide/constants/colors.dart';
import 'package:greenglide/screens/menu/menu_home.dart';
import 'package:greenglide/utils/animations/page_transition.dart';
import 'package:greenglide/widgets/text/luckiest_guy.dart';

class SinglePlayerScore extends StatefulWidget {
  const SinglePlayerScore({super.key});

  @override
  State<SinglePlayerScore> createState() => _SinglePlayerScoreState();
}

class _SinglePlayerScoreState extends State<SinglePlayerScore>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 5000),
      vsync: this,
    )..repeat();

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blue,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              RotationTransition(
                turns: Tween(begin: 0.0, end: 1.0).animate(_controller),
                child: Opacity(
                  opacity: 0.5,
                  child: Image.asset(
                    "assets/images/confetti.png",
                    height: 300,
                  ),
                ),
              ),
              Image.asset(
                "assets/images/trophy.png",
                scale: 4,
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const LuckiestGuyText(text: "GAME FINISHED!!", fontSize: 30.0),
              const LuckiestGuyText(text: "SCORE: 849", fontSize: 25.0),
              MaterialButton(
                  minWidth: 150,
                  height: 40,
                  color: AppColors.green,
                  shape: RoundedRectangleBorder(
                      side: const BorderSide(width: 2, color: Colors.black),
                      borderRadius: BorderRadius.circular(10)),
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(context,
                        CustomPageRoute(const MenuHome()), (route) => false);
                  },
                  child:const LuckiestGuyText(text: "HOME", fontSize: 20.0))
            ],
          )
        ],
      ),
    );
  }
}
