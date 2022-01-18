import 'package:flutter/material.dart';
import 'package:ttattogat/models/event.dart';

class EventItem extends StatelessWidget {
  final Event event;
  Function removeEvent;

  EventItem({
    Key? key,
    required this.event,
    required this.removeEvent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(event.id),
      background: Container(
        color: Theme.of(context).errorColor,
        alignment: Alignment.centerRight,
        child: const Icon(
          Icons.delete,
          color: Colors.white,
        ),
      ),
      direction: DismissDirection.endToStart,
      confirmDismiss: (direction) {
        return showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: const Icon(Icons.delete),
            content: const Text('이벤트를 삭제하시겠어요?'),
            actions: <Widget>[
              TextButton(
                child: const Text('삭제할게요'),
                onPressed: () {
                  Navigator.of(ctx).pop(true);
                },
              ),
              TextButton(
                child: const Text("취소!"),
                onPressed: () {
                  Navigator.of(ctx).pop(false);
                },
              )
            ],
          ),
        );
      },
      onDismissed: (direction) {
        removeEvent(event.date, event);
      },
      child: Card(
        color: Theme.of(context).colorScheme.surface,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                event.title,
                style: const TextStyle(
                  fontSize: 13,
                ),
              ),
              Text(
                "₩ ${event.amount.toString()}",
                style: const TextStyle(
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
