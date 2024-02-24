import 'package:flutter/material.dart';
import 'package:greenglide/constants/colors.dart';

class Mode extends StatefulWidget {
  const Mode({super.key});

  @override
  State<Mode> createState() => _ModeState();
}

class _ModeState extends State<Mode> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      
      backgroundColor: AppColors.blue,
      child: Container(width: 400, height: 250,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [Text(
                                    "CHOOSE MODE",
                                    style: TextStyle(
                                        fontFamily: "Luckiest Guy",
                                        fontSize: 25,
                                        shadows: const [
                                          Shadow(
                                              // bottomLeft
                                              offset: Offset(-1.5, -1.5),
                                              color: Colors.black),
                                          Shadow(
                                              // bottomRight
                                              offset: Offset(1.5, -1.5),
                                              color: Colors.black),
                                          Shadow(
                                              // topRight
                                              offset: Offset(1.5, 1.5),
                                              color: Colors.black),
                                          Shadow(
                                              // topLeft
                                              offset: Offset(-1.5, 1.5),
                                              color: Colors.black),
                                        ]),
                                  )],),
      )
      );
  }
}