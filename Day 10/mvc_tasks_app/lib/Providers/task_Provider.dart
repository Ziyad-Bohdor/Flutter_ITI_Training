import 'package:flutter/material.dart';

import '../Model/task.dart';
import '../Database/database_helper.dart';

class TaskProvider extends ChangeNotifier {
  final DatabaseHelper _databaseHelper = DatabaseHelper();

  final List<Task> _tasks = [];

  List<Task> get tasks => _tasks;

  Future<void> loadTasks() async {
    final savedTasks = await _databaseHelper.getTasks();

    _tasks
      ..clear()
      ..addAll(savedTasks);

    notifyListeners();
  }

  Future<void> addTask(Task task) async {
    final id = await _databaseHelper.insertTask(task);

    task.id = id;
    _tasks.add(task);

    notifyListeners();
  }

  Future<void> deleteTask(Task task) async {
    if (task.id == null) {
      return;
    }

    await _databaseHelper.deleteTask(task.id!);

    _tasks.removeWhere((item) {
      return item.id == task.id;
    });

    notifyListeners();
  }

  Future<void> updateTask(Task oldTask, Task newTask) async {
    if (oldTask.id == null) {
      return;
    }

    newTask.id = oldTask.id;

    await _databaseHelper.updateTask(newTask);

    final index = _tasks.indexWhere((item) {
      return item.id == oldTask.id;
    });

    if (index != -1) {
      _tasks[index] = newTask;
    }

    notifyListeners();
  }

  Future<void> toggleTask(Task task) async {
    task.isCompleted = !task.isCompleted;

    await _databaseHelper.updateTask(task);

    notifyListeners();
  }

  
}