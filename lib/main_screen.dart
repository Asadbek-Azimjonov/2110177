import 'package:flutter/material.dart';
import 'db_helper.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final dbHelper = DBHelper();
  Map<String, dynamic>? userData;

  @override
  void initState() {
    super.initState();
    _getUserData();
  }

  _getUserData() async {
    Map<String, dynamic>? user = await dbHelper.getUser();
    setState(() {
      userData = user;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: userData != null
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Username: ${userData!['username']}'),
                  Text('Phone: ${userData!['phone']}'),
                  Text('Address: ${userData!['address']}'),
                  Text('Email: ${userData!['email']}'),
                ],
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }
}
