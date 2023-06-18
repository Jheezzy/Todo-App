import 'package:flutter/material.dart';
import 'package:weekly_date_picker/weekly_date_picker.dart';
// import 'package:intl/intl.dart';

var inactiveColor = Colors.white;
var activeColor = const Color.fromARGB(120, 155, 39, 176);

class DateRow extends StatefulWidget {
  const DateRow({super.key});

  @override
  State<DateRow> createState() => _DateRowState();
}

class _DateRowState extends State<DateRow> {
  @override
  Widget build(BuildContext context) {
    var selectedDay = DateTime.now();
    // var startFrom = today.subtract(const Duration(days: 6));

    return Card(
      // color: Colors.red,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: WeeklyDatePicker(
        selectedDay: selectedDay,
        changeDay: (_) {},
        enableWeeknumberText: false,
        selectedBackgroundColor: const Color.fromARGB(121, 130, 128, 255),
        selectedDigitColor: Colors.black,
      ),
    );
  }
}





//* INITIAL CODE
// import 'package:flutter/material.dart';
// import 'package:horizontal_week_calendar/horizontal_week_calendar.dart';
// // import 'package:intl/intl.dart';

// var inactiveColor = Colors.white;
// var activeColor = const Color.fromARGB(120, 155, 39, 176);

// class DateRow extends StatefulWidget {
//   const DateRow({super.key});

//   @override
//   State<DateRow> createState() => _DateRowState();
// }

// class _DateRowState extends State<DateRow> {
//   void tap(Color selectedColor) {
//     if (selectedColor == inactiveColor) {
//       setState(() {
//         inactiveColor = activeColor;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     var today = DateTime.now();
//     var startFrom = today.subtract(const Duration(days: 6));

//     var listOfDays = List.generate(
//       7,
//       (index) {
//         return startFrom.add(Duration(days: index)).day;
//       },
//     );

//     return Container(
//       // color: Colors.red,
//       margin: const EdgeInsets.symmetric(vertical: 20),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           ...listOfDays.map(
//             (day) => GestureDetector(
//               onTap: () => tap(inactiveColor),
//               child: Container(
//                 width: 40,
//                 height: 40,
//                 // ignore: prefer_const_constructors
//                 decoration: BoxDecoration(
//                   color: inactiveColor,
//                   shape: BoxShape.circle,
//                 ),
//                 child: Center(
//                   child: Text(
//                     '$day',
//                     style: const TextStyle(fontSize: 16),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }





















//* DATE ROW PICKER FIXED
// import 'package:flutter/material.dart';
// // import 'package:intl/intl.dart';

// var inactiveColor = Colors.white;
// var activeColor = const Color.fromARGB(120, 155, 39, 176);

// var idOneColor = inactiveColor;
// var idTwoColor = inactiveColor;
// var idThreeColor = inactiveColor;
// var idFourColor = inactiveColor;
// var idFiveColor = inactiveColor;
// var idSixColor = inactiveColor;
// var idSevenColor = inactiveColor;

// var today = DateTime.now();
// var startFrom = today.subtract(const Duration(days: 6));

// var idOne = 'day 1';
// var idTwo = 'day 2';
// var idThree = 'day 3';
// var idFour = 'day 4';
// var idFive = 'day 5';
// var idSix = 'day 6';
// var idSeven = 'day 7';

// class DateRow extends StatefulWidget {
//   const DateRow({super.key});

//   @override
//   State<DateRow> createState() => _DateRowState();
// }

