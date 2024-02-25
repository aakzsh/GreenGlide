import 'package:flutter/material.dart';

class TableEntry extends StatelessWidget {
  const TableEntry({super.key, required this.data});
  final String data;
  @override
  Widget build(BuildContext context) {
    return Text(data, style: const TextStyle(fontFamily: "Lexend", color: Colors.black, fontSize: 18),);
  }
}