// lib/models/doctor_data.dart

import 'dart:convert';
import 'package:flutter/services.dart';
import 'doctor.dart';

class DoctorData {
  static Future<List<Doctor>> fetchDoctorsFromJson() async {
    final String response = await rootBundle.loadString('assets/doctors_list.json');
    final List<dynamic> data = json.decode(response);
    return data.map((json) => Doctor.fromJson(json)).toList();
  }
}