// class _DateRowState extends State<DateRow> {
//   void tap(Color myColor, String id) {
//     if (myColor == inactiveColor && id == idOne) {
//       setState(() {
//         idOneColor = activeColor;
//         idTwoColor = inactiveColor;
//         idThreeColor = inactiveColor;
//         idFourColor = inactiveColor;
//         idFiveColor = inactiveColor;
//         idSixColor = inactiveColor;
//         idSevenColor = inactiveColor;
//       });
//     } else if (myColor == inactiveColor && id == idTwo) {
//       setState(() {
//         idOneColor = inactiveColor;
//         idTwoColor = activeColor;
//         idThreeColor = inactiveColor;
//         idFourColor = inactiveColor;
//         idFiveColor = inactiveColor;
//         idSixColor = inactiveColor;
//         idSevenColor = inactiveColor;
//       });
//     } else if (myColor == inactiveColor && id == idThree) {
//       setState(() {
//         idOneColor = inactiveColor;
//         idTwoColor = inactiveColor;
//         idThreeColor = activeColor;
//         idFourColor = inactiveColor;
//         idFiveColor = inactiveColor;
//         idSixColor = inactiveColor;
//         idSevenColor = inactiveColor;
//       });
//     } else if (myColor == inactiveColor && id == idFour) {
//       setState(() {
//         idOneColor = inactiveColor;
//         idTwoColor = inactiveColor;
//         idThreeColor = inactiveColor;
//         idFourColor = activeColor;
//         idFiveColor = inactiveColor;
//         idSixColor = inactiveColor;
//         idSevenColor = inactiveColor;
//       });
//     } else if (myColor == inactiveColor && id == idFive) {
//       setState(() {
//         idOneColor = inactiveColor;
//         idTwoColor = inactiveColor;
//         idThreeColor = inactiveColor;
//         idFourColor = inactiveColor;
//         idFiveColor = activeColor;
//         idSixColor = inactiveColor;
//         idSevenColor = inactiveColor;
//       });
//     } else if (myColor == inactiveColor && id == idSix) {
//       setState(() {
//         idOneColor = inactiveColor;
//         idTwoColor = inactiveColor;
//         idThreeColor = inactiveColor;
//         idFourColor = inactiveColor;
//         idFiveColor = inactiveColor;
//         idSixColor = activeColor;
//         idSevenColor = inactiveColor;
//       });
//     } else if (myColor == inactiveColor && id == idSeven) {
//       setState(() {
//         idOneColor = inactiveColor;
//         idTwoColor = inactiveColor;
//         idThreeColor = inactiveColor;
//         idFourColor = inactiveColor;
//         idFiveColor = inactiveColor;
//         idSixColor = inactiveColor;
//         idSevenColor = activeColor;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     Widget dateWidget(int theDay, Color idColor) {
//       return Container(
//         width: 40,
//         height: 40,
//         // ignore: prefer_const_constructors
//         decoration: BoxDecoration(
//           color: idColor,
//           shape: BoxShape.circle,
//         ),
//         child: Center(
//           child: Text('$theDay'),
//         ),
//       );
//     }
//     // var today = DateTime.now();
//     // var startFrom = today.subtract(const Duration(days: 6));

//     // var listOfDays = List.generate(
//     //   7,
//     //   (index) {
//     //     return startFrom.add(Duration(days: index)).day;
//     //   },
//     // );

//     return Container(
//       // color: Colors.red,
//       margin: const EdgeInsets.symmetric(vertical: 20),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           GestureDetector(
//             onTap: () => tap(inactiveColor, 'day 1'),
//             child: dateWidget(
//               startFrom.add(const Duration(days: 0)).day,
//               idOneColor,
//             ),
//           ),
//           GestureDetector(
//             onTap: () => tap(inactiveColor, 'day 2'),
//             child: dateWidget(
//               startFrom.add(const Duration(days: 1)).day,
//               idTwoColor,
//             ),
//           ),
//           GestureDetector(
//             onTap: () => tap(inactiveColor, 'day 3'),
//             child: dateWidget(
//               startFrom.add(const Duration(days: 2)).day,
//               idThreeColor,
//             ),
//           ),
//           GestureDetector(
//             onTap: () => tap(inactiveColor, 'day 4'),
//             child: dateWidget(
//               startFrom.add(const Duration(days: 3)).day,
//               idFourColor,
//             ),
//           ),
//           GestureDetector(
//             onTap: () => tap(inactiveColor, 'day 5'),
//             child: dateWidget(
//               startFrom.add(const Duration(days: 4)).day,
//               idFiveColor,
//             ),
//           ),
//           GestureDetector(
//             onTap: () => tap(inactiveColor, 'day 6'),
//             child: dateWidget(
//               startFrom.add(const Duration(days: 5)).day,
//               idSixColor,
//             ),
//           ),
//           GestureDetector(
//             onTap: () => tap(inactiveColor, 'day 7'),
//             child: dateWidget(
//               startFrom.add(const Duration(days: 6)).day,
//               idSevenColor,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }






