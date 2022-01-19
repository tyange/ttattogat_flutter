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
      events: [
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
      ],
      title: "",
    ),
    Day(
      dateTime: DateTime(2022, 01, 02),
      events: [
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
      ],
      title: "",
    ),
    Day(
      dateTime: DateTime(2022, 01, 03),
      events: [
        Event(
          id: "e31",
          date: DateTime(2022, 01, 03),
          amount: 11231,
          title: "롯데리아",
        ),
      ],
      title: "",
    ),
    Day(
      dateTime: DateTime(2022, 01, 04),
      events: [
        Event(
          id: "e41",
          date: DateTime(2022, 01, 04),
          amount: 11231,
          title: "test",
        ),
      ],
      title: "",
    ),
    Day(
      dateTime: DateTime(2022, 01, 05),
      events: [
        Event(
          id: "e51",
          date: DateTime(2022, 01, 05),
          amount: 11231,
          title: "test",
        ),
      ],
      title: "",
    ),
    Day(
      dateTime: DateTime(2022, 01, 06),
      events: [
        Event(
          id: "e61",
          date: DateTime(2022, 01, 06),
          amount: 11231,
          title: "test",
        ),
      ],
      title: "",
    ),
    Day(
      dateTime: DateTime(2022, 01, 07),
      events: [
        Event(
          id: "e71",
          date: DateTime(2022, 01, 07),
          amount: 11231,
          title: "test",
        ),
      ],
      title: "",
    ),
    Day(
      dateTime: DateTime(2022, 01, 08),
      events: [
        Event(
          id: "e81",
          date: DateTime(2022, 01, 08),
          amount: 11231,
          title: "test",
        ),
      ],
      title: "",
    ),
    Day(
      dateTime: DateTime(2022, 01, 09),
      events: [
        Event(
          id: "e91",
          date: DateTime(2022, 01, 09),
          amount: 11231,
          title: "test",
        ),
      ],
      title: "",
    ),
  ];

  void _addNewDayWithEvent(
    String eventTitle,
    int eventAmount,
    DateTime chosenDate,
  ) {
    final newDay = Day(title: "", dateTime: chosenDate, events: [
      Event(
        amount: eventAmount,
        title: eventTitle,
        date: chosenDate,
        id: DateTime.now().toString(),
      )
    ]);

    setState(() {
      _days.add(newDay);
    });
  }

  void _addNewEvent(
    String eventTitle,
    int eventAmount,
    DateTime createdAt,
  ) {
    final targetDay = _days.firstWhere((day) => day.dateTime == createdAt);
    final targetDayIndex = _days.indexOf(targetDay);
    final newEvent = Event(
      id: createdAt.toString(),
      amount: eventAmount,
      title: eventTitle,
      date: createdAt,
    );

    targetDay.events.add(newEvent);

    setState(() {
      _days[targetDayIndex] = targetDay;
    });
  }

  void _showAddNewEvent(BuildContext ctx, DateTime? selectedDay) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: NewEvent(
            preSelectedDate: selectedDay,
            addNewDay: _addNewDayWithEvent,
            addNewEvent: _addNewEvent,
          ),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  void _removeEvent(DateTime createdAt, Event deletingEvent) {
    final targetDay = _days.firstWhere((day) => day.dateTime == createdAt);
    final targetDayIndex = _days.indexOf(targetDay);
    targetDay.events.remove(deletingEvent);

    setState(() {
      _days[targetDayIndex] = targetDay;
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
            day: _days[i],
            addDayEvent: () => _showAddNewEvent(ctx, _days[i].dateTime),
            removeDayEvent: _removeEvent),
      ),
    );
  }
}
