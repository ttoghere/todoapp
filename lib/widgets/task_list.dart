// ignore_for_file: prefer_const_constructors, prefer_final_fields
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/providers/task.dart';
import 'package:todoapp/providers/task_data.dart';
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
    return Consumer<TaskData>(
      builder: (context, value, child) => ListView.builder(
        itemBuilder: (context, index) => TaskItem(
            longPressCallBack: () => value.deleteTask(value.tasks[index]),
            taskTitle: value.tasks[index].name,
            isValid: value.tasks[index].isDone,
            checkBoxCallback: (checkboxState) {
              final task = value.tasks[index];
              if (checkboxState != null) {
                setState(() {
                  value.updateTask(task);
                  // task.toggleDone();
                });
              }
            }),
        itemCount: value.tasksLength,
      ),
    );
  }
}
