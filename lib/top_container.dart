import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TopContainer extends StatelessWidget {
  const TopContainer({super.key});

  @override
  Widget build(BuildContext context) {
    var today = DateTime.now();
    return Container(
      margin: const EdgeInsets.only(left: 50, right: 50, top: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'To do',
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
          ),
          Text(
            DateFormat.MMMMEEEEd().format(today),
            style: const TextStyle(
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
