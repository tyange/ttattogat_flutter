import 'package:flutter/material.dart';

import '../models/day.dart';
import '../models/event.dart';
import '../widgets/day_item.dart';
import '../widgets/new_event.dart';

class DaysScreen extends StatefulWidget {
  static const routeName = "/days";

  const DaysScreen({Key? key}) : super(key: key);

  @override
  State<DaysScreen> createState() => _DaysScreenState();
}

class _DaysScreenState extends State<DaysScreen> {
  final List<Day> _days = [
    Day(
      dateTime: DateTime(2022, 01, 01),
    ),
    Day(
      dateTime: DateTime(2022, 01, 02),
    ),
    Day(
      dateTime: DateTime(2022, 01, 03),
    ),
    Day(
      dateTime: DateTime(2022, 01, 04),
    ),
    Day(
      dateTime: DateTime(2022, 01, 05),
    ),
    Day(
      dateTime: DateTime(2022, 01, 06),
    ),
    Day(
      dateTime: DateTime(2022, 01, 07),
    ),
    Day(
      dateTime: DateTime(2022, 01, 08),
    ),
    Day(
      dateTime: DateTime(2022, 01, 09),
    ),
  ];

  final List<Event> _events = [
    Event(
      id: "e11",
      date: DateTime(2022, 01, 01),
      amount: 11231,
      title: "홍콩반점",
    ),
    Event(
      id: "e12",
      date: DateTime(2022, 01, 01),
      amount: 11231,
      title: "유가네",
    ),
    Event(
      id: "e13",
      date: DateTime(2022, 01, 01),
      amount: 11231,
      title: "맥도날드",
    ),
    Event(
      id: "e21",
      date: DateTime(2022, 01, 02),
      amount: 11231,
      title: "cgv",
    ),
    Event(
      id: "e22",
      date: DateTime(2022, 01, 02),
      amount: 10000,
      title: "씽2게더",
    ),
    Event(
      id: "e31",
      date: DateTime(2022, 01, 03),
      amount: 11231,
      title: "롯데리아",
    ),
    Event(
      id: "e41",
      date: DateTime(2022, 01, 04),
      amount: 11231,
      title: "test",
    ),
    Event(
      id: "e51",
      date: DateTime(2022, 01, 05),
      amount: 11231,
      title: "test",
    ),
    Event(
      id: "e61",
      date: DateTime(2022, 01, 06),
      amount: 11231,
      title: "test",
    ),
    Event(
      id: "e71",
      date: DateTime(2022, 01, 07),
      amount: 11231,
      title: "test",
    ),
    Event(
      id: "e81",
      date: DateTime(2022, 01, 08),
      amount: 11231,
      title: "test",
    ),
    Event(
      id: "e91",
      date: DateTime(2022, 01, 09),
      amount: 11231,
      title: "test",
    ),
  ];

  void _addNewDay(
    DateTime chosenDate,
  ) {
    final newDay = Day(
      dateTime: chosenDate,
    );

    setState(() {
      _days.add(newDay);
    });
  }

  void _addNewEvent(
    String eventTitle,
    int eventAmount,
    DateTime createdAt,
  ) {
    final newEvent = Event(
      id: DateTime.now().toString(),
      amount: eventAmount,
      title: eventTitle,
      date: createdAt,
    );

    setState(() {
      _events.add(newEvent);
    });
  }

  void _showAddNewEvent(
    BuildContext ctx,
    DateTime? selectedDay,
  ) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: NewEvent(
            preSelectedDate: selectedDay,
            addNewDay: _addNewDay,
            addNewEvent: _addNewEvent,
          ),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  void _removeEvent(String eventId) {
    setState(() {
      _events.removeWhere((event) => event.id == eventId);
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
            onPressed: () => _showAddNewEvent(context, null),
            icon: const Icon(Icons.event),
            color: Colors.black38,
          )
        ],
        backgroundColor: Theme.of(context).colorScheme.primary,
        // shadowColor: const Color.fromRGBO(0, 0, 0, 0.5),
      ),
      body: ListView.builder(
        itemCount: _days.length,
        itemBuilder: (ctx, i) => DayItem(
            key: ValueKey(_days[i].dateTime),
            date: _days[i].dateTime,
            events: _events
                .where((event) => event.date == _days[i].dateTime)
                .toList(),
            addDayEvent: () => _showAddNewEvent(ctx, _days[i].dateTime),
            removeDayEvent: _removeEvent),
      ),
    );
  }
}
