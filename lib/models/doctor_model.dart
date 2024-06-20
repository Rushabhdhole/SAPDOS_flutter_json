// lib/models/doctor_model.dart
class Doctor {
  final String doctorImage;
  final String doctorName;
  final String specialization;
  final String appointmentIcon;
  final double price;

  Doctor({
    required this.doctorImage,
    required this.doctorName,
    required this.specialization,
    required this.appointmentIcon,
    required this.price,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      doctorImage: json['doctorImage'],
      doctorName: json['doctorName'],
      specialization: json['specialization'],
      appointmentIcon: json['appointmentIcon'],
      price: json['price'].toDouble(),
    );
  }
}
