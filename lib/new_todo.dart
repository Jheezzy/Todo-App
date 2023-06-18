import 'package:flutter/material.dart';

import '../models/todo.dart';

class NewTodo extends StatefulWidget {
  NewTodo(this.addTodo, {super.key});

  // final ValueChanged<Todo> addTodod;

  final void Function(Todo) addTodo;

  @override
  State<NewTodo> createState() => _NewTodoState();
}

class _NewTodoState extends State<NewTodo> {
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

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Add a new To-do',
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
        ),
        // BuildModalSheet(
        //   onPressed: () {
        // if (_formKey.currentState!.validate()) {
        //   widget.addTodo(Todo(
        //     id: DateTime.now().toIso8601String(),
        //     title: _myController.text,
        //     date: DateTime.now(),
        //   ));
        //   Navigator.of(context).pop();
        //   _myController.clear();
        //     }
        //   },
        //   buttonText: 'ADD THIS SHIT',
        // ),
        IconButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (_) {
                return Container(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 15),
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
                            floatingLabelBehavior: FloatingLabelBehavior.never,
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
                              widget.addTodo(Todo(
                                id: DateTime.now().toIso8601String(),
                                title: _myController.text,
                                date: DateTime.now(),
                              ));
                              Navigator.of(context).pop();
                              _myController.clear();
                            }
                          },
                          child: const Text('ADD'),
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
          icon: const Icon(Icons.add),
        )
      ],
    );
  }
}

//* UPDATED CODE REMOVED FROM TODO LIST
// Row(
//   mainAxisAlignment: MainAxisAlignment.center,
//   children: [
//     const Text('Add a new To-do'),
//     IconButton(
//       onPressed: () {
//         showModalBottomSheet(
//           context: context,
//           builder: (_) {
//             return Container(
//               height: 800,
//               padding:
//                   const EdgeInsets.only(left: 20, right: 20, top: 15),
//               child: Column(
//                 children: [
//                   TextField(
//                     controller: _myController,
//                     textInputAction: TextInputAction.done,
//                     decoration: InputDecoration(
//                       floatingLabelBehavior:
//                           FloatingLabelBehavior.never,
//                       labelText: 'What do you need to do ?',
//                       enabledBorder: OutlineInputBorder(
//                         borderSide: const BorderSide(
//                           width: 3,
//                           color: Color.fromARGB(200, 130, 128, 255),
//                         ),
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       focusedBorder: OutlineInputBorder(
//                         borderSide: const BorderSide(
//                           width: 3,
//                           color: Color.fromARGB(200, 130, 128, 255),
//                         ),
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       suffixIcon: IconButton(
//                         onPressed: () => _myController.clear(),
//                         icon: const Icon(Icons.close),
//                       ),
//                       suffixIconColor:
//                           const Color.fromARGB(255, 130, 128, 255),
//                     ),
//                   ),
//                   const SizedBox(height: 25),
//                   SizedBox(
//                     width: 100,
//                     child: ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         shape: const StadiumBorder(),
//                         backgroundColor:
//                             const Color.fromARGB(255, 130, 128, 255),
//                       ),
//                       onPressed: () => addTodo(_myController.text),
//                       child: const Text('SAVE'),
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           },
//           shape: const RoundedRectangleBorder(
//             borderRadius: BorderRadius.vertical(
//               top: Radius.circular(25),
//             ),
//           ),
//         );
//       },
//       icon: const Icon(Icons.add),
//     )
//   ],
// ),

//todo - I want to find a way to display my todo on the screen
//todo - I'm going to need the :
//todo - new_todo widget which contains the modal sheet and me adding a new todo
//todo - todo_list widget which should contain the list where my new todo will be added from the new_todo widget
