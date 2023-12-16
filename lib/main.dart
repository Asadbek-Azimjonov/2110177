import 'package:flutter/material.dart';
import 'registration_screen.dart';
import 'main_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Database Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RegistrationScreen(),
    );
  }
}
