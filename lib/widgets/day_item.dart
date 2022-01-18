import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/day.dart';
import '../widgets/event_item.dart';

class DayItem extends StatefulWidget {
  final Day day;
  Function addDayEvent;

  DayItem({Key? key, required this.day, required this.addDayEvent})
      : super(key: key);

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
                          DateFormat.yMd().format(widget.day.dateTime),
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
                    Text(
                      widget.day.title,
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
                  '₩ ${widget.day.events.fold(0, (int previousValue, element) => previousValue + element.amount)}',
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
                    itemCount: widget.day.events.length,
                    itemBuilder: (ctx, i) => EventItem(
                      key: ValueKey(widget.day.events[i].date),
                      event: widget.day.events[i],
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
