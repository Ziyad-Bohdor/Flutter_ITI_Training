import 'package:api_with_bloc_app/Bloc/todo-event.dart';
import 'package:api_with_bloc_app/Bloc/todo-state.dart';
import 'package:api_with_bloc_app/Controller/controller.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class TodoBloc extends Bloc<TodoEvent, TodoState> {

  final TodoController todoController;

  TodoBloc({
    required this.todoController,
  }) : super(TodoInitial()) {

    on<GetTodos>(_getTodos);

    on<ToggleTodo>(_toggleTodo);

    on<DeleteTodo>(_deleteTodo);

    on<AddTodo>(_addTodo);
  }

  Future<void> _getTodos(
    GetTodos event,
    Emitter<TodoState> emit,
  ) async {

    emit(TodoLoading());

    try {

      final todos =
          await todoController.getTodos();

      emit(
        TodoLoaded(
          todos: todos,
        ),
      );

    } catch (e) {

      emit(
        TodoError(
          message: e.toString(),
        ),
      );
    }
  }

  Future<void> _toggleTodo(
    ToggleTodo event,
    Emitter<TodoState> emit,
  ) async {

    try {

      final updatedTodo =
          await todoController.updateTodo(
        event.id,
        !event.completed,
      );

      if (state is TodoLoaded) {

        final currentTodos =
            (state as TodoLoaded).todos;

        final newTodos =
            currentTodos.map((todo) {

          if (todo.id == updatedTodo.id) {
            return updatedTodo;
          }

          return todo;

        }).toList();

        emit(
          TodoLoaded(
            todos: newTodos,
          ),
        );
      }

    } catch (e) {

      emit(
        TodoError(
          message: e.toString(),
        ),
      );
    }
  }

  Future<void> _deleteTodo(
    DeleteTodo event,
    Emitter<TodoState> emit,
  ) async {

    try {

      await todoController.deleteTodo(
        event.id,
      );

      if (state is TodoLoaded) {

        final currentTodos =
            (state as TodoLoaded).todos;

        final newTodos =
            currentTodos
                .where(
                  (todo) => todo.id != event.id,
                )
                .toList();

        emit(
          TodoLoaded(
            todos: newTodos,
          ),
        );
      }

    } catch (e) {

      emit(
        TodoError(
          message: e.toString(),
        ),
      );
    }
  }

  Future<void> _addTodo(
    AddTodo event,
    Emitter<TodoState> emit,
  ) async {

    try {

      final newTodo =
          await todoController.addTodo(
        event.todo,
      );

      if (state is TodoLoaded) {

        final currentTodos =
            (state as TodoLoaded).todos;

        final newTodos = [
          newTodo,
          ...currentTodos,
        ];

        emit(
          TodoLoaded(
            todos: newTodos,
          ),
        );
      }

    } catch (e) {

      emit(
        TodoError(
          message: e.toString(),
        ),
      );
    }
  }
}