import 'package:flutter/material.dart';

import './screens/home_screen.dart';

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
      home: HomeScreen(),
      theme: ThemeData(
        // Define the default brightness and colors.

        colorScheme: const ColorScheme(
          primary: Color.fromRGBO(129, 178, 154, 1),
          error: Color.fromRGBO(224, 122, 95, 1),
          background: Color.fromRGBO(241, 250, 238, 1),
          onPrimary: Color.fromRGBO(129, 178, 154, 1),
          onError: Color.fromRGBO(224, 122, 95, 1),
          onSecondary: Color.fromRGBO(204, 224, 215, 1),
          secondaryVariant: Color.fromRGBO(244, 241, 222, 1),
          primaryVariant: Color.fromRGBO(250, 249, 240, 1),
          onSurface: Color.fromRGBO(244, 241, 222, 1),
          surface: Color.fromRGBO(244, 241, 222, 1),
          secondary: Color.fromRGBO(204, 224, 215, 1),
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
