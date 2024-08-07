import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Identity Form Application',
      home: MyHomePage(),
      
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();
  final _ageController = TextEditingController();

  String _gender = 'Male';
  bool _enrolled = false;

  void _submitForm() {
    String name = _nameController.text;
    String email = _emailController.text;
    String phone = _phoneController.text;
    String address = _addressController.text;
    String age = _ageController.text;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DisplayDataScreen(
          name: name,
          email: email,
          phone: phone,
          address: address,
          age: age,
          gender: _gender,
          enrolled: _enrolled,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Identity Form Application'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
            ),
            TextField(
              controller: _phoneController,
              decoration: InputDecoration(labelText: 'Phone'),
              keyboardType: TextInputType.phone,
            ),
            TextField(
              controller: _addressController,
              decoration: InputDecoration(labelText: 'Address'),
            ),
            TextField(
              controller: _ageController,
              decoration: InputDecoration(labelText: 'Age'),
              keyboardType: TextInputType.number,
            ),
            DropdownButton<String>(
              value: _gender,
              onChanged: (String? newValue) {
                setState(() {
                  _gender = newValue!;
                });
              },
              items: <String>['Male', 'Female', 'Other']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SwitchListTile(
              title: Text('Are you already enrolled'),
              value: _enrolled,
              onChanged: (bool newValue) {
                setState(() {
                  _enrolled = newValue;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitForm,
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}

class DisplayDataScreen extends StatelessWidget {
  final String name;
  final String email;
  final String phone;
  final String address;
  final String age;
  final String gender;
  final bool enrolled;

  DisplayDataScreen({
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
    required this.age,
    required this.gender,
    required this.enrolled,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Information'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Name: $name', style: TextStyle(fontSize: 18)),
            Text('Email: $email', style: TextStyle(fontSize: 18)),
            Text('Phone: $phone', style: TextStyle(fontSize: 18)),
            Text('Address: $address', style: TextStyle(fontSize: 18)),
            Text('Age: $age', style: TextStyle(fontSize: 18)),
            Text('Gender: $gender', style: TextStyle(fontSize: 18)),
            Text('Enrollment status: ${enrolled ? 'Yes' : 'No'}', style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
