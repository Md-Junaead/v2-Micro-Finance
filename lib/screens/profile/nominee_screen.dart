import 'package:flutter/material.dart';
import 'package:v1_micro_finance/configs/routes/routes_name.dart';
import 'package:v1_micro_finance/screens/profile/nominee_screen.dart';

class NomineeScreen extends StatelessWidget {
  const NomineeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Dummy data from API
    final nomineeData = {
      'name': 'John Doe',
      'email': 'johndoe@example.com',
      'phone': '+1234567890',
      'dob': '01-01-1990',
      'relation': 'Brother'
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text('Nominee Details'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 20.0), // 5% margin on both sides
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              _buildDetailRow('Nominee Name:', nomineeData['name']!),
              _buildDetailRow('Email:', nomineeData['email']!),
              _buildDetailRow('Phone Number:', nomineeData['phone']!),
              _buildDetailRow('Date of Birth (DoB):', nomineeData['dob']!),
              _buildDetailRow('Relation with User:', nomineeData['relation']!),
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
                    Navigator.pushNamed(context, RoutesName.editProfileScreen);
                  },
                  child: const Text('Edit'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Flexible(
            child: Text(
              value,
              style: const TextStyle(fontSize: 16),
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }
}
