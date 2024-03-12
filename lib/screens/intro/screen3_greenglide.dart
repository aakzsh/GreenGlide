import 'dart:async';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:greenglide/constants/colors.dart';
import 'package:greenglide/screens/menu/menu_home.dart';
import 'package:greenglide/services/shared_preferences/sounds.dart';
import 'package:greenglide/utils/animations/page_transition.dart';

class GreenGlideIntro extends StatefulWidget {
  const GreenGlideIntro({super.key});

  @override
  State<GreenGlideIntro> createState() => _GreenGlideIntroState();
}

class _GreenGlideIntroState extends State<GreenGlideIntro>
    with SingleTickerProviderStateMixin {
  playAudio() async {
    var x = await getSoundLocally();
    if (x) {
      FlameAudio.play("greenglide.wav");
    }
  }

  late AnimationController _controller;
  late Animation<double> _animation;
  double _scale = 0.0;

  void _startAnimation() {
    setState(() {
      _scale = 1.0;
    });
  }

  @override
  void initState() {
    Timer(const Duration(milliseconds: 10), () {
      _startAnimation();
    });
    Timer(const Duration(milliseconds: 2500), () {
      Navigator.of(context).pushAndRemoveUntil(
        CustomPageRoute(const MenuHome()),
        (route) => false,
      );
    });
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500), // Adjust duration as needed
    );
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    _controller.forward();
    playAudio();
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
      body: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [AppColors.gradientorange, AppColors.gradientpink],
            ),
          ),
          child: FadeTransition(
              opacity: _animation,
              child: Hero(
                tag: "logo",
                child: AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeOut,
                    transform: Matrix4.diagonal3Values(_scale, _scale, 1.0),
                    child: Image.asset(
                      "assets/images/logo.png",
                      scale: 4,
                    )),
              ))),
    );
  }
}
