import 'package:flutter/material.dart';

class CryptoWithdrawalScreen extends StatefulWidget {
  @override
  _CryptoWithdrawalScreenState createState() => _CryptoWithdrawalScreenState();
}

class _CryptoWithdrawalScreenState extends State<CryptoWithdrawalScreen> {
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
                    Icons.currency_bitcoin,
                    color: Colors.amberAccent,
                    size: 45,
                  ),
                  SizedBox(width: 10),
                  Text("Crypto Withdrawal",
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
