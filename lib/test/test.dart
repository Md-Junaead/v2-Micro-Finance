import 'package:flutter/material.dart'; // Import TestScreen
import 'package:v1_micro_finance/configs/routes/routes_name.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bank App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

class TestScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test Screen'),
        backgroundColor: Color(0xFF06426D),
      ),
      body: Center(
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, RoutesName.homeScreen);
          },
          child: Text(
            'Click Me',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: Color(0xFF06426D),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
