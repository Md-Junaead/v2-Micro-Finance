import 'package:flutter/material.dart';

class CryptoWithdrawalScreen extends StatefulWidget {
  @override
  _CryptoWithdrawalScreenState createState() => _CryptoWithdrawalScreenState();
}

class _CryptoWithdrawalScreenState extends State<CryptoWithdrawalScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Part One: Withdrawal Balance at the top
          Center(
            child: Container(
              // 8% margin from left and right
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height *
                      0.08), // 8% top margin
              width: MediaQuery.of(context).size.width *
                  0.84, // 8% margin from left and right
              padding: const EdgeInsets.symmetric(vertical: 15),
              decoration: BoxDecoration(
                border:
                    Border.all(color: Colors.black, width: 1), // Black border
                borderRadius: BorderRadius.circular(10), // Rounded corners
                color: Colors.white, // White background
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center, // Center contents
                children: const [
                  Icon(Icons.credit_card,
                      color: Colors.amber), // Icon with amber color
                  SizedBox(width: 10), // Space between icon and text
                  Text(
                    "Crypto Withdrawal",
                    style: TextStyle(
                      color: Colors.blueAccent, // Blue accent color for text
                      fontSize: 25, // Font size for the text
                      fontWeight: FontWeight.bold, // Bold text
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
