import '../models/event.dart';

class Day {
  final DateTime dateTime;
  final List<Event> events;
  String title;

  Day({
    required this.dateTime,
    required this.events,
    required this.title,
  });
}
