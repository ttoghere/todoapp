// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class TaskItem extends StatelessWidget {
  final bool isValid;
  final String taskTitle;
  //Parametreli void func için tanımlama ValueChanged<tip?> şeklinde olmalıdır
  final ValueChanged<bool?> checkBoxCallback;
  final VoidCallback longPressCallBack;
  TaskItem({
    required this.longPressCallBack,
    required this.checkBoxCallback,
    required this.taskTitle,
    required this.isValid,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: longPressCallBack,
      title: Text(
        taskTitle,
        style: TextStyle(
          decoration:
              (isValid) ? TextDecoration.lineThrough : TextDecoration.none,
          fontSize: 20,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
      trailing: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: Colors.white,
        ),
        child: Checkbox(
          onChanged: checkBoxCallback,
          activeColor: Colors.red[900],
          value: isValid,
        ),
      ),
    );
  }
}
