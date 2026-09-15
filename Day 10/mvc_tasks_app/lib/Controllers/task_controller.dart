import 'package:flutter/material.dart';

import '../Database/database_helper.dart';
import '../Model/task.dart';

class TaskController extends ChangeNotifier {
  final DatabaseHelper _databaseHelper =
      DatabaseHelper();

  final List<Task> _tasks = [];

  List<Task> get tasks => _tasks;

  Future<void> loadTasks() async {
    final tasks = await _databaseHelper.getTasks();

    _tasks
      ..clear()
      ..addAll(tasks);

  }

  Future<void> addTask(Task task) async {
    final id =
        await _databaseHelper.insertTask(task);

    task.id = id;

    _tasks.add(task);

  }

  Future<void> updateTask(
    Task oldTask,
    Task newTask,
  ) async {
    newTask.id = oldTask.id;

    await _databaseHelper.updateTask(
      newTask,
    );

    final index = _tasks.indexWhere(
      (task) => task.id == oldTask.id,
    );

    if (index != -1) {
      _tasks[index] = newTask;
    }

  }

  Future<void> deleteTask(Task task) async {
    if (task.id == null) {
      return;
    }

    await _databaseHelper.deleteTask(
      task.id!,
    );

    _tasks.removeWhere(
      (item) => item.id == task.id,
    );

  }

  Future<void> toggleTask(Task task) async {
    task.isCompleted = !task.isCompleted;

    await _databaseHelper.updateTask(task);

  }
}