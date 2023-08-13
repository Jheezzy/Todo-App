// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';
import 'package:isar/isar.dart';

import '../todo.dart';

part 'todo_isar.g.dart';

@collection
class TodoIsar {
  TodoIsar({
    required this.id,
    required this.title,
    required this.date,
    this.isDone = false,
  }) : isarId = Isar.autoIncrement;

  late Id isarId;
  late String id;
  late String title;
  late DateTime date;
  late bool isDone;

  factory TodoIsar.fromTodo(Todo todo) {
    return TodoIsar(id: todo.id, title: todo.title, date: todo.date);
  }

  @override
  String toString() {
    return 'TodoIsar(isarId: $isarId, id: $id, title: $title, date: $date, isDone: $isDone)';
  }
}
