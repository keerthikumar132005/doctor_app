import 'package:flutter/material.dart';
import 'dart:convert';

class DoctorProfilePage extends StatefulWidget {
  const DoctorProfilePage({Key? key}) : super(key: key);

  @override
  _DoctorProfilePageState createState() => _DoctorProfilePageState();
}

class _DoctorProfilePageState extends State<DoctorProfilePage> {
  Map<String, dynamic> profileData = {};

  @override
  void initState() {
    super.initState();
    loadProfileData();
  }

  Future<void> loadProfileData() async {
    try {
      String data = await DefaultAssetBundle.of(context)
          .loadString('assets/homepage_data.json');
      Map<String, dynamic> jsonData = json.decode(data);
      setState(() {
        profileData = jsonData['userData'];
      });
    } catch (e) {
      print('Error loading profile data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Doctor Profile'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 80,
                backgroundImage: AssetImage(
                    profileData['profileImage'] ?? 'assets/profile1.jpg'),
              ),
              SizedBox(height: 20),
              Text(
                profileData['name'] ?? '',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              _buildProfileInfo(
                  icon: Icons.work,
                  text: 'Experience: ${profileData['experience'] ?? ''}'),
              _buildProfileInfo(
                  icon: Icons.location_on,
                  text: 'Location: ${profileData['location'] ?? ''}'),
              _buildProfileInfo(
                  icon: Icons.school,
                  text:
                      'Qualifications: ${profileData['qualifications'] ?? ''}'),
              _buildProfileInfo(
                  icon: Icons.attach_money,
                  text: 'Fees: ${profileData['fees'] ?? ''}'),
              _buildProfileInfo(
                  icon: Icons.medical_services,
                  text:
                      'Specialization: ${profileData['specialization'] ?? ''}'),
              _buildProfileInfo(
                  icon: Icons.email,
                  text: 'Email: ${profileData['email'] ?? ''}'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileInfo({required IconData icon, required String text}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icon, size: 24),
          SizedBox(width: 10),
          Text(
            text,
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: DoctorProfilePage(),
  ));
}
