abstract class TodoEvent {}

class GetTodos extends TodoEvent {}

class ToggleTodo extends TodoEvent {
  final int id;
  final bool completed;

  ToggleTodo({
    required this.id,
    required this.completed,
  });
}

class DeleteTodo extends TodoEvent {
  final int id;

  DeleteTodo({
    required this.id,
  });
}

class AddTodo extends TodoEvent {
  final String todo;

  AddTodo({
    required this.todo,
  });
}