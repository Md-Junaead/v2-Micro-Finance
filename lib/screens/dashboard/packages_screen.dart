import 'package:flutter/material.dart';
import 'package:v1_micro_finance/configs/routes/routes_name.dart';
import 'package:v1_micro_finance/screens/dashboard/deposit_screen.dart';

class PackagesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Package Details',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 24, // Updated font size
            fontWeight: FontWeight.bold, // Updated font weight
            color: Colors.white, // Updated color
          ),
        ),
        centerTitle: true, // Center the AppBar title
        backgroundColor: Colors.blue, // Updated AppBar background color
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Package 1
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DepositScreen()),
                );
              },
              child: Container(
                padding: EdgeInsets.all(16.0),
                margin: EdgeInsets.only(bottom: 16.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.blue.shade50,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      spreadRadius: 1,
                      blurRadius: 4,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Package 1',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue.shade800,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 8),
                    Text(
                      '• Daily Revenue: 0.02% of Current Balance',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      '• Minimum Deposit: \$1 to \$100',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      '• Revenue Withdrawal: Monthly',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            // Package 2
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DepositScreen()),
                );
              },
              child: Container(
                padding: EdgeInsets.all(16.0),
                margin: EdgeInsets.only(bottom: 16.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.green.shade50,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      spreadRadius: 1,
                      blurRadius: 4,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Package 2',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.green.shade800,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 8),
                    Text(
                      '• Daily Revenue: 0.03% of Current Balance',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      '• Minimum Deposit: \$101 to \$1,000',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      '• Revenue Withdrawal: Every 15 days',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            // Package 3
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DepositScreen()),
                );
              },
              child: Container(
                padding: EdgeInsets.all(16.0),
                margin: EdgeInsets.only(bottom: 16.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.orange.shade50,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      spreadRadius: 1,
                      blurRadius: 4,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Package 3',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange.shade800,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 8),
                    Text(
                      '• Daily Revenue: 0.045% of Current Balance',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      '• Minimum Deposit: \$1,001 to \$5,000',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      '• Revenue Withdrawal: Weekly',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            // Package 4
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DepositScreen()),
                );
              },
              child: Container(
                padding: EdgeInsets.all(16.0),
                margin: EdgeInsets.only(bottom: 16.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.red.shade50,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      spreadRadius: 1,
                      blurRadius: 4,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Package 4',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.red.shade800,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 8),
                    Text(
                      '• Daily Revenue: 0.055% of Current Balance',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      '• Minimum Deposit: \$5,001 to Unlimited',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      '• Revenue Withdrawal: Daily',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),

            // Package 5
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, RoutesName.profileScreen);
              },
              child: Container(
                padding: EdgeInsets.all(16.0),
                margin: EdgeInsets.only(bottom: 16.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.red.shade50,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      spreadRadius: 1,
                      blurRadius: 4,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'User Profile',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.red.shade800,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 8),
                    Text(
                      '• Daily Revenue: 0.055% of Current Balance',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      '• Minimum Deposit: \$5,001 to Unlimited',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      '• Revenue Withdrawal: Daily',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
