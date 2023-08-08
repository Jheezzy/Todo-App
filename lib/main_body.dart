import 'package:flutter/material.dart';

import 'widgets/new_todo.dart';
import 'widgets/todo_list.dart';
import 'widgets/top_container.dart';
import 'widgets/daterow.dart';
import '../models/todo.dart';

typedef Todos = List<Todo>;

class MainBody extends StatefulWidget {
  const MainBody({super.key});

  @override
  State<MainBody> createState() => _MainBodyState();
}

class _MainBodyState extends State<MainBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: const SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                TopContainer(),
                DateRow(),
                TodoList(),
                // NewTodo(onEditTodo: _addTodo),
              ],
            ),
          ),
          bottomSheet: NewTodo(),
        ),
      ),
    );
  }
}
