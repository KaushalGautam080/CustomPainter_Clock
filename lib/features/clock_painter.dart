import 'dart:math';

import 'package:flutter/material.dart';

class ClockPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    DateTime dateTime = DateTime.now();

    var centerX = size.width / 2;
    var centerY = size.height / 2;
    // center  point for circle  and start point for all hour, minute and second hand
    var offset = Offset(centerX, centerY);
    // radius of circle
    var radius = min(centerX, centerY);
// calculate endPoint for second hand
    var secX = centerX + 120 * cos((dateTime.second * 6) * pi / 180);
    var secY = centerY + 120 * sin((dateTime.second * 6) * pi / 180);
// calculate endPoint for minute hand
    var minX = centerX + 100 * cos((dateTime.minute * 6) * pi / 180);
    var minY = centerY + 100* sin((dateTime.minute * 6) * pi / 180);
    // calculate endPoint for hour hand
    var hourX = centerX +
        80 * cos((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);
    var hourY = centerX +
        80 * sin((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);
    // endPoint of second hand
    Offset pS2 = Offset(secX, secY);
    // endPoint of minute hand
    Offset pM2 = Offset(minX, minY);
    // endPoint of hour hand
    Offset pH2 = Offset(hourX, hourY);

// grey circle
    canvas.drawCircle(offset, radius, Paint()..color = Colors.grey);

//second hand line
    canvas.drawLine(
        offset,
        pS2,
        Paint()
          ..color = Colors.yellow
          ..strokeWidth = 6
          ..strokeCap = StrokeCap.round);

    //minute hand line
    canvas.drawLine(
        offset,
        pM2,
        Paint()
          ..color = Colors.blue
          ..strokeWidth = 8
          ..strokeCap = StrokeCap.round);

    //hour hand line
    canvas.drawLine(
        offset,
        pH2,
        Paint()
          ..color = Colors.green
          ..strokeWidth = 12
          ..strokeCap = StrokeCap.round);

    // draw outer border of circle
    canvas.drawCircle(
        offset,
        radius,
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 16);

    // draw inner part of circle
    canvas.drawCircle(offset, radius - 120, Paint());

    // draw inner tick
    canvas.drawCircle(offset, radius - 140, Paint()..color = Colors.white);
  }

  @override
  bool shouldRepaint(ClockPainter oldDelegate) {
    // void repaint is called
    return true;
  }
}
