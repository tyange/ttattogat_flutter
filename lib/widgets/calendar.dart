import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      locale: 'en_US',
      focusedDay: DateTime.now().toLocal(),
      firstDay: DateTime(1990, 01, 01).toLocal(),
      lastDay: DateTime(2100, 12, 31).toLocal(),
      // TODO: 날짜 선택하도록 만들기
      // TODO: 날짜 선택 후 선택한 날짜에 이벤트 추가
    );
  }
}
