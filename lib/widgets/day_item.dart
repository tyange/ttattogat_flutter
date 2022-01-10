import 'package:flutter/material.dart';
import 'package:ttattogat/models/day.dart';

class DayItem extends StatelessWidget {
  final Day day;

  const DayItem({Key? key, required this.day}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        width: double.infinity,
        // margin: const EdgeInsets.only(bottom: 15),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          border: const Border.symmetric(
            horizontal: BorderSide(
              color: Colors.black26,
              width: 0.5,
            ),
          ),
          // borderRadius: const BorderRadius.all(
          //   Radius.circular(10),
          // ),
          // boxShadow: const [
          //   BoxShadow(
          //       color: Colors.black12,
          //       spreadRadius: 0.1,
          //       blurRadius: 2,
          //       offset: Offset(3, 2))
          // ],
        ),
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
