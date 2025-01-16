import 'package:flutter/material.dart';
import 'package:v1_micro_finance/configs/routes/routes_name.dart';
import 'package:v1_micro_finance/screens/bottom/home_screen.dart';
import 'package:v1_micro_finance/screens/profile/my_account_screen.dart';
import 'package:v1_micro_finance/screens/profile/nominee_screen.dart';

class ProfileScreen extends StatelessWidget {
  // List of buttons with titles, icons, and corresponding screens
  final List<Map<String, dynamic>> buttons = [
    {
      "title": "My Account",
      "icon": Icons.person,
      "screen": UserScreen(),
    },
    {
      "title": "Nominee",
      "icon": Icons.group,
      "screen": NomineeScreen(),
    },
    {
      "title": "Address",
      "icon": Icons.location_on,
      "screen": HomeScreen(),
    },
    {
      "title": "Settings",
      "icon": Icons.settings,
      "screen": 'setting_screen.dart'
    },
    {
      "title": "Help Center",
      "icon": Icons.help,
      "screen": 'help_center_screen.dart'
    },
    {"title": "Contact", "icon": Icons.phone, "screen": 'contact_screen.dart'},
    {"title": "Logout", "icon": Icons.logout, "screen": 'logout_screen.dart'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        // Ensures the content does not overlap system UI elements like the status bar or notch
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Part 1: Title Section
                Center(
                  child: Text(
                    'Profile', // Main title of the screen
                    style: TextStyle(
                      fontSize: 30, // Font size for title
                      fontWeight: FontWeight.bold, // Bold style for emphasis
                      color: Colors.black, // Text color
                    ),
                  ),
                ),
                SizedBox(height: 10), // Space below the title

                // Part 2: User Info Section
                Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15), // Rounded corners
                    color: Colors.grey[200], // Light gray background
                  ),
                  child: Row(
                    children: [
                      // Left Section: Profile Picture
                      CircleAvatar(
                        radius: 25, // Circle size
                        backgroundColor: Colors.grey, // Gray background color
                        child: Icon(
                          Icons.person, // User icon
                          size: 40, // Icon size
                          color: Colors.white, // Icon color
                        ),
                      ),
                      SizedBox(
                          width:
                              10), // Space between profile picture and user info

                      // Middle Section: User Info (Name & ID)
                      Expanded(
                        flex: 2, // Flexible space for user details
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment
                              .start, // Aligns content to the start
                          children: [
                            Text(
                              'User Name', // Replace this with dynamic data from API
                              style: TextStyle(
                                fontSize: 18, // Font size for user name
                                fontWeight: FontWeight.bold, // Bold text
                              ),
                            ),
                            SizedBox(
                                height: 01), // Space between user name and ID
                            Text(
                              'User ID: 123456', // Replace this with dynamic data from API
                              style: TextStyle(
                                fontSize: 16, // Font size for user ID
                                color:
                                    Colors.grey[600], // Light gray text color
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Right Section: Edit Profile Button
                      Expanded(
                        child: Center(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, RoutesName.editProfileScreen);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Colors.blueAccent, // Button background color
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    10), // Button corner radius
                              ),
                            ),
                            child: Text(
                              'Edit', // Button label
                              style: TextStyle(
                                color: Colors.white, // Text color set to white
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30), // Space below user info section

                // Part 3: Buttons Section
                ...buttons.map((button) {
                  return GestureDetector(
                    // Trigger navigation when button is tapped
                    onTap: () {
                      // Navigate to the respective screen on button tap
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              button["screen"], // Target screen
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.only(
                          bottom: 8), // Space between buttons
                      padding: const EdgeInsets.symmetric(
                          vertical: 10), // Vertical padding for button
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(30), // Rounded button corners
                        color:
                            Colors.blueAccent, // Light gray button background
                      ),
                      child: Row(
                        children: [
                          // Left Section: Icon
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Icon(
                              button[
                                  'icon'], // Icon dynamically fetched from list
                              size: 30, // Icon size
                              color: Colors.white, // Icon color
                            ),
                          ),

                          // Middle Section: Button Title
                          Expanded(
                            child: Text(
                              button[
                                  'title'], // Title dynamically fetched from list
                              style: TextStyle(
                                fontSize: 18, // Font size for button title
                                fontWeight: FontWeight.bold, // Bold text
                                color: Colors.white, // Text color
                              ),
                            ),
                          ),

                          // Right Section: Arrow Icon
                          Padding(
                            padding: const EdgeInsets.only(
                                right: 15), // Padding on the right side
                            child: Icon(
                              Icons
                                  .arrow_forward_ios, // Arrow icon indicating navigation
                              size: 20,
                              color: Colors.white, // Icon size
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(), // Converts list of buttons to widgets
              ],
            ),
          ),
        ),
      ),
    );
  }
}
