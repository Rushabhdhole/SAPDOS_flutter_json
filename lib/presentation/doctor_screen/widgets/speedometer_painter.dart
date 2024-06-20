// lib/doctor_screen/widgets/speedometer_painter.dart

import 'dart:math';
import 'package:flutter/material.dart';

class SpeedometerPainter extends CustomPainter {
  final double ratio; // Ratio to indicate the progress of the speedometer

  SpeedometerPainter(this.ratio);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8.0;

    Paint arcPaint = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8.0
      ..strokeCap = StrokeCap.round;

    double centerX = size.width / 2;
    double centerY = size.height / 2;
    double radius = min(centerX, centerY);

    canvas.drawArc(
      Rect.fromCircle(center: Offset(centerX, centerY), radius: radius),
      -pi,
      pi,
      false,
      paint,
    );

    // Draw an arc representing the progress
    canvas.drawArc(
      Rect.fromCircle(center: Offset(centerX, centerY), radius: radius),
      -pi,
      pi * ratio,
      false,
      arcPaint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
