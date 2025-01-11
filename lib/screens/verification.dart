import 'package:flutter/material.dart';
import 'package:v1_micro_finance/screens/signup_screen.dart';


void main() {
  runApp(MaterialApp(
    home: SignupScreen(),
  ));
}


// Verification Screen
class VerificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Verification'),
      ),
      body: Center(
        child: Text('This is the verification screen'),
      ),
    );
  }
}
