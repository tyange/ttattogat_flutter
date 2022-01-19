import 'package:flutter/material.dart';

class EventDetailScreen extends StatefulWidget {
  static const routeName = '/event-detail';

  const EventDetailScreen({Key? key}) : super(key: key);

  @override
  State<EventDetailScreen> createState() => _EventDetailScreenState();
}

class _EventDetailScreenState extends State<EventDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Event Detail",
        ),
      ),
    );
  }
}
