import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/event.dart';

class EventDetailScreen extends StatefulWidget {
  static const routeName = '/event-detail';

  const EventDetailScreen({Key? key}) : super(key: key);

  @override
  State<EventDetailScreen> createState() => _EventDetailScreenState();
}

class _EventDetailScreenState extends State<EventDetailScreen> {
  bool _isEditing = false;

  void _convertEditMode() {
    setState(() {
      _isEditing = true;
    });
  }

  void _cancelEditMode() {
    setState(() {
      _isEditing = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final event = ModalRoute.of(context)?.settings.arguments as Event;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Event Detail",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  DateFormat.yMd().format(event.date),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Row(
                  children: [
                    if (!_isEditing)
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text("이미지 추가하기"),
                      ),
                    if (!_isEditing)
                      const SizedBox(
                        width: 5,
                      ),
                    !_isEditing
                        ? ElevatedButton(
                            onPressed: _convertEditMode,
                            child: const Text("수정하기"),
                          )
                        : ElevatedButton(
                            onPressed: _cancelEditMode,
                            child: const Text("취소"),
                            style: ElevatedButton.styleFrom(
                              primary: Theme.of(context).errorColor,
                            ),
                          ),
                  ],
                )
              ],
            ),
            const SizedBox(height: 50),
            Card(
                child: SizedBox(
              width: 100,
              height: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  Text(
                    "이미지를 추가해보세요.",
                  )
                ],
              ),
            )),
            const SizedBox(height: 50),
            Text(event.title),
            const SizedBox(height: 50),
            Text(event.amount.toString()),
          ],
        ),
      ),
    );
  }
}
