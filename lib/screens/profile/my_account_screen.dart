import 'package:flutter/material.dart';
import 'package:v1_micro_finance/configs/routes/routes_name.dart';
import 'package:v1_micro_finance/screens/profile/nominee_screen.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Dummy data from API
    final nomineeData = {
      'name': 'SFL Commerce',
      'email': 'sfl@example.com',
      'phone': '+1234567890',
      'dob': '01-01-1990',
      'Address': '5/2, Uttora 04'
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text('User Details'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 20.0), // 5% margin on both sides
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                _buildDetailRow(
                    Icons.person, 'Full Name:', nomineeData['name']!),
                _buildDetailRow(Icons.email, 'Email:', nomineeData['email']!),
                _buildDetailRow(
                    Icons.phone, 'Phone Number:', nomineeData['phone']!),
                _buildDetailRow(
                    Icons.cake, 'Date of Birth:', nomineeData['dob']!),
                _buildDetailRow(
                    Icons.group, 'Address:', nomineeData['Address']!),
                const SizedBox(height: 40), // Spacing before the button
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(
                          context, RoutesName.editProfileScreen);
                    },
                    child: const Text('Edit'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow(IconData icon, String label, String value) {
    return Padding(
      padding:
          const EdgeInsets.only(bottom: 10.0), // 2% gap below every user info
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: Colors.blue), // Icon before label
              const SizedBox(width: 10), // Space between icon and label
              Expanded(
                child: Text(
                  label,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                value,
                style: const TextStyle(fontSize: 16),
                textAlign: TextAlign.end,
              ),
            ],
          ),
          const Divider(
              color: Colors.blue,
              thickness: 1), // 1px blue underline below every information
        ],
      ),
    );
  }
}
