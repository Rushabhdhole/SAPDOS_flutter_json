import 'package:flutter/material.dart';
import 'package:sapdos/widgets/doctor_card.dart';
import 'dart:convert'; // For JSON handling
import '../models/doctor.dart'; // Import the Doctor class

class PatientScreen1 extends StatefulWidget {
  @override
  _PatientScreen1State createState() => _PatientScreen1State();
}

class _PatientScreen1State extends State<PatientScreen1> {
  late Future<Map<String, dynamic>> _futureData;

  @override
  void initState() {
    super.initState();
    _futureData = fetchDoctorsFromJson();
  }

  Future<Map<String, dynamic>> fetchDoctorsFromJson() async {
    String jsonString = await DefaultAssetBundle.of(context)
        .loadString('assets/doctors_list.json');
    Map<String, dynamic> jsonData = json.decode(jsonString);
    List<dynamic> doctorListJson = jsonData['doctorsList'];

    List<Doctor> doctors = doctorListJson
        .map((json) => Doctor(
              name: json['doctorName'] ?? 'Unknown Doctor',
              specialization: json['specialization'] ?? 'Unknown Specialization',
              rating: 0.0, // Set the rating as needed
              doctorImage: json['doctorImage'] ?? '',
              appointmentIcon: json['appointmentIcon'] ?? '',
              price: (json['price'] ?? 0).toDouble(),
            ))
        .toList();

    return {'user': jsonData['user'] ?? {}, 'doctors': doctors};
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SAPDOS'),
        actions: <Widget>[
          FutureBuilder<Map<String, dynamic>>(
            future: _futureData,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircleAvatar(
                  backgroundColor: Colors.grey[200],
                  radius: 20,
                );
              } else if (snapshot.hasError) {
                return Icon(Icons.error);
              } else {
                String avatarUrl = snapshot.data!['user']['avatar'] ?? '';
                return CircleAvatar(
                  backgroundImage: NetworkImage(avatarUrl),
                  radius: 20,
                );
              }
            },
          ),
        ],
      ),
      drawer: SizedBox(
        width: 200,
        child: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Color(0xFF13235A),
                ),
                child: Text(
                  'SAPDOS',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.category),
                title: Text('Categories'),
              ),
              ListTile(
                leading: Icon(Icons.calendar_today),
                title: Text('Appointment'),
              ),
              ListTile(
                leading: Icon(Icons.chat),
                title: Text('Chat'),
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Settings'),
              ),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text('Logout'),
                onTap: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    '/screen1',
                    (Route<dynamic> route) => false,
                  );
                },
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: FutureBuilder<Map<String, dynamic>>(
            future: _futureData,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data!['doctors'].isEmpty) {
                return Center(child: Text('No doctors available'));
              }

              String greeting = snapshot.data!['user']['greeting'] ?? 'Hello';
              String name = snapshot.data!['user']['name'] ?? 'User';
              List<Doctor> doctors = snapshot.data!['doctors'];
              double screenWidth = MediaQuery.of(context).size.width;
              bool isMobile = screenWidth < 600;
              double cardWidth = isMobile
                  ? (screenWidth / 2) - 24 // For mobile, 2 cards per row
                  : (screenWidth / 4) - 24; // For desktop, 4 cards per row

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '$greeting $name',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFF13235A),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Doctor's List",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        PopupMenuButton<String>(
                          icon: Icon(Icons.filter_list, color: Colors.white),
                          onSelected: (value) {
                            // Handle filter selection
                          },
                          itemBuilder: (BuildContext context) {
                            return {'Filter by ratings', 'Filter by name'}
                                .map((String choice) {
                              return PopupMenuItem<String>(
                                value: choice,
                                child: Text(choice),
                              );
                            }).toList();
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Wrap(
                    spacing: 8.0,
                    runSpacing: 8.0,
                    children: doctors.map((doctor) {
                      return SizedBox(
                        width: cardWidth,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: DoctorCard(
                            doctor: doctor,
                            appointmentIcon: doctor.appointmentIcon,
                            price: doctor.price,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
