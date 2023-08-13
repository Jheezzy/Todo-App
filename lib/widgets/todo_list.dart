import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app_fixed/services/isar_service.dart';

import 'todo_item.dart';

class TodoList extends ConsumerStatefulWidget {
  const TodoList({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TodoListState();
}

class _TodoListState extends ConsumerState<TodoList> {
  // @override
  // void initState() {
  //   super.initState();
  //   // to allow any async operation inside initState
  //   WidgetsBinding.instance.addPostFrameCallback((_) async {
  //   // immediatedly we are in this page fetch the list<todos>
  //     await ref.read(isarServiceProvider.notifier).getTodos();
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    // final myTodoList = ref.watch(todoListProvider);
    final isarService = ref.watch(isarServiceProvider);

    // To listen for state changes in your state notifier
    // ref.listen<AsyncValue>(isarServiceProvider, (_, state) {
    //   if (!state.isLoading && !state.isRefreshing && state.hasError) {
    //     ScaffoldMessenger.of(context).showSnackBar(
    //       SnackBar(
    //         content: Text('${state.error}'),
    //       ),
    //     );
    //   }
    // });

    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.7,
      child: isarService.when(
        loading: () => const Center(
            child: SizedBox(
                height: 20, width: 20, child: CircularProgressIndicator())),
        error: (e, _) => Center(child: Text('$e')),
        data: (todos) {
          if (todos.isEmpty) {
            return Column(
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
            );
          }
          return ListView.builder(
            itemCount: todos.length,
            itemBuilder: (_, i) {
              // return TodoItem(myTodoList[i], deleteTodo, updateTodo, key: ValueKey(),);

              return TodoItem(
                // key: ValueKey(myTodoList[i].date),
                myTodo: todos[i],

                // updateTodo: updateTodo,
              );
            },
          );
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