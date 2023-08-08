import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/todo.dart';

class TodoListNotifier extends StateNotifier<List<Todo>> {
  TodoListNotifier() : super([]);

// The whole concept to edit a todo will be findByIdAndUpdate method, i.e, find a todo by its Id then edit that todo to the new value passed.
  void updateTodo(String id, String newTitle) {
    var myLocatedTodo = state.firstWhere((todo) => todo.id == id);

    if (myLocatedTodo.id == id) {
      myLocatedTodo.title = newTitle;
    }
    state = [...state];
  }

  void deleteTodo(String todoId) {
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


