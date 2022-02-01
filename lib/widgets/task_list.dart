// ignore_for_file: prefer_const_constructors, prefer_final_fields
import 'package:flutter/material.dart';
import 'package:todoapp/providers/task.dart';
import 'task_item.dart';

class TaskList extends StatefulWidget {
  final List<Task> tasksList;
  TaskList({required this.tasksList});
  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => TaskItem(
          taskTitle: widget.tasksList[index].name,
          isValid: widget.tasksList[index].isDone,
          checkBoxCallback: (checkboxState) {
            if (checkboxState != null) {
              setState(() {
                widget.tasksList[index].toggleDone();
              });
            }
          }),
      itemCount: widget.tasksList.length,
    );
  }
}
