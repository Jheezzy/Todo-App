import 'package:flutter/material.dart';
import 'package:todo_app_fixed/new_todo.dart';
import 'package:todo_app_fixed/todo_list.dart';
import 'package:todo_app_fixed/top_container.dart';

import 'daterow.dart';
import 'models/todo.dart';

typedef Todos = List<Todo>;

class MainBody extends StatefulWidget {
  const MainBody({super.key});

  @override
  State<MainBody> createState() => _MainBodyState();
}

class _MainBodyState extends State<MainBody> {
  Todos _myTodoList = [
    // Todo(id: '', title: 'S', date: DateTime.now()),
    // Todo(id: '', title: 'S', date: DateTime.now()),
    // Todo(id: '', title: 'S', date: DateTime.now()),
    // Todo(id: '', title: 'S', date: DateTime.now()),
    // Todo(id: '', title: 'S', date: DateTime.now()),
    // Todo(id: '', title: 'S', date: DateTime.now()),
    // Todo(id: '', title: 'S', date: DateTime.now()),
    // Todo(id: '', title: 'S', date: DateTime.now()),
    // Todo(id: '', title: 'S', date: DateTime.now()),
    // Todo(id: '', title: 'S', date: DateTime.now()),
    // Todo(id: '', title: 'S', date: DateTime.now()),
    // Todo(id: '', title: 'S', date: DateTime.now()),
    // Todo(id: '', title: 'S', date: DateTime.now()),
  ];

  // void _addTodo(Todo todo) {
  //   setState(() {
  //     _myTodoList.add(todo);
  //   });
  // }

  void _editTodo(Todo todo, String? id) {
    if (id != null) {
      _myTodoList = _myTodoList.map((e) {
        if (e.id == id) {
          return todo;
        } else {
          return e;
        }
      }).toList();
      setState(() {});
    } else {
      setState(() {
        _myTodoList.add(todo);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              const TopContainer(),
              const DateRow(),
              TodoList(_myTodoList, onEditTodo: _editTodo),
              // NewTodo(onEditTodo: _addTodo),
            ],
          ),
          bottomSheet: NewTodo(
            onEditTodo: _editTodo,
          ),
        ),
      ),
    );
  }
}

























//* BEFORE SPLITTING INTO WIDGETS
// class MainBody extends StatelessWidget {
//   const MainBody({super.key});

//   @override
//   Widget build(BuildContext context) {
//     var today = DateTime.now();

//     var _myTodoList = [];

//     var myController = TextEditingController();
//     //* The controller is used to get what the user typed
//     //* I created this controller so that anything like a button can be aware of the text in my textfield

//     return SafeArea(
//       child: SingleChildScrollView(
//         //* to fix the renderflex overflow when the keyboard pops up
//         child: Column(
//           children: [
//             Container(
//               margin: const EdgeInsets.only(left: 50, right: 50, top: 40),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   const Text(
//                     'To do',
//                     style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
//                   ),
//                   Text(
//                     DateFormat.MMMMEEEEd().format(today),
//                     style: const TextStyle(
//                       fontSize: 15,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const DateRow(),
//             Container(
//               padding: const EdgeInsets.symmetric(horizontal: 10),
//               height: 400,
//               child: ListView.builder(
//                 itemBuilder: (context, index) {
//                   return TodoItem();
//                 },
//                 itemCount: 10,
//               ),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 const Text('Add a new To-do'),
//                 IconButton(
//                   onPressed: () {
//                     showModalBottomSheet(
//                       context: context,
//                       builder: (_) {
//                         return Container(
//                           height: 800,
//                           padding: const EdgeInsets.only(
//                               left: 20, right: 20, top: 15),
//                           child: Column(
//                             children: [
//                               TextField(
//                                 controller: myController,
//                                 textInputAction: TextInputAction.done,
//                                 decoration: InputDecoration(
//                                   floatingLabelBehavior:
//                                       FloatingLabelBehavior.never,
//                                   labelText: 'What do you need to do ?',
//                                   enabledBorder: OutlineInputBorder(
//                                     borderSide: const BorderSide(
//                                       width: 3,
//                                       color: Color.fromARGB(200, 130, 128, 255),
//                                     ),
//                                     borderRadius: BorderRadius.circular(10),
//                                   ),
//                                   focusedBorder: OutlineInputBorder(
//                                     borderSide: const BorderSide(
//                                       width: 3,
//                                       color: Color.fromARGB(200, 130, 128, 255),
//                                     ),
//                                     borderRadius: BorderRadius.circular(10),
//                                   ),
//                                   suffixIcon: IconButton(
//                                     onPressed: () => myController.clear(),
//                                     icon: const Icon(Icons.close),
//                                   ),
//                                   suffixIconColor:
//                                       const Color.fromARGB(255, 130, 128, 255),
//                                 ),
//                               ),
//                               const SizedBox(height: 25),
//                               SizedBox(
//                                 width: 100,
//                                 child: ElevatedButton(
//                                   style: ElevatedButton.styleFrom(
//                                     shape: const StadiumBorder(),
//                                     backgroundColor: const Color.fromARGB(
//                                         255, 130, 128, 255),
//                                   ),
//                                   onPressed: () {},
//                                   child: const Text('SAVE'),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         );
//                       },
//                       shape: const RoundedRectangleBorder(
//                         borderRadius: BorderRadius.vertical(
//                           top: Radius.circular(25),
//                         ),
//                       ),
//                     );
//                   },
//                   icon: const Icon(Icons.add),
//                 )
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

















































// List get listOfDays {
//   return List.generate(
//       7,
//       (index) {
//         return startFrom.add(Duration(days: index)).day;
//       },
//     );
// }

// List<Map<String, Object>> get groupedTransactionValues {
//   return List.generate(7, (index) {
//     final weekDay = DateTime.now().subtract(
//       Duration(days: index),
//     );

//     var totalSum = 0.0; // total sum for each day

//     for (var i = 0; i < recentTransactions.length; i++) {
//       if (recentTransactions[i].date.day == weekDay.day &&
//           recentTransactions[i].date.month == weekDay.month &&
//           recentTransactions[i].date.year == weekDay.year) {
//         totalSum += recentTransactions[i].amount;
//       }
//     }

//     return {
//       'day': DateFormat.E().format(weekDay).substring(0, 1),
//       'amount': totalSum,
//     };
//   }).reversed.toList();
// }

// double get totalSpending {
//   return groupedTransactionValues.fold(0.0, (sum, item) {
//     return sum + (item['amount'] as double);
//   });
// }
