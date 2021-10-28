import 'package:flutter/cupertino.dart';
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
    return const CupertinoApp(
      title: '따로또같이',
      theme: CupertinoThemeData(),
      home: HomeScreen(),
    );
  }
}
