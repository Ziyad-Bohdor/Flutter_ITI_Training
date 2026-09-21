import 'package:api_with_bloc_app/Bloc/todo-Bloc.dart';
import 'package:api_with_bloc_app/Bloc/todo-event.dart';
import 'package:api_with_bloc_app/Controller/controller.dart';
import 'package:api_with_bloc_app/Service/service.dart';
import 'package:api_with_bloc_app/View/todo-screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


void main() {

  final TodoService todoService =
      TodoService();

  final TodoController todoController =
      TodoController(
    todoService: todoService,
  );

  runApp(
    MyApp(
      todoController: todoController,
    ),
  );
}

class MyApp extends StatelessWidget {

  final TodoController todoController;

  const MyApp({
    super.key,
    required this.todoController,
  });

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: BlocProvider(
        create: (context) =>
            TodoBloc(
              todoController:
                  todoController,
            )..add(
                GetTodos(),
              ),

        child: const TodoScreen(),
      ),
    );
  }
}