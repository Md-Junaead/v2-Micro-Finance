import 'package:flutter/material.dart';
import 'package:v1_micro_finance/screens/dashboard/withdraw_screen.dart';
import 'package:v1_micro_finance/screens/home_screen.dart';

void main() {
  runApp(MicroFinance());
}

class MicroFinance extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Finance App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(), // Use BottomNavBar as the home screen
    );
  }
}
