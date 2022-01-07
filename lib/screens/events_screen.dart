import 'package:flutter/material.dart';

import '../models/day.dart';
import '../models/event.dart';
import '../widgets/day_item.dart';

class EventsScreen extends StatelessWidget {
  EventsScreen({Key? key}) : super(key: key);

  final List<Day> days = [
    Day(
      dateTime: DateTime.now(),
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
      dateTime: DateTime.now(),
      events: [
        Event(
          id: "e21",
          date: DateTime.now(),
          amount: 11231,
          title: "second",
        ),
      ],
      title: "",
    ),
    Day(
      dateTime: DateTime.now(),
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
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Column(
        children: days
            .map(
              (e) => Card(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            e.dateTime.toString(),
                          ),
                          Text(
                            e.title,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 15,
                      ),
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        '₩ ${e.events.fold(0, (int previousValue, element) => previousValue + element.amount)}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
