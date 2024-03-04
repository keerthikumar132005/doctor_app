import 'package:flutter/material.dart';

void main() {
  runApp(DoctorRegistrationForm());
}

class DoctorRegistrationForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Doctor Registration'),
          backgroundColor: Colors.blue, // Setting app bar color
        ),
        body: DoctorRegistrationFormWidget(),
      ),
    );
  }
}

class DoctorRegistrationFormWidget extends StatefulWidget {
  @override
  _DoctorRegistrationFormWidgetState createState() =>
      _DoctorRegistrationFormWidgetState();
}

class _DoctorRegistrationFormWidgetState
    extends State<DoctorRegistrationFormWidget> {
  final _formKey = GlobalKey<FormState>();

  String _name = '';
  String _email = '';
  String _specialty = 'Cardiologist'; // Initial value set to the first item
  int? _experience;
  String _password = '';

  List<String> _specialtyOptions = [
    'Cardiologist',
    'Dermatologist',
    'Endocrinologist',
    'Gastroenterologist',
    'Neurologist',
    'Oncologist',
    'Pediatrician',
    'Psychiatrist',
    'Radiologist',
    'Urologist',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Name',
                fillColor: Colors.white,
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 2.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 2.0),
                ),
              ),
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return 'Please enter your name';
                }
                return null;
              },
              onSaved: (value) {
                _name = value ?? '';
              },
            ),
            SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Email',
                fillColor: Colors.white,
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 2.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 2.0),
                ),
              ),
              validator: (value) {
                if (value?.isEmpty ?? true || !value!.contains('@')) {
                  return 'Please enter a valid email address';
                }
                return null;
              },
              onSaved: (value) {
                _email = value ?? '';
              },
            ),
            SizedBox(height: 10),
            newMethod(),
            SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Experience (Years)',
                fillColor: Colors.white,
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 2.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 2.0),
                ),
              ),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return 'Please enter your experience';
                }
                return null;
              },
              onSaved: (value) {
                _experience = int.tryParse(value!);
              },
            ),
            SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Password',
                fillColor: Colors.white,
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 2.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 2.0),
                ),
              ),
              obscureText: true,
              validator: (value) {
                if (value?.isEmpty ?? true || value!.length < 6) {
                  return 'Password must be at least 6 characters long';
                }
                return null;
              },
              onSaved: (value) {
                _password = value ?? '';
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  // Process the data, e.g., register the doctor
                  print('Name: $_name');
                  print('Email: $_email');
                  print('Specialty: $_specialty');
                  print('Experience: $_experience');
                  print('Password: $_password');
                  // You can add your logic here to submit the data to your backend or perform any other actions.
                }
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.blue, // Text color
              ),
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }

  DropdownButtonFormField<String> newMethod() {
    return DropdownButtonFormField(
      decoration: InputDecoration(
        labelText: 'Specialty',
        fillColor: Colors.white,
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue, width: 2.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue, width: 2.0),
        ),
      ),
      value: _specialty,
      items: _specialtyOptions.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (newValue) {
        setState(() {
          _specialty = newValue.toString();
        });
      },
      validator: (value) {
        if (value == null) {
          return 'Please select a specialty';
        }
        return null;
      },
    );
  }
}
