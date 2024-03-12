import 'dart:async';
import 'package:flutter/material.dart';
import 'package:greenglide/constants/colors.dart';
import 'package:greenglide/screens/intro/screen3_greenglide.dart';
import 'package:greenglide/utils/animations/page_transition.dart';
import 'package:greenglide/utils/helper/helper.dart';

class FlutterIntro extends StatefulWidget {
  const FlutterIntro({super.key, required this.lang});
  final String lang;

  @override
  State<FlutterIntro> createState() => _FlutterIntroState();
}

class _FlutterIntroState extends State<FlutterIntro>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  @override
  void initState() {
    Timer(const Duration(milliseconds: 1500), () {
      Navigator.of(context).push(CustomPageRoute( GreenGlideIntro(lang: widget.lang)));
    });
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500), // Adjust duration as needed
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(""),
            SizedBox(
              height: 120,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      width: 120,
                      child: Hero(
                        tag: "haxklogo",
                        child: Image.asset(
                          "assets/images/haxk.png",
                          scale: 4,
                        ),
                      )),
                  const SizedBox(
                    width: 60,
                  ),
                  FadeTransition(
                    opacity: _animation,
                    child: Container(
                      width: 1,
                      height: 70,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    width: 60,
                  ),
                  FadeTransition(
                    opacity: _animation,
                    child: SizedBox(
                      width: 120,
                      child: Image.asset(
                        "assets/images/flutter.png",
                        scale: 4,
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
             Text(
              Helper.builtWithFlutter[widget.lang]!,
              style: const TextStyle(fontFamily: "Lexend", fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}
