import 'package:flutter/material.dart';

class NormalTextCenter extends StatelessWidget {
  const NormalTextCenter({super.key, required this.text, required this.fontSize});
  final String text;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(text, style: TextStyle(fontSize: fontSize, color: Colors.black, fontWeight: FontWeight.bold, fontFamily: "Lexend",), textAlign: TextAlign.center,);
  }
}