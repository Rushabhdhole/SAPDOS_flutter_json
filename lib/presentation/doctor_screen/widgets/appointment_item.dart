// lib/doctor_screen/widgets/appointment_item.dart

import 'package:flutter/material.dart';

class AppointmentItem extends StatelessWidget {
  final String time;
  final bool isCompleted;

  AppointmentItem({required this.time, required this.isCompleted});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.access_time),
      title: Row(
        children: <Widget>[
          Text(time),
          SizedBox(width: 80), // Increased spacing between time and rectangular box
          Flexible(
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/doctor_screen/doctor_screen2'); // Navigate to DoctorScreen2
              },
              child: Container(
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(4.0),
                ),
                child: Text('Patient Name                                                  X years'),
              ),
            ),
          ),
        ],
      ),
      trailing: Icon(
        isCompleted ? Icons.check_circle : Icons.cancel,
        color: isCompleted ? Colors.green : Colors.red,
      ),
    );
  }
}
