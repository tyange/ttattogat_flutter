import 'package:flutter/material.dart';
import 'package:ttattogat/models/event.dart';

class EventItem extends StatelessWidget {
  final Event event;

  const EventItem({Key? key, required this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(event.title),
        Text(
          event.amount.toString(),
        ),
      ],
    );
  }
}
