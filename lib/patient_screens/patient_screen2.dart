import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/doctor.dart';
import '../payment_screens/payment_screen1.dart';

class PatientScreen2 extends StatefulWidget {
  final Doctor doctor;

  PatientScreen2({required this.doctor});

  @override
  _PatientScreen2State createState() => _PatientScreen2State();
}

class _PatientScreen2State extends State<PatientScreen2> {
  DateTime _selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != _selectedDate)
      setState(() {
        _selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    final Doctor doctor = widget.doctor;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(doctor.name),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: NetworkImage('https://www.gravatar.com/avatar/2c7d99fe281ecd3bcd65ab915bac6dd5?s=250'),
                    radius: 60,
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Dr.${doctor.name}',
                              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                            Row(
                              children: [
                                Icon(Icons.star, color: Colors.orange, size: 20),
                                Icon(Icons.star, color: Colors.orange, size: 20),
                                Icon(Icons.star, color: Colors.orange, size: 20),
                                Icon(Icons.star_half, color: Colors.orange, size: 20),
                                Icon(Icons.star_border, size: 20),
                                SizedBox(width: 5),
                                Text(
                                  '512',
                                  style: TextStyle(fontSize: 18),
                                ),
                                SizedBox(width: 10),
                                Icon(Icons.calendar_today, size: 20),
                                SizedBox(width: 5),
                                Text(
                                  '5 Years',
                                  style: TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Icon(Icons.medical_services, size: 18),
                            SizedBox(width: 5),
                            Text(
                              doctor.specialization,
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Icon(Icons.school, size: 18),
                            SizedBox(width: 5),
                            Text(
                              'BDS, DDS',
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Description',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFF13235A),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.access_time, color: Colors.white),
                        SizedBox(width: 5),
                        Text(
                          'Available Slots',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                      icon: Icon(Icons.calendar_today, color: Colors.white),
                      onPressed: () {
                        _selectDate(context);
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Selected Date: ${DateFormat('yMMMd').format(_selectedDate)}',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: List.generate(6, (index) {
                  return ChoiceChip(
                    label: Text('10:00 - 10:15 AM'),
                    selected: index == 0,
                    onSelected: (selected) {},
                  );
                }),
              ),
              SizedBox(height: 50),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PaymentScreen1()),
                    );
                  },
                  child: Text('Book Appointment'),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white, backgroundColor: Color(0xFF13235A), // Text color
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    textStyle: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
