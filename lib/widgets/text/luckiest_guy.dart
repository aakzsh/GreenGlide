import 'package:flutter/material.dart';

class LuckiestGuyText extends StatelessWidget {
  const LuckiestGuyText(
      {super.key, required this.text, required this.fontSize});
  final String text;
  final double fontSize;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(top: fontSize/5),
      child: Text(
        text,
        style: TextStyle(fontFamily: "Luckiest Guy", fontSize: fontSize, shadows: [
          Shadow(
              // bottomLeft
              offset: fontSize > 25
                  ? const Offset(-2.5, -2.5)
                  : const Offset(-1.5, -1.5),
              color: Colors.black),
          Shadow(
              // bottomRight
              offset: fontSize > 25
                  ? const Offset(2.5, -2.5)
                  : const Offset(1.5, -1.5),
              color: Colors.black),
          Shadow(
              // topRight
              offset:
                  fontSize > 25 ? const Offset(2.5, 2.5) : const Offset(1.5, 1.5),
              color: Colors.black),
          Shadow(
              // topLeft
              offset: fontSize > 25
                  ? const Offset(-2.5, 2.5)
                  : const Offset(-1.5, 1.5),
              color: Colors.black),
        ]),
      ),
    );
  }
}
