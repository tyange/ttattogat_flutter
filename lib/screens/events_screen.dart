import 'package:flutter/material.dart';

import '../models/day.dart';
import '../models/event.dart';
import '../widgets/day_item.dart';

class EventsScreen extends StatefulWidget {
  const EventsScreen({Key? key}) : super(key: key);

  @override
  State<EventsScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
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

  late DateTime _selectedDate;

  void _showAddNewEvent(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: Card(
            child: Container(
              child: Text("add new event"),
            ),
          ),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      firstDate: DateTime(1990),
      lastDate: DateTime(2100, 12, 31),
      initialDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const IconButton(
          icon: Icon(Icons.people),
          tooltip: 'Navigation menu',
          onPressed: null,
        ),
        title: Text(
          "따로또같이",
          style: Theme.of(context).textTheme.headline6,
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () => _showAddNewEvent(context),
            icon: const Icon(Icons.add),
            color: Colors.black38,
          )
        ],
        backgroundColor: Theme.of(context).colorScheme.primary,
        // shadowColor: const Color.fromRGBO(0, 0, 0, 0.5),
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
