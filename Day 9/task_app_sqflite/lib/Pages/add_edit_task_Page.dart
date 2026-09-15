import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Class/task.dart';
import '../Providers/task_provider.dart';

class AddEditTaskPage extends StatefulWidget {
  final Task? task;

  const AddEditTaskPage({
    super.key,
    this.task,
  });

  @override
  State<AddEditTaskPage> createState() => _AddEditTaskPageState();
}

class _AddEditTaskPageState extends State<AddEditTaskPage> {
  final TextEditingController taskController = TextEditingController();
  final TextEditingController subjectController = TextEditingController();

  DateTime? selectedDate;

  bool get isEditing => widget.task != null;

  @override
  void initState() {
    super.initState();

    if (isEditing) {
      taskController.text = widget.task!.taskName;
      subjectController.text = widget.task!.subject;
      selectedDate = widget.task!.deadline;
    }
  }

  @override
  void dispose() {
    taskController.dispose();
    subjectController.dispose();
    super.dispose();
  }

  Future<void> selectDate() async {
    final date = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    );

    if (date != null) {
      setState(() {
        selectedDate = date;
      });
    }
  }

  void saveTask() {
    if (taskController.text.isEmpty ||
        subjectController.text.isEmpty ||
        selectedDate == null) {
      return;
    }

    final provider = context.read<TaskProvider>();

    if (isEditing) {
      final updatedTask = Task(
        taskName: taskController.text,
        subject: subjectController.text,
        deadline: selectedDate!,
        isCompleted: widget.task!.isCompleted,
      );

      provider.updateTask(
        widget.task!,
        updatedTask,
      );
    } else {
      final newTask = Task(
        taskName: taskController.text,
        subject: subjectController.text,
        deadline: selectedDate!,
      );

      provider.addTask(newTask);
    }

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          isEditing ? 'Edit Task' : 'Add Task',
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: taskController,
              decoration: const InputDecoration(
                labelText: 'Task Name',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: subjectController,
              decoration: const InputDecoration(
                labelText: 'Subject',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: const BorderSide(
                  color: Colors.grey,
                ),
              ),
              title: Text(
                selectedDate == null
                    ? 'Select Deadline'
                    : 'Deadline: '
                        '${selectedDate!.day}/'
                        '${selectedDate!.month}/'
                        '${selectedDate!.year}',
              ),
              trailing: const Icon(Icons.calendar_month),
              onTap: selectDate,
            ),

            const SizedBox(height: 25),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: saveTask,
                child: Text(
                  isEditing ? 'Update Task' : 'Add Task',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}