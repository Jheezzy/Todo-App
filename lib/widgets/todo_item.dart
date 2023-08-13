import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:todo_app_fixed/models/todo.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../services/isar_service.dart';

class TodoItem extends ConsumerStatefulWidget {
  const TodoItem({
    super.key,
    required this.myTodo,
  });

  final Todo myTodo;

  @override
  ConsumerState<TodoItem> createState() => _TodoItemState();
}

class _TodoItemState extends ConsumerState<TodoItem> {
  late TextEditingController _myController;
  // late TextEditingController _dateController;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _myController = TextEditingController(text: widget.myTodo.title);
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
      child: Slidable(
        key: UniqueKey(),
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          dismissible: DismissiblePane(onDismissed: () {
            // var index = tdList.indexOf(widget.myTodo);
            ref.read(isarServiceProvider.notifier).deleteTodo(widget.myTodo.id);
          }),
          children: [
            SlidableAction(
              onPressed: (_) {
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
                                // labelText: 'What do you need to do ?',
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
                                // var newText = widget.myTodo.title;
                                // var finalText = _myController.text +

                                if (_formKey.currentState!.validate()) {
                                  ref
                                      .read(isarServiceProvider.notifier)
                                      .updateTodos(
                                        widget.myTodo.id,
                                        _myController.text,
                                      );

                                  // ref
                                  //     .read(todoListProvider.notifier)
                                  //     .updateTodo(
                                  //         widget.myTodo.id, _myController.text);
                                  Navigator.of(context).pop();
                                  _myController.clear();
                                  // widget.updateTodo(
                                  //     widget.myTodo.id, _myController.text);
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
              icon: Icons.edit,
              backgroundColor: const Color.fromARGB(220, 130, 128, 255),
            ),
            SlidableAction(
              onPressed: (_) {
                // var index = tdList.indexOf(widget.myTodo);
                ref
                    .read(isarServiceProvider.notifier)
                    .deleteTodo(widget.myTodo.id);
              },
              icon: Icons.delete,
              backgroundColor: Theme.of(context).colorScheme.error,
            )
          ],
        ),
        child: ListTile(
          onTap: () => changeTodo(widget.myTodo),
          leading: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
            child: Icon(
              widget.myTodo.isDone
                  ? Icons.check_box
                  : Icons.check_box_outline_blank,
              size: 30,
              color: const Color.fromARGB(220, 130, 128, 255),
            ),
          ),
          title: Text(
            widget.myTodo.title,
            style: TextStyle(
                decoration:
                    widget.myTodo.isDone ? TextDecoration.lineThrough : null),
          ),
          subtitle: Text(
            key: UniqueKey(),
            DateFormat.jm().format(currentTime),
          ),
        ),
      ),
    );
  }
}
