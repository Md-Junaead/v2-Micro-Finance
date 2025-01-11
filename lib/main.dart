import 'package:flutter/material.dart';
import 'package:v1_micro_finance/screens/about_us_screen.dart';
import 'package:v1_micro_finance/screens/edit_profile_screen.dart';
import 'package:v1_micro_finance/screens/home_screen.dart';
import 'package:v1_micro_finance/screens/signin_screen.dart';
import 'package:v1_micro_finance/screens/statement_screen.dart';

void main() {
  runApp(MicroFinance());
}

class MicroFinance extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Finance App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(),
    );
  }
}

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  // Handler for tapping on BottomNavigationBar items
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // List of screens
    final List<Widget> _screens = [
      HomeScreen(),
      StatementScreen(),
      AboutUsScreen(),
      EditProfileScreen(),
    ];

    return Scaffold(
      body: _screens[_selectedIndex], // Show selected screen
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed, // For 4+ items
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long),
            label: 'Statement',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'About Us',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.edit),
            label: 'Edit Profile',
          ),
        ],
      ),
    );
  }
}
