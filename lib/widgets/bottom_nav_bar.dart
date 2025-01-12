import 'package:flutter/material.dart';
import 'package:v1_micro_finance/screens/edit_profile_screen.dart';
import 'package:v1_micro_finance/screens/home_screen.dart';
import 'package:v1_micro_finance/screens/about_us_screen.dart';
import 'package:v1_micro_finance/screens/statement_screen.dart';

class BottomNavBarScreen extends StatefulWidget {
  @override
  _BottomNavBarScreenState createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  // Variable to hold the index of the selected screen
  int _selectedIndex = 0;

  // Handler for tapping on BottomNavigationBar items
  // This function updates the _selectedIndex based on the tapped item
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Update the selected index
    });
  }

  @override
  Widget build(BuildContext context) {
    // List of screens to be displayed for each tab
    final List<Widget> _screens = [
      HomeScreen(), // Screen for Home tab
      StatementScreen(), // Screen for Statement tab
      AboutUsScreen(), // Screen for About Us tab
      EditProfileScreen(), // Screen for Profile tab
    ];

    return Scaffold(
      body: _screens[
          _selectedIndex], // Show the selected screen based on _selectedIndex
      bottomNavigationBar: BottomNavigationBar(
        currentIndex:
            _selectedIndex, // Set the current index of the BottomNavigationBar
        onTap:
            _onItemTapped, // Call the handler function when an item is tapped
        type: BottomNavigationBarType
            .fixed, // For 4 or more items, fixed layout is recommended
        iconSize: 30, // Set the default icon size for all items
        selectedItemColor:
            Colors.black, // Set the selected label color to black
        unselectedItemColor:
            Colors.blueAccent, // Set the unselected label color to blueAccent
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: _selectedIndex == 0
                  ? Colors.black
                  : Colors.blueAccent, // Set selected icon color to black
              size: _selectedIndex == 0
                  ? 35.0
                  : 30.0, // Make selected icon larger
            ),
            label: 'Home', // Label for the Home tab
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.sticky_note_2,
              color: _selectedIndex == 1
                  ? Colors.black
                  : Colors.blueAccent, // Set selected icon color to black
              size: _selectedIndex == 1
                  ? 35.0
                  : 30.0, // Make selected icon larger
            ),
            label: 'Statement', // Label for the Statement tab
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.info,
              color: _selectedIndex == 2
                  ? Colors.black
                  : Colors.blueAccent, // Set selected icon color to black
              size: _selectedIndex == 2
                  ? 35.0
                  : 30.0, // Make selected icon larger
            ),
            label: 'About Us', // Label for the About Us tab
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: _selectedIndex == 3
                  ? Colors.black
                  : Colors.blueAccent, // Set selected icon color to black
              size: _selectedIndex == 3
                  ? 35.0
                  : 30.0, // Make selected icon larger
            ),
            label: 'Profile', // Label for the Profile tab
          ),
        ],
      ),
    );
  }
}
