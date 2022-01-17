import 'package:flutter/material.dart';
import 'package:ttattogat/models/event.dart';

class EventItem extends StatelessWidget {
  final Event event;

  const EventItem({Key? key, required this.event}) : super(key: key);

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
            title: Icon(Icons.delete),
            content: Text('이벤트를 삭제하시겠어요?'),
            actions: <Widget>[
              TextButton(
                child: Text('아뇨'),
                onPressed: () {},
              ),
              TextButton(
                child: Text("네"),
                onPressed: () {},
              )
            ],
          ),
        );
      },
      child: Card(
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
