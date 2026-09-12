class Task {
  String taskName;
  String subject;
  DateTime deadline;
  bool isCompleted;

  Task({
    required this.taskName,
    required this.subject,
    required this.deadline,
    this.isCompleted = false,
  });
}