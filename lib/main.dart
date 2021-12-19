import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:stopwatch/timer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'STOPWATCH',
      home: Scaffold(backgroundColor: Colors.white, body: TimerScreen()),
    );
  }
}
