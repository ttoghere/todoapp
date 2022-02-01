// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:todoapp/providers/task.dart';

class TaskData extends ChangeNotifier {
  //Görevlerin Tutulduğu Liste
  List<Task> _tasks = [
    Task(name: 'Go Home'),
    Task(name: 'Drink Coffee'),
    Task(name: 'Make breakfast'),
    Task(name: 'Go to Gym'),
  ];

  //Veri çekimi için gerekli method
  List<Task> get tasks {
    return [..._tasks];
  }

  //Listenin uzunluğunu gösterir
  int get tasksLength {
    return _tasks.length;
  }

  //Listeye veri eklenmesini sağlar
  void addTaskItem(String data) {
    _tasks.add(Task(name: data));
    notifyListeners();
  }

  //Durum güncelleme fonksiyonu
  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  //Silme fonksiyonu
  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }
}
