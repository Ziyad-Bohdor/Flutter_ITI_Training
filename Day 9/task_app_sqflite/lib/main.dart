import 'package:flutter/material.dart';
import 'Pages/tasks_page.dart';
import 'Providers/task_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) {
        final provider = TaskProvider();

        provider.loadTasks();

        return provider;
      },
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const TasksPage(),
    );
  }
}