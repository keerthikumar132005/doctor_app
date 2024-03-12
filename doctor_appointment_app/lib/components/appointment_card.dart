import 'package:flutter/material.dart';

class AppointmentCard extends StatefulWidget {
  final String patientName;
  final String problem;
  final String date;
  final String time;
  final Color color;
  final VoidCallback? onCancel;
  final bool isCancelled;

  const AppointmentCard({
    Key? key,
    required this.patientName,
    required this.problem,
    required this.date,
    required this.time,
    required this.color,
    required this.isCancelled,
    this.onCancel,
  }) : super(key: key);

  @override
  State<AppointmentCard> createState() => _AppointmentCardState();
}

class _AppointmentCardState extends State<AppointmentCard> {
  bool isCompleted = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: widget.isCancelled ? Colors.grey : widget.color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Material(
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              Row(
                children: [
                  const CircleAvatar(
                    backgroundImage: AssetImage('assets/patient.png'),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Patient ${widget.patientName}${isCompleted ? ' - ' : ''}',
                        style: const TextStyle(color: Colors.white),
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Text(
                        '${widget.problem}',
                        style: const TextStyle(color: Colors.black),
                      )
                    ],
                  ),
                  if (isCompleted)
                    Text(
                      'Appointment completed',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16, // Adjust font size as desired
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 10),
              _buildScheduleCard(widget.date, widget.time),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      onPressed: widget.isCancelled ? null : widget.onCancel,
                      child: const Text(
                        'Cancel',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                      ),
                      onPressed: isCompleted
                          ? null
                          : () {
                              setState(() {
                                isCompleted = true;
                              });
                            },
                      child: const Text(
                        'Completed',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildScheduleCard(String date, String time) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(10),
      ),
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const Icon(
            Icons.calendar_today,
            color: Colors.white,
            size: 15,
          ),
          const SizedBox(width: 5),
          Text(
            '$date',
            style: const TextStyle(color: Colors.white),
          ),
          const SizedBox(width: 20),
          const Icon(
            Icons.access_alarm,
            color: Colors.white,
            size: 17,
          ),
          const SizedBox(width: 5),
          Text(
            '$time',
            style: const TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }
}
