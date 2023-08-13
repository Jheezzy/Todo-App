import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import 'package:todo_app_fixed/models/cache_model/todo_isar.dart';

import '../models/todo.dart';

class IsarService extends StateNotifier<AsyncValue<List<Todo>>> {
  IsarService(this.ref) : super(const AsyncData([])) {
    getTodos();
  }

  final Ref ref;

// to create a todo
  Future<void> createTodo(TodoIsar todo) async {
    try {
      state = const AsyncLoading();
      final isar = await ref.read(_isarProvider.future);
      await isar.writeTxn(() async => await isar.todoIsars.put(todo));
      final allTodos = await isar.todoIsars.where().findAll();
      state = AsyncData(_convertTodoIsarToTodo(allTodos));
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

// to get all Todos
  Future<void> getTodos() async {
    try {
      state = const AsyncLoading();
      final isar = await ref.read(_isarProvider.future);
      final allTodos = await isar.todoIsars.where().findAll();
      state = AsyncData(_convertTodoIsarToTodo(allTodos));
      // state = AsyncError('an error occured', StackTrace.fromString('')); mimicking an error
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  Future<void> updateTodos(String id, String newTitle) async {
    try {
      state = const AsyncLoading();
      final isar = await ref.read(_isarProvider.future);
      final foundTodoIsar =
          await isar.todoIsars.filter().idMatches(id).findFirst();
      if (foundTodoIsar != null) {
        foundTodoIsar.title = newTitle;
        await isar.writeTxn(() async {
          await isar.todoIsars.put(foundTodoIsar);
        });
      }
      final allTodos = await isar.todoIsars.where().findAll();
      state = AsyncData(_convertTodoIsarToTodo(allTodos));
    } catch (e, st) {
      AsyncError(e, st);
    }
  }

// to delete a Todo
  Future<void> deleteTodo(String id) async {
    try {
      state = const AsyncLoading();
      final isar = await ref.read(_isarProvider.future);
      final foundTodoIsar =
          await isar.todoIsars.filter().idMatches(id).findFirst();
      if (foundTodoIsar != null) {
        await isar.writeTxn(
            () async => await isar.todoIsars.delete(foundTodoIsar.isarId));
      }
      final allTodos = await isar.todoIsars.where().findAll();
      state = AsyncData(_convertTodoIsarToTodo(allTodos));
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  List<Todo> _convertTodoIsarToTodo(List<TodoIsar> todoIsar) {
    return todoIsar.map(Todo.fromTodoIsar).toList();
  }
}
// class IsarService extends StateNotifier<AsyncValue<List<Todo>>>{
//   IsarService(this.ref):super(const AsyncData([]));

//   final Ref ref;

// // to create a todo
//   Future<void> createTodo(TodoIsar todo) async {
//     final isar = await ref.read(_isarProvider.future);
//     isar.writeTxnSync(() => isar.todoIsars.putSync(todo));
//   }

// // to get all Todos
//   Future<List<TodoIsar>> getTodos() async {
//     final isar = await ref.read(_isarProvider.future);
//     return isar.todoIsars.where().findAll();
//   }
// }

// final isarServiceProvider = Provider((ref) => IsarService(ref));

final isarServiceProvider =
    StateNotifierProvider<IsarService, AsyncValue<List<Todo>>>((ref) {
  return IsarService(ref);
});

final _isarProvider = FutureProvider<Isar>((ref) async {
  final dir = await getApplicationDocumentsDirectory();
  // opening an isar instance
  return await Isar.open([TodoIsarSchema], directory: dir.path);
});

// final _fetchTodosProvider =
//     FutureProvider.autoDispose<List<TodoIsar>>((ref) async {
//   final isar = await ref.read(_isarProvider.future);
//   return isar.todoIsars.where().findAll();
// });
