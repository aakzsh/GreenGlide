import 'package:flutter/material.dart';

TextStyle luckiestGuyTextStyle(fontSize) {
    return TextStyle(fontFamily: "Luckiest Guy", fontSize: fontSize, shadows: [
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
        ]);
  }