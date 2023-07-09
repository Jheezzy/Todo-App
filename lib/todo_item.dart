import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app_fixed/models/todo.dart';
// import 'package:todo_app_fixed/new_todo.dart';

class TodoItem extends StatelessWidget {
  const TodoItem(this.myTodo, {super.key, required this.onEditTodo});

  final Todo myTodo;
  final void Function(Todo, String?) onEditTodo;

  @override
  Widget build(BuildContext context) {
    var currentTime = DateTime.now();
    return GestureDetector(
      onTap: () {
        print('TAPPED');
        // => NewTodo(onEditTodo: onEditTodo)
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(13),
          side: const BorderSide(color: Color.fromARGB(41, 0, 0, 0)),
        ),
        child: ListTile(
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.check_box_outline_blank,
              size: 30,
            ),
          ),
          title: Text(myTodo.title),
          subtitle: Text(
            DateFormat.jm().format(currentTime),
          ),
          trailing: const Icon(Icons.notifications),
        ),
      ),
    );
  }
}


//*

// import 'package:flutter/material.dart';

// import '../models/transaction.dart';
// import './transaction_item.dart';

// class TransactionList extends StatelessWidget {
//   // const TransactionList({super.key});
//   final List<Transaction> transactions;
//   final Function deleteTx;

//   const TransactionList(this.transactions, this.deleteTx);

//   @override
//   Widget build(BuildContext context) {
//     print('build() TransactionList');
//     return transactions.isEmpty
//         ? LayoutBuilder(builder: (ctx, constraints) {
//             return Column(
//               children: [
//                 Text(
//                   'No transactions added yet!',
//                   style: Theme.of(context).textTheme.headline6,
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 Container(
//                   height: constraints.maxHeight * 0.6,
//                   child: Image.asset(
//                     'assets/images/waiting.png',
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ],
//             );
//           })
//         : ListView(
//             children: transactions
//                 .map((tx) => TransactionItem(
//                       key: ValueKey(tx.id),
//                       transaction: tx,
//                       deleteTx: deleteTx,
//                     ))
//                 .toList(),
//           );
//   }
// }