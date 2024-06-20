// lib/doctor_screen/widgets/calendar_screen.dart

import 'package:flutter/material.dart';
import 'appointment_item.dart';

class CalendarScreen extends StatelessWidget {
  final DateTime selectedDate;

  CalendarScreen({required this.selectedDate});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Appointments for ${selectedDate.toLocal()}'.split(' ')[0]),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            AppointmentItem(time: '10:00 AM', isCompleted: false),
            AppointmentItem(time: '10:15 AM', isCompleted: true),
            AppointmentItem(time: '10:30 AM', isCompleted: false),
            AppointmentItem(time: '10:45 AM', isCompleted: false),
          ],
        ),
      ),
    );
  }
}
