import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/event.dart';
import '../widgets/event_item.dart';

class DayItem extends StatefulWidget {
  final DateTime date;
  final List<Event> events;
  Function addDayEvent;
  Function removeDayEvent;

  DayItem({
    Key? key,
    required this.date,
    required this.events,
    required this.addDayEvent,
    required this.removeDayEvent,
  }) : super(key: key);

  @override
  State<DayItem> createState() => _DayItemState();
}

class _DayItemState extends State<DayItem> {
  bool _showEvents = false;

  void _showEventHandler() {
    setState(() {
      _showEvents = true;
    });
  }

  void _hideEventHandler() {
    setState(() {
      _showEvents = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: <Widget>[
                        Text(
                          DateFormat.yMd().format(widget.date),
                        ),
                        TextButton(
                          onPressed: () => widget.addDayEvent(),
                          child: Row(
                            children: const <Widget>[
                              Icon(
                                Icons.add,
                                size: 10,
                              ),
                              Text(
                                "이벤트 추가",
                                style: TextStyle(
                                  fontSize: 10,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
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
                  '₩ ${widget.events.fold(0, (int previousValue, element) => previousValue + element.amount)}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              _showEvents
                  ? IconButton(
                      icon: const Icon(Icons.keyboard_arrow_up),
                      onPressed: _hideEventHandler,
                    )
                  : IconButton(
                      icon: const Icon(Icons.keyboard_arrow_down),
                      onPressed: _showEventHandler,
                    )
            ],
          ),
          if (_showEvents)
            Row(
              children: <Widget>[
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: widget.events.length,
                    itemBuilder: (ctx, i) => EventItem(
                      key: ValueKey(widget.events[i].date),
                      event: widget.events[i],
                      removeEvent: widget.removeDayEvent,
                    ),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
