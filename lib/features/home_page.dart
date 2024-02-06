import 'dart:async';
import 'dart:math';

import 'package:custom_painter_clock/features/clock_painter.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        centerTitle: true,
        title: const Text(
          "CustomClock",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Transform.rotate(
        angle: -pi / 2,
        child: Container(
          alignment: Alignment.center,
          child: CustomPaint(
            painter: ClockPainter(),
            size: const Size(300, 300),
          ),
        ),
      ),
    );
  }
}
