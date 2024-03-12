import 'dart:async';

import 'package:flutter/material.dart';
import 'package:greenglide/constants/colors.dart';
import 'package:greenglide/storylines/data.dart';
import 'package:greenglide/widgets/text/luckiest_guy.dart';
import 'package:greenglide/widgets/text/normal_text.dart';
import 'dart:math';


class StorylineWidget extends StatefulWidget {
  const StorylineWidget({super.key, required this.context});
  final BuildContext context;

  @override
  State<StorylineWidget> createState() => _StorylineWidgetState();
}

class _StorylineWidgetState extends State<StorylineWidget> {
  int index = 0;

  void getRand(){
    Random random =  Random();
    int randomNumber = random.nextInt(Storylines.stories.length);
    setState(() {
      index = randomNumber;
    });
  }

  @override
  void initState(){
    super.initState();
    _startTimer();
    getRand();
  }

  late Timer _timer;


  void _startTimer() {
    // Create a timer that repeats every 5 seconds
    _timer = Timer.periodic(const Duration(milliseconds: 50), (timer) {
      if(x<200){
        setState(() {
          x++;
      });
      }
      if(x==200){
        _timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    // Cancel the timer when the widget is disposed to avoid memory leaks
    _timer.cancel();
    super.dispose();
  }
  int x = 0;
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(widget.context).size.height;
    double w = MediaQuery.of(widget.context).size.width;
    double loaderW = 0.7*w*(200-x)/200;
    return Container(
        height: 4/5 * h,
        width: 4/5 * w,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: AppColors.golden,),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [const LuckiestGuyText(text: "MISSION DETAILS", fontSize: 30.0),
        Padding(
          padding: const EdgeInsets.all(20),
          child: NormalText(text: Storylines.stories[index]["title"].toString(), fontSize: 18,),
        ),
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 0.05*w),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Container(height: 20, width: loaderW,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
            color: AppColors.blue
            ),
            ),
          ),
        )
        ],),
    );
  }
}