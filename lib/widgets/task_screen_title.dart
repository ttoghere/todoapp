// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class TaskScreenTitle extends StatelessWidget {
  final String title;
  final Color textColor;
  final Color shadowColor1;
  final Color shadowColor2;
  TaskScreenTitle({
    required this.shadowColor1,
    required this.shadowColor2,
    required this.textColor,
    required this.title,
  });
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: textColor,
        fontSize: 30,
        // ignore: prefer_const_literals_to_create_immutables
        shadows: [
          Shadow(
            color: shadowColor1,
            offset: Offset(1, 2),
            blurRadius: 2.0,
          ),
          Shadow(
            color: shadowColor2,
            offset: Offset(3, 4),
            blurRadius: 4.0,
          ),
        ],
      ),
    );
  }
}
