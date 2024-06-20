import 'package:flutter/material.dart';
import 'package:sapdos/presentation/patient_screens/patient_screen2.dart';
import '../../models/doctor.dart'; // Import the Doctor class

class DoctorCard extends StatelessWidget {
  final Doctor doctor;
  final String appointmentIcon;
  final double price;

  DoctorCard({required this.doctor, required this.appointmentIcon, required this.price});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PatientScreen2(doctor: doctor)),
        );
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              CircleAvatar(
                backgroundImage: NetworkImage(doctor.doctorImage),
                radius: 20,
                onBackgroundImageError: (exception, stackTrace) {
                  print('Error loading image: $exception');
                },
                backgroundColor: Colors.grey[200],
              ),
              SizedBox(width: 10), // Space between image and text
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      doctor.name,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12, // Adjust font size
                      ),
                    ),
                    Text(
                      doctor.specialization,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 10, // Adjust font size
                      ),
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.orange, size: 12), // Reduced size
                        Icon(Icons.star, color: Colors.orange, size: 12), // Reduced size
                        Icon(Icons.star, color: Colors.orange, size: 12), // Reduced size
                        Icon(Icons.star_half, color: Colors.orange, size: 12), // Reduced size
                        Icon(Icons.star_border, size: 12), // Reduced size
                        SizedBox(width: 5),
                        Text(
                          '${doctor.rating}',
                          style: TextStyle(fontSize: 10), // Adjust font size
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Image.network(
                          appointmentIcon,
                          height: 14,
                          width: 14,
                          errorBuilder: (context, error, stackTrace) {
                            return Icon(Icons.error, size: 14); // Fallback icon
                          },
                        ),
                        SizedBox(width: 5),
                        Text(
                          '\$$price',
                          style: TextStyle(fontSize: 10), // Adjust font size
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
