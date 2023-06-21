import 'package:flutter/material.dart';

import 'todo_item.dart';
import '../models/todo.dart';

class TodoList extends StatelessWidget {
  const TodoList(this.myTodoList, this.deleteTodo, this.updateTodo,
      {super.key});

  final List<Todo> myTodoList;
  final void Function(String) deleteTodo;
  final void Function(String, String) updateTodo;
  // final VoidCallback myId;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.7,
      child: myTodoList.isEmpty
          ? Column(
              children: [
                const SizedBox(height: 30),
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(
                    'assets/images/4022568.jpg',
                    height: 300,
                  ),
                ),
                const SizedBox(height: 60),
                const Text(
                  'Nothing to do yet !',
                  style: TextStyle(fontSize: 19),
                )
              ],
            )
          : ListView.builder(
              itemCount: myTodoList.length,
              itemBuilder: (_, i) {
                // return TodoItem(myTodoList[i], deleteTodo, updateTodo, key: ValueKey(),);
                return TodoItem(
                    // key: ValueKey(myTodoList[i].date),
                    myTodo: myTodoList[i],
                    deleteTodo: deleteTodo,
                    updateTodo: updateTodo);
              },
            ),
    );
  }
}


        // ListView.builder(
        //   shrinkWrap: true,
        //   physics: const NeverScrollableScrollPhysics(),
        //   itemCount: todos.length,
        //   itemBuilder: (_, i) {
        //     return TodoItem(todos[i].title);
        //   },
        // ),






























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