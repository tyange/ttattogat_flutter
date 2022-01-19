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
  @override
  Widget build(BuildContext context) {
    final event = ModalRoute.of(context)?.settings.arguments as Event;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Event Detail",
        ),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    DateFormat.yMd().format(event.date),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        child: Text("이미지 추가하기"),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text("수정하기"),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(height: 50),
              Card(
                  child: Container(
                width: 100,
                height: 200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "이미지를 추가해보세요.",
                    )
                  ],
                ),
              )),
              SizedBox(height: 50),
              Text(event.title),
              SizedBox(height: 50),
              Text(event.amount.toString()),
            ],
          ),
        ),
      ),
    );
  }
}
