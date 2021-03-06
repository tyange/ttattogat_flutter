import 'package:flutter/material.dart';
import 'package:ttattogat/screens/event_detail_screen.dart';

import 'screens/days_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '따로또같이',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.green,
        )
            .copyWith(primary: Colors.green[600])
            .copyWith(secondary: Colors.indigo[900])
            .copyWith(error: Colors.redAccent)
            .copyWith(
              background: Colors.white,
            )
            .copyWith(
              // color name: cosmic latte
              surface: const Color(0xfffff8e7),
            ),
        fontFamily: 'Pretendard',
        textTheme: const TextTheme(
          headline6: TextStyle(
            fontFamily: 'Gowun Dodum',
            color: Colors.black,
            fontSize: 20,
          ),
          bodyText1: TextStyle(
            fontFamily: 'Pretendard',
            color: Colors.black87,
            fontSize: 16,
          ),
          bodyText2: TextStyle(
            fontFamily: 'Pretendard',
            color: Colors.black87,
            fontSize: 14,
          ),
        ),
      ),
      home: DaysScreen(),
      routes: {
        DaysScreen.routeName: (ctx) => DaysScreen(),
        EventDetailScreen.routeName: (ctx) => EventDetailScreen(),
      },
    );
  }
}
