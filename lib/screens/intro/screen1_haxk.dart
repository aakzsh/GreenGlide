import 'dart:async';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:greenglide/constants/colors.dart';
import 'package:greenglide/screens/intro/screen2_flutter.dart';
import 'package:greenglide/services/firebase/logincheck.dart';
import 'package:greenglide/services/shared_preferences/japanese.dart';
import 'package:greenglide/services/shared_preferences/sounds.dart';
import 'package:greenglide/utils/animations/page_transition.dart';
import 'package:greenglide/utils/helper/helper.dart';

class HaxkIntro extends StatefulWidget {
  const HaxkIntro({super.key});

  @override
  State<HaxkIntro> createState() => _HaxkIntroState();
}

class _HaxkIntroState extends State<HaxkIntro>
    with SingleTickerProviderStateMixin {
  String lang = "en";

  setLanguage()async{
    var jp  = await getJapaneseLocally();
    setState(() {
      lang = jp?"jp":"en";
    });
  }
  late AnimationController _controller;
  late Animation<double> _animation;
  playAudio()async{
    var x = await getSoundLocally();
    if(x){
      FlameAudio.play("haxk.wav");
    }
  }
  @override
  void initState() {
    checkLoggedIn();
    setLanguage();
    Timer(const Duration(milliseconds: 2500), () {
      Navigator.of(context).push(CustomPageRoute( FlutterIntro(lang: lang,)));
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
        color: AppColors.blackbg,
        child: FadeTransition(
          opacity: _animation,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(""),
              SizedBox(
                height: 120,
                child: Hero(
                  tag: "haxklogo",
                  child: Image.asset(
                    "assets/images/haxk.png",
                    scale: 4,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>  FlutterIntro(lang: lang)));
                  },
                  child:  Text(
                    Helper.haxkPresents[lang]!,
                    style: const TextStyle(fontFamily: "Lexend", fontSize: 20),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
