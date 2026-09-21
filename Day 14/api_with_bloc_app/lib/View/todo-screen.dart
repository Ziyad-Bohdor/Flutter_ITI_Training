import 'package:api_with_bloc_app/Bloc/todo-Bloc.dart';
import 'package:api_with_bloc_app/Bloc/todo-event.dart';
import 'package:api_with_bloc_app/Bloc/todo-state.dart';
import 'package:api_with_bloc_app/Model/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo App'),
      ),

      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {

          if (state is TodoLoading) {

            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is TodoError) {

            return Center(
              child: Text(
                state.message,
              ),
            );
          }

          if (state is TodoLoaded) {

            final List<Todo> todos =
                state.todos;

            if (todos.isEmpty) {

              return const Center(
                child: Text(
                  'No Todos',
                ),
              );
            }

            return ListView.builder(
              itemCount: todos.length,

              itemBuilder: (
                context,
                index,
              ) {

                final todo =
                    todos[index];

                return ListTile(

                  leading: Checkbox(
                    value: todo.completed,

                    onChanged: (_) {

                      context.read<TodoBloc>().add(
                        ToggleTodo(
                          id: todo.id,
                          completed:
                              todo.completed,
                        ),
                      );
                    },
                  ),

                  title: Text(
                    todo.todo,
                    style: TextStyle(
                      decoration:
                          todo.completed
                              ? TextDecoration.lineThrough
                              : null,
                    ),
                  ),

                  subtitle: Text(
                    'User ID: ${todo.userId}',
                  ),

                  trailing: IconButton(

                    onPressed: () {

                      context.read<TodoBloc>().add(
                        DeleteTodo(
                          id: todo.id,
                        ),
                      );
                    },

                    icon: const Icon(
                      Icons.delete,
                    ),
                  ),
                );
              },
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}