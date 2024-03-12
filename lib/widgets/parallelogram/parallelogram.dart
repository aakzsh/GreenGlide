
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:greenglide/screens/menu/mode.dart';
import 'package:greenglide/widgets/parallelogram/custom_painter.dart';
import 'package:greenglide/widgets/text/luckiest_guy.dart';

class Parallelogram extends StatelessWidget {
  final double width;
  final double height;
  final double angle;
  final Color color;
  final bool sound;

  const Parallelogram({super.key, 
    required this.width,
    required this.height,
    required this.angle,
    required this.sound,
    this.color = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
         if(sound){ FlameAudio.play("tap.wav");}
        showDialog(context: context, builder: ((context) =>  Mode(sound: sound)));},
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomPaint(
            size: const Size(250, 60), // Adjust the size as needed
            painter: ParallelogramPainter(),
          ),
          const LuckiestGuyText(text: "PLAY NOW", fontSize: 30.0)
        ],
      ),
    );
  }
}

