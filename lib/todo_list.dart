import 'package:flutter/material.dart';
import 'package:todo_app_fixed/models/todo.dart';
import 'package:todo_app_fixed/todo_item.dart';

import 'main_body.dart';

class TodoList extends StatelessWidget {
  const TodoList(this.todos, {super.key, required this.onEditTodo});

  final Todos todos;
  final void Function(Todo, String?) onEditTodo;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.7,
          child: ListView.builder(
            // shrinkWrap: true,
            // physics: const NeverScrollableScrollPhysics(),
            itemCount: todos.length,
            itemBuilder: (_, i) {
              return TodoItem(todos[i], onEditTodo: onEditTodo);
            },
          ),
        )
        // ListView.builder(
        //   shrinkWrap: true,
        //   physics: const NeverScrollableScrollPhysics(),
        //   itemCount: todos.length,
        //   itemBuilder: (_, i) {
        //     return TodoItem(todos[i].title);
        //   },
        // ),
      ],
    );
  }
}
































//* ORIGINAL
// import 'package:flutter/material.dart';
// import 'package:todo_app_fixed/todo_item.dart';

// class TodoList extends StatelessWidget {
//   const TodoList({super.key});

//   @override
//   Widget build(BuildContext context) {
//     var todos = [];
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 10),
//       height: 400,
//       child: ListView.builder(
//         itemBuilder: (context, index) {
//           return TodoItem();
//         },
//         itemCount: 10,
//       ),
//     );
//   }
// }

//* What do i want to do now
//* I want to be able to add to my list 