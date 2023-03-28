import 'package:flutter/material.dart';
import 'package:timerblocapp/timer/view/timer_page.dart';

class TimerApp extends StatelessWidget {
  const TimerApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Timer BloC App',
      theme: ThemeData(
          primaryColor: Colors.lime,
          colorScheme: const ColorScheme.light(secondary: Colors.red)),
          home: const TimerPage(),
    );
  }
}