//* CODE TO SET A CONTAINER TO CIRCLE SHAPE
// import 'package:flutter/material.dart';
// // import 'package:intl/intl.dart';

// var inactiveColor = Colors.white;
// var activeColor = Colors.purple;

// class DateRow extends StatefulWidget {
//   const DateRow({super.key});

//   @override
//   State<DateRow> createState() => _DateRowState();
// }

// class _DateRowState extends State<DateRow> {
//   void tap(Color selectedColor) {
//     if (selectedColor == inactiveColor) {
//       setState(() {
//         inactiveColor = activeColor;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     var today = DateTime.now();
//     var startFrom = today.subtract(const Duration(days: 6));

//     var listOfDays = List.generate(
//       7,
//       (index) {
//         return startFrom.add(Duration(days: index)).day;
//       },
//     );

//     return Container(
//       width: 100,
//       height: 100,
//       decoration: BoxDecoration(
//         color: Color.fromARGB(138, 155, 39, 176),
//         shape: BoxShape.circle,
//       ),
//       margin: EdgeInsets.symmetric(vertical: 26),
//       child: Center(
//         child: Text(
//           'JIDE',
//           style: const TextStyle(fontSize: 30),
//         ),
//       ),
//     );
//   }
// }

//* CODE TO LEARN SWITCHING ACTIVE SELECTION

// import 'package:flutter/material.dart';

// // var justColor = Colors.white;
// var inactiveColor = Colors.white;
// var activeColor = Colors.purple;
// var idOne = 'TAP 1';
// var idTwo = 'TAP 2';
// var idThree = 'TAP 3';
// var idOneColor = inactiveColor;
// var idTwoColor = inactiveColor;
// var idThreeColor = inactiveColor;

// class DateRow extends StatefulWidget {
//   const DateRow({super.key});

//   @override
//   State<DateRow> createState() => _DateRowState();
// }

// class _DateRowState extends State<DateRow> {
//   void tap(Color myColor, String id) {
//     if (myColor == inactiveColor && id == idOne) {
//       setState(() {
//         idOneColor = activeColor;
//         idTwoColor = inactiveColor;
//         idThreeColor = inactiveColor;
//       });
//     } else if (myColor == inactiveColor && id == idTwo) {
//       setState(() {
//         idOneColor = inactiveColor;
//         idTwoColor = activeColor;
//         idThreeColor = inactiveColor;
//       });
//     } else if (myColor == inactiveColor && id == idThree) {
//       setState(() {
//         idOneColor = inactiveColor;
//         idTwoColor = inactiveColor;
//         idThreeColor = activeColor;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         GestureDetector(
//           onTap: () => tap(inactiveColor, 'TAP 1'),
//           child: Container(
//             padding: const EdgeInsets.only(left: 20),
//             width: 100,
//             height: 30,
//             color: idOneColor,
//             child: const MyText('TAP 1'),
//           ),
//         ),
//         const SizedBox(
//           height: 15,
//         ),
//         GestureDetector(
//           onTap: () => tap(inactiveColor, 'TAP 2'),
//           child: Container(
//               padding: const EdgeInsets.only(left: 20),
//               width: 100,
//               height: 30,
//               color: idTwoColor,
//               child: const MyText('TAP 2')),
//         ),
//         const SizedBox(
//           height: 15,
//         ),
//         GestureDetector(
//           onTap: () => tap(inactiveColor, 'TAP 3'),
//           child: Container(
//               padding: const EdgeInsets.only(left: 20),
//               width: 100,
//               height: 30,
//               color: idThreeColor,
//               child: const MyText('TAP 3')),
//         ),
//         const SizedBox(
//           height: 15,
//         ),
//       ],
//     );
//   }
// }

// class MyText extends StatelessWidget {
//   const MyText(this.id, {super.key});

//   final String id;

//   @override
//   Widget build(BuildContext context) {
//     return Text(
//       id,
//       style: const TextStyle(fontSize: 25),
//     );
//   }
// }
