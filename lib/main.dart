import 'package:flutter/material.dart';

import './screens/events_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '따로또같이',
      home: EventsScreen(),
      theme: ThemeData(
          // Define the default brightness and colors.
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
                surface: Colors.grey[100],
              ),
          // Define the default font family.
          fontFamily: 'Pretendard',
          // Define the default `TextTheme`. Use this to specify the default
          // text styling for headlines, titles, bodies of text, and more.
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
              ))),
    );
  }
}
