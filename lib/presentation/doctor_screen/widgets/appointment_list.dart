// lib/doctor_screen/widgets/appointment_list.dart

import 'package:flutter/material.dart';
import 'package:sapdos/presentation/doctor_screen/doctor_screen1.dart';
import 'appointment_item.dart';

class AppointmentList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: <Widget>[
          AppointmentItem(time: '10:00 AM', isCompleted: false),
          AppointmentItem(time: '10:15 AM', isCompleted: true),
          AppointmentItem(time: '10:30 AM', isCompleted: false),
          AppointmentItem(time: '10:45 AM', isCompleted: false),
        ],
      ),
    );
  }
}
