import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app_fixed/models/todo.dart';

class TodoItem extends StatefulWidget {
  const TodoItem(this.myTodo, this.deleteTodo, this.updateTodo, {super.key});

  final Todo myTodo;
  final void Function(String) deleteTodo;
  final void Function(String, String) updateTodo;

  @override
  State<TodoItem> createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  late TextEditingController _myController;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _myController = TextEditingController();
  }

  @override
  void dispose() {
    _myController.dispose();
    super.dispose();
  }

  void changeTodo(Todo myTodo) {
    setState(() {
      myTodo.isDone = !myTodo.isDone;
    });
  }

  @override
  Widget build(BuildContext context) {
    var currentTime = DateTime.now();

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(13),
        side: const BorderSide(color: Color.fromARGB(41, 0, 0, 0)),
      ),
      child: ListTile(
        onTap: () => changeTodo(widget.myTodo),
        leading: Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
          child: Icon(
            widget.myTodo.isDone
                ? Icons.check_box
                : Icons.check_box_outline_blank,
            size: 30,
            color: Color.fromARGB(220, 130, 128, 255),
          ),
        ),
        title: Text(
          widget.myTodo.title,
          style: TextStyle(
              decoration:
                  widget.myTodo.isDone ? TextDecoration.lineThrough : null),
        ),
        subtitle: Text(
          DateFormat.jm().format(currentTime),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (_) {
                      return Container(
                        padding:
                            const EdgeInsets.only(left: 20, right: 20, top: 15),
                        child: Column(
                          children: [
                            Form(
                              key: _formKey,
                              child: TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter a text';
                                  }
                                  return null;
                                },
                                controller: _myController,
                                textInputAction: TextInputAction.done,
                                decoration: InputDecoration(
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.never,
                                  labelText: 'What do you need to do ?',
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      width: 3,
                                      color: Color.fromARGB(200, 130, 128, 255),
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      width: 2,
                                      color: Colors.red,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      width: 3,
                                      color: Color.fromARGB(200, 130, 128, 255),
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  suffixIcon: IconButton(
                                    onPressed: () => _myController.clear(),
                                    icon: const Icon(Icons.close),
                                  ),
                                  suffixIconColor:
                                      const Color.fromARGB(255, 130, 128, 255),
                                ),
                              ),
                            ),
                            const SizedBox(height: 25),
                            SizedBox(
                              width: 100,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: const StadiumBorder(),
                                  backgroundColor:
                                      const Color.fromARGB(255, 130, 128, 255),
                                ),
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    widget.updateTodo(
                                        widget.myTodo.id, _myController.text);
                                    Navigator.of(context).pop();
                                    _myController.clear();
                                  }
                                },
                                child: const Text('UPDATE'),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(25),
                      ),
                    ),
                  );
                },
                icon: const Icon(
                  Icons.edit,
                  color: Color.fromARGB(220, 130, 128, 255),
                )),
            IconButton(
                onPressed: () => widget.deleteTodo(widget.myTodo.id),
                icon: Icon(
                  Icons.delete,
                  color: Theme.of(context).colorScheme.error,
                )),
          ],
        ),
      ),
    );
  }
}


//* What I want is that I want the time it shows should be the time I added the todo, 
//* Right now it is showing the current time 














































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