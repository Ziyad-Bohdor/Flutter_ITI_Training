class Task {
  int? id;
  String taskName;
  String subject;
  DateTime deadline;
  bool isCompleted;

  Task({
    this.id,
    required this.taskName,
    required this.subject,
    required this.deadline,
    this.isCompleted = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'taskName': taskName,
      'subject': subject,
      'deadline': deadline.millisecondsSinceEpoch,
      'isCompleted': isCompleted ? 1 : 0,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'],
      taskName: map['taskName'],
      subject: map['subject'],
      deadline: DateTime.fromMillisecondsSinceEpoch(map['deadline']),
      isCompleted: map['isCompleted'] == 1,
    );
  }
}