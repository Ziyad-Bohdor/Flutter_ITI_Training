import 'package:flutter/material.dart';
import '../Class/task.dart';

class TaskProvider extends ChangeNotifier {
  final List<Task> _tasks = [];

  List<Task> get tasks => _tasks;

  void addTask(Task task) {
    _tasks.add(task);
    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }

  void updateTask(Task oldTask, Task newTask) {
    int index = _tasks.indexOf(oldTask);

    if (index != -1) {
      _tasks[index] = newTask;
      notifyListeners();
    }
  }

  void toggleTask(Task task) {
    task.isCompleted = !task.isCompleted;
    notifyListeners();
  }

  List<Task> searchTasks(String query) {
    if (query.isEmpty) {
      return _tasks;
    }

    return _tasks.where((task) {
      return task.taskName.toLowerCase().contains(query.toLowerCase()) ||
          task.subject.toLowerCase().contains(query.toLowerCase());
    }).toList();
  }
}