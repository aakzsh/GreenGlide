
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:greenglide/screens/menu/mode.dart';
import 'package:greenglide/utils/helper/helper.dart';
import 'package:greenglide/widgets/parallelogram/custom_painter.dart';
import 'package:greenglide/widgets/text/luckiest_guy.dart';

class Parallelogram extends StatelessWidget {
  final double width;
  final double height;
  final double angle;
  final Color color;
  final bool sound;
  final String lang;

  const Parallelogram({super.key, 
    required this.width,
    required this.height,
    required this.angle,
    required this.sound,
    required this.lang,
    this.color = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
         if(sound){ FlameAudio.play("button.wav");}
        showDialog(context: context, builder: ((context) =>  Mode(sound: sound, lang: lang)));},
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomPaint(
            size: const Size(250, 60), // Adjust the size as needed
            painter: ParallelogramPainter(),
          ),
           LuckiestGuyText(text: Helper.playNow[lang]!, fontSize: 30.0)
        ],
      ),
    );
  }
}

