// lib/models/doctor.dart

class Doctor {
  final String name;
  final String specialization;
  final double rating;
  final String doctorImage;
  final String appointmentIcon;
  final double price;

  Doctor({
    required this.name,
    required this.specialization,
    required this.rating,
    required this.doctorImage,
    required this.appointmentIcon,
    required this.price,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      name: json['name'],
      specialization: json['specialization'],
      rating: json['rating'],
      doctorImage: json['doctorImage'],
      appointmentIcon: json['appointmentIcon'],
      price: json['price'],
    );
  }
}
