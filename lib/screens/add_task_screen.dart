// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/providers/task.dart';
import 'package:todoapp/providers/task_data.dart';

class AddTask extends StatelessWidget {
  String newTaskTitle = '';
  final List<Task> taskList;
  AddTask({required this.taskList});

  @override
  Widget build(BuildContext context) {
    var taskData = Provider.of<TaskData>(context);
    return Container(
      color: Color(0xFF757575),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              'Görev Ekle',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                color: Colors.red[900],
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: TextField(
                onChanged: (value) {
                  newTaskTitle = value;
                },
                autofocus: true,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                    labelText: 'Görev Ekle', focusColor: Colors.red[900]),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                taskData.addTaskItem(newTaskTitle);
                Navigator.of(context).pop();
              },
              child: Text('Ekle'),
              style: ElevatedButton.styleFrom(
                  primary: Colors.red[900], onPrimary: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
