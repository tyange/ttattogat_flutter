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

        colorScheme: const ColorScheme(
          primary: Color.fromRGBO(255, 196, 61, 1),
          error: Color.fromRGBO(224, 122, 95, 1),
          background: Color.fromRGBO(241, 250, 238, 1),
          onPrimary: Color.fromRGBO(255, 183, 3, 1),
          onError: Color.fromRGBO(214, 40, 40, 1),
          onSecondary: Color.fromRGBO(251, 133, 0, 1),
          secondaryVariant: Color.fromRGBO(224, 120, 0, 1),
          primaryVariant: Color.fromRGBO(224, 161, 0, 1),
          onSurface: Color.fromRGBO(244, 241, 222, 1),
          surface: Color.fromRGBO(244, 241, 222, 1),
          secondary: Color.fromRGBO(255, 150, 31, 1),
          brightness: Brightness.light,
          onBackground: Color.fromRGBO(241, 250, 238, 1),
        ),

        // Define the default font family.
        fontFamily: 'Pretendard',

        // Define the default `TextTheme`. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
      ),
    );
  }
}
