import 'package:flutter/material.dart';

import '../models/day.dart';
import '../models/event.dart';
import '../widgets/day_item.dart';

class EventsScreen extends StatelessWidget {
  EventsScreen({Key? key}) : super(key: key);

  final List<Day> days = [
    Day(
      dateTime: DateTime(2022, 01, 01),
      events: [
        Event(
          id: "e11",
          date: DateTime.now(),
          amount: 11231,
          title: "",
        ),
        Event(
          id: "e12",
          date: DateTime.now(),
          amount: 11231,
          title: "",
        ),
        Event(
          id: "e13",
          date: DateTime.now(),
          amount: 11231,
          title: "",
        ),
      ],
      title: "",
    ),
    Day(
      dateTime: DateTime(2022, 01, 02),
      events: [
        Event(
          id: "e21",
          date: DateTime.now(),
          amount: 11231,
          title: "second",
        ),
        Event(
          id: "e22",
          date: DateTime.now(),
          amount: 10000,
          title: "second",
        ),
      ],
      title: "",
    ),
    Day(
      dateTime: DateTime(2022, 01, 03),
      events: [
        Event(
          id: "e31",
          date: DateTime.now(),
          amount: 11231,
          title: "third",
        ),
      ],
      title: "",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const IconButton(
          icon: Icon(Icons.menu),
          tooltip: 'Navigation menu',
          onPressed: null,
        ),
        title: const Text(
          "따로또같이",
          style: TextStyle(
            color: Colors.black87,
            fontFamily: 'Himnae',
            fontSize: 20,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
        shadowColor: const Color.fromRGBO(0, 0, 0, 0.5),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 30),
        child: Column(
          children: days
              .map((day) => DayItem(key: ValueKey(day.dateTime), day: day))
              .toList(),
        ),
      ),
    );
  }
}
