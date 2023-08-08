import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/todo.dart';

class TodoListNotifier extends StateNotifier<List<Todo>> {
  TodoListNotifier() : super([]);

  void updateTodo(String id, String newTitle) {
    var myLocatedTodo = state.firstWhere((todo) => todo.id == id);

    if (myLocatedTodo.id == id) {
      myLocatedTodo.title = newTitle;
    }
  }

  void deleteTodo(String todoId) {
//  state = state.removeWhere((todo) => todo.id == todoId);
    // state = [
    //   for (final todo in state)
    //     if (todo.id == todoId) todo
    // ];
    // state.removeAt(todoId); then i set todo id in the class as an integer
    state.removeWhere((todo) => todo.id == todoId);
    state = [...state];
  }

  void addTodo(Todo todo) {
    state = [...state, todo];
  }
}

final todoListProvider = StateNotifierProvider<TodoListNotifier, List<Todo>>(
  (ref) => TodoListNotifier(),
);

//* I want to delete a todo
//* I have to change state in an immutable way

void _updateTodo(String id, String newTitle) {}
