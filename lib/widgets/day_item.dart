import 'package:flutter/material.dart';
import 'package:ttattogat/models/day.dart';

class DayItem extends StatelessWidget {
  final Day day;

  const DayItem({Key? key, required this.day}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    day.dateTime.toString(),
                  ),
                  Text(
                    day.title,
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
                '₩ ${day.events.fold(0, (int previousValue, element) => previousValue + element.amount)}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
