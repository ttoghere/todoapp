// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, must_be_immutable, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/providers/task_data.dart';
import 'package:todoapp/screens/add_task_screen.dart';
import 'package:todoapp/widgets/task_list.dart';
import 'package:todoapp/widgets/task_screen_title.dart';

class TaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var taskData = Provider.of<TaskData>(
      context,
    );
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //showBottomSheet kullanımı builder içinde mümkündür ama ana kullanım için showModalBottomSheet kullanımı mümkündür
          showModalBottomSheet(
              context: context,
              builder: (context) => AddTask(
                    taskList: taskData.tasks,
                  ));
        },
        child: Icon(Icons.add),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 45),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.red,
              Colors.blue,
              Colors.white,
              Colors.blue,
              Colors.red,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomCenter,
          ),
          border: Border.all(color: Colors.black87, width: 2),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 30,
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 3),
                      borderRadius: BorderRadius.circular(50)),
                  child: CircleAvatar(
                    child: Text(
                      '${taskData.tasksLength} Görev',
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.red,
                          fontWeight: FontWeight.bold),
                    ),
                    backgroundColor: Colors.white,
                    radius: 40,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                TaskScreenTitle(
                  shadowColor1: Colors.red,
                  shadowColor2: Colors.black,
                  textColor: Colors.white,
                  title: 'Yapılacaklar!!',
                ),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    gradient: RadialGradient(colors: [
                      Colors.black,
                      Colors.orange,
                      Colors.blueGrey,
                      Colors.transparent,
                    ]),
                    borderRadius: BorderRadius.circular(50)),
                child: TaskList(
                  tasksList: taskData.tasks,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
