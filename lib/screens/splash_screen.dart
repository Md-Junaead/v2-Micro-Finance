import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:v1_micro_finance/screens/auth/signin_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }

  // Function to navigate to the home screen after a delay
  void _navigateToNextScreen() async {
    await Future.delayed(Duration(seconds: 3)); // Splash screen duration
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) => SignInScreen()), // Navigate to HomeScreen
    );
  }

  @override
  Widget build(BuildContext context) {
    // Setting the preferred orientation to portrait only
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return Scaffold(
      backgroundColor: Colors.blue, // Splash screen background color
      appBar: AppBar(
        title: Text("Splash Screen"), // App Bar with a title
        backgroundColor: Colors.blue, // App bar color
      ),
      body: Center(
        child: Text(
          "Welcome to MyApp", // Text for the splash screen
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
