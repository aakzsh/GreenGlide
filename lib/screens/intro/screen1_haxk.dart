import 'dart:async';

import 'package:flutter/material.dart';
import 'package:greenglide/constants/colors.dart';
import 'package:greenglide/screens/intro/screen2_flutter.dart';

class HaxkIntro extends StatefulWidget {
  const HaxkIntro({super.key});

  @override
  State<HaxkIntro> createState() => _HaxkIntroState();
}

class _HaxkIntroState extends State<HaxkIntro> with SingleTickerProviderStateMixin {
    late AnimationController _controller;
  late Animation<double> _animation;
  @override
  void initState(){
    Timer(const Duration(milliseconds: 1500), () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const FlutterIntro()),
          (route) => false);
    });
     _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500), // Adjust duration as needed
    );
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    _controller.forward();
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
        color: AppColors.blackbg,
        child: FadeTransition(
          opacity: _animation,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(""),
              Hero(
                tag: "haxklogo",
                child: Image.asset(
                  "assets/images/haxk.png",
                  scale: 4,
                ),
              ),
              InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => FlutterIntro()));
                  },
                  child: Text(
                    "TEAM HAXK PRESENTS",
                    style: TextStyle(fontFamily: "Lexend", fontSize: 20),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
