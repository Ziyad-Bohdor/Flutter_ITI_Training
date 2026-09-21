import 'dart:convert';
import 'package:api_with_bloc_app/Model/model.dart';
import 'package:http/http.dart' as http;

class TodoService {

  final String baseUrl = 'https://dummyjson.com/todos';

  Future<List<Todo>> getTodos() async {

    final response = await http.get(
      Uri.parse(baseUrl),
    );

    if (response.statusCode == 200) {

      final data = jsonDecode(response.body);

      final List todosJson = data['todos'];

      return todosJson
          .map((todo) => Todo.fromJson(todo))
          .toList();

    } else {
      throw Exception('Failed to load todos');
    }
  }

  Future<Todo> updateTodo(
    int id,
    bool completed,
  ) async {

    final response = await http.put(
      Uri.parse('$baseUrl/$id'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'completed': completed,
      }),
    );

    if (response.statusCode == 200) {

      return Todo.fromJson(
        jsonDecode(response.body),
      );

    } else {
      throw Exception('Failed to update todo');
    }
  }

  Future<void> deleteTodo(int id) async {

    final response = await http.delete(
      Uri.parse('$baseUrl/$id'),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to delete todo');
    }
  }

  Future<Todo> addTodo(String todo) async {

    final response = await http.post(
      Uri.parse('$baseUrl/add'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'todo': todo,
        'completed': false,
        'userId': 1,
      }),
    );

    if (response.statusCode == 201) {

      return Todo.fromJson(
        jsonDecode(response.body),
      );

    } else {
      throw Exception('Failed to add todo');
    }
  }
}