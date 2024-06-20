// lib/doctor_screen/widgets/appointment_card.dart

import 'package:flutter/material.dart';
import 'dart:math';

class AppointmentCard extends StatelessWidget {
  final String title;
  final int completed;
  final int total;

  AppointmentCard(this.title, this.completed, this.total);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFF7E91D4),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            CustomPaint(
              size: Size(100, 100),
              painter: SpeedometerPainter(completed / total),
            ),
            SizedBox(height: 1),
            Text(
              '$completed/$total',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 1),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SpeedometerPainter extends CustomPainter {
  final double ratio;
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
