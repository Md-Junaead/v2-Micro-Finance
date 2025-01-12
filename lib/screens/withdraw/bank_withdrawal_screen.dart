import 'package:flutter/material.dart';

class BankWithdrawalScreen extends StatefulWidget {
  @override
  _BankWithdrawalScreenState createState() => _BankWithdrawalScreenState();
}

class _BankWithdrawalScreenState extends State<BankWithdrawalScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            const EdgeInsets.symmetric(vertical: 8.0), // 8% top & bottom space
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Part 1: Check Balance Button
            Container(
              width: MediaQuery.of(context).size.width *
                  0.9, // 5% margin from left & right
              padding: EdgeInsets.symmetric(vertical: 15),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 1),
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              margin: EdgeInsets.symmetric(
                  horizontal:
                      MediaQuery.of(context).size.width * 0.05), // 5% margin
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.credit_card,
                    color: Colors.amber,
                    size: 45,
                  ),
                  SizedBox(width: 10),
                  Text("Bank Withdrawal",
                      style: TextStyle(
                          color: Colors.blueAccent,
                          fontSize: 25,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
