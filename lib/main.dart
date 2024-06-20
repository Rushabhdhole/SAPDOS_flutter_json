import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sapdos/presentation/doctor_screen/doctor_screen1.dart';
import 'package:sapdos/presentation/doctor_screen/doctor_screen2.dart';
import 'bloc/auth_bloc.dart';
import 'presentation/login_screens/login_screen1.dart';
import 'presentation/login_screens/login_screen2.dart';
import 'presentation/login_screens/login_screen3.dart';
import 'presentation/patient_screens/patient_screen1.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SAPDOS',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false, 
      home: BlocProvider(
        create: (context) => AuthBloc(),
        child: Screen1(),
      ),
      routes: {
        '/screen1': (context) => Screen1(),
        '/screen2': (context) => Screen2(),
        '/screen3': (context) => Screen3(),
        '/doctor_screen/doctor_screen1.dart': (context) => DoctorScreen1(),
        '/doctor_screen/doctor_screen2': (context) => DoctorScreen2(),
        '/patient_screens/patient_screen1.dart': (context) => PatientScreen1(),
      },
    );
  }
}
