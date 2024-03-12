import 'dart:async';

import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:greenglide/game/runner.dart';
import 'package:greenglide/storylines/storyline_widget.dart';

class SinglePlayerHome extends StatefulWidget {
  const SinglePlayerHome({super.key, required this.sound, required this.lang});
  final String lang;
  final bool sound;

  @override
  State<SinglePlayerHome> createState() => _SinglePlayerHomeState();
}

class _SinglePlayerHomeState extends State<SinglePlayerHome> {
  bool showMission = true;
  late Timer _timer;
  @override
  void initState() {
    _timer = Timer(const Duration(milliseconds: 10000), () {
      setState(() {
        showMission = false;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      
      body: Stack(
        alignment: Alignment.center,
        children: [
          //  const SinglePlayerScore(),
          
          showMission
              ? Container(
                height: double.maxFinite,
                width: double.maxFinite,
                decoration:const BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/scenery/final.png"), fit: BoxFit.cover)),
                child: Center(
                  child: StorylineWidget(context: context, lang: widget.lang,),
                ),
              )
              :  GameWidget(
            game: GreenGlideGame(sound: widget.sound, lang: widget.lang),
            
            // initialActiveOverlays: const [],
          ),
        ],
      ),
    );
  }
}
