import 'package:flutter/material.dart';
import 'package:ttattogat/models/event.dart';
import 'package:ttattogat/widgets/event_item.dart';

class EventsScreen extends StatelessWidget {
  EventsScreen({Key? key}) : super(key: key);

  final List<Event> events = [
    Event(
      id: "e1",
      dateTime: DateTime.now(),
      title: "first-event",
    ),
    Event(
      id: "e2",
      dateTime: DateTime.now(),
      title: "second-event",
    ),
    Event(
      id: "e3",
      dateTime: DateTime.now(),
      title: "third-event",
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
        children: events
            .map(
              (e) => Card(
                child: Row(
                  children: <Widget>[Text(e.title)],
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
