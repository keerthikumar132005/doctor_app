import 'package:doctor_appointment_app/components/appointment_card.dart';
import 'package:flutter/material.dart';
import '../utils/config.dart';
import 'doctor_profile_page.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class Appointment {
  final String patientName;
  final String problem;
  final String date;
  final String time;
  final Color color;
  bool isCancelled; // Add isCancelled property

  Appointment({
    required this.patientName,
    required this.problem,
    required this.date,
    required this.time,
    required this.color,
    this.isCancelled = false, // Set default value for isCancelled
  });

  factory Appointment.fromJson(Map<String, dynamic> json) {
    return Appointment(
      patientName: json['patientName'],
      problem: json['problem'],
      date: json['date'],
      time: json['time'],
      color: _getColorFromHex(json['color']),
      isCancelled: false, // Set default value for isCancelled
    );
  }

  static Color _getColorFromHex(String hexColor) {
    hexColor = hexColor.replaceAll('#', '');
    return Color(int.parse('FF$hexColor', radix: 16));
  }
}

class _HomePageState extends State<HomePage> {
  late List<Appointment> appointments;
  late String userName;
  late String profileImage;

  @override
  void initState() {
    super.initState();
    appointments = [];
    userName = '';
    profileImage = '';
    loadHomePageData();
    loadAppointments();
  }

  Future<void> loadHomePageData() async {
    try {
      String data = await rootBundle.loadString('assets/homepage_data.json');
      Map<String, dynamic> jsonData = json.decode(data);
      userName = jsonData['userData']['name'];
      profileImage = jsonData['userData']['profileImage'];
    } catch (e) {
      print('Error loading homepage data: $e');
    }
  }

  Future<void> loadAppointments() async {
    try {
      String data = await rootBundle.loadString('assets/homepage_data.json');
      Map<String, dynamic> jsonData = json.decode(data);
      List<dynamic> jsonList = jsonData['appointments'];

      List<Appointment> loadedAppointments =
          jsonList.map((e) => Appointment.fromJson(e)).toList();

      setState(() {
        appointments = loadedAppointments;
      });
    } catch (e) {
      print('Error loading appointments: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 15,
          ),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      userName,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const DoctorProfilePage()),
                        );
                      },
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage(profileImage),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Text(
                  'Appointment Today',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Config.spaceSmall,
                for (Appointment appointment in appointments)
                  if (appointment.date == 'Monday, 10th April')
                    Column(
                      children: [
                        AppointmentCard(
                          patientName: appointment.patientName,
                          problem: appointment.problem,
                          date: appointment.date,
                          time: appointment.time,
                          color: appointment.color,
                          isCancelled: appointment
                              .isCancelled, // Provide isCancelled value
                          onCancel: () {
                            // Handle cancel logic
                            setState(() {
                              appointment.isCancelled =
                                  true; // Update isCancelled to true when cancel button is clicked
                            });
                          },
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                const SizedBox(height: 20),
                const Text(
                  'Appointments Upcoming',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                for (Appointment appointment in appointments)
                  if (appointment.date != 'Monday, 10th April')
                    Column(
                      children: [
                        AppointmentCard(
                          patientName: appointment.patientName,
                          problem: appointment.problem,
                          date: appointment.date,
                          time: appointment.time,
                          color: appointment.color,
                          isCancelled: appointment
                              .isCancelled, // Provide isCancelled value
                          onCancel: () {
                            // Handle cancel logic
                            setState(() {
                              appointment.isCancelled =
                                  true; // Update isCancelled to true when cancel button is clicked
                            });
                          },
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
