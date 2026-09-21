import 'package:api_with_bloc_app/Model/model.dart';
import 'package:api_with_bloc_app/Service/service.dart';


class TodoController {

  final TodoService todoService;

  TodoController({
    required this.todoService,
  });

  Future<List<Todo>> getTodos() async {
    return await todoService.getTodos();
  }

  Future<Todo> updateTodo(
    int id,
    bool completed,
  ) async {
    return await todoService.updateTodo(
      id,
      completed,
    );
  }

  Future<void> deleteTodo(int id) async {
    await todoService.deleteTodo(id);
  }

  Future<Todo> addTodo(String todo) async {
    return await todoService.addTodo(todo);
  }
}