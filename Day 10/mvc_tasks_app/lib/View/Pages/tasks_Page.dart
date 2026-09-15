import 'package:flutter/material.dart';
import 'package:mvc_tasks_app/Controllers/task_controller.dart';
import 'package:provider/provider.dart';

import 'add_edit_task_page.dart';

class TasksPage extends StatelessWidget {
  const TasksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Tasks'),
      ),

      body: Consumer<TaskController>(
        builder: (context, controller, child) {
          final tasks = controller.tasks;

          if (tasks.isEmpty) {
            return const Center(
              child: Text(
                'No Tasks Found',
                style: TextStyle(fontSize: 20),
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              final task = tasks[index];

              return Card(
                margin: const EdgeInsets.only(
                  bottom: 12,
                ),
                elevation: 3,

                child: ListTile(
                  leading: Checkbox(
                    value: task.isCompleted,
                    onChanged: (_) {
                      controller.toggleTask(task);
                    },
                  ),

                  title: Text(
                    task.taskName,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      decoration: task.isCompleted
                          ? TextDecoration.lineThrough
                          : null,
                    ),
                  ),

                  subtitle: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 5),

                      Text(
                        'Subject: ${task.subject}',
                      ),

                      Text(
                        'Deadline: '
                        '${task.deadline.day}/'
                        '${task.deadline.month}/'
                        '${task.deadline.year}',
                      ),
                    ],
                  ),

                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  AddEditTaskPage(
                                task: task,
                              ),
                            ),
                          );
                        },
                        icon: const Icon(
                          Icons.edit,
                        ),
                      ),

                      IconButton(
                        onPressed: () {
                          controller.deleteTask(
                            task,
                          );
                        },
                        icon: const Icon(
                          Icons.delete,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),

      floatingActionButton:
          FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  const AddEditTaskPage(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}