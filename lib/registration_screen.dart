import 'package:flutter/material.dart';
import 'db_helper.dart';
import 'main_screen.dart';

class RegistrationScreen extends StatelessWidget {
  final dbHelper = DBHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            print('Button Pressed');
            await dbHelper.insertUser({
              'username': 'John Doe',
              'phone': '123-456-7890',
              'address': '123 Main St',
              'email': 'john.doe@example.com',
            });

            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MainScreen()),
            );
          },
          child: Text('Register User'),
        ),
      ),
    );
  }
}
