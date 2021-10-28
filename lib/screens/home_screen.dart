import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Home'),
      ),
      child: ListView(
        children: <Widget>[
          const FittedBox(
            child: Text('기념일'),
          ),
          FittedBox(
            child: Row(
              children: const <Widget>[
                Text('가계부'),
                Text('데이트 회의 개최'),
              ],
            ),
          )
        ],
      ),
    );
  }
}
