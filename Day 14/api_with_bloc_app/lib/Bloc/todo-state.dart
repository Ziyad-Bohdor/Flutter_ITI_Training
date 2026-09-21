import 'package:api_with_bloc_app/Model/model.dart' show Todo;

abstract class TodoState {}

class TodoInitial extends TodoState {}

class TodoLoading extends TodoState {}

class TodoLoaded extends TodoState {
  final List<Todo> todos;

  TodoLoaded({
    required this.todos,
  });
}

class TodoError extends TodoState {
  final String message;

  TodoError({
    required this.message,
  });
}