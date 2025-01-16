import 'package:flutter/material.dart';

class TestScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App Referral'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Invite Friends\nto Get 10 BUSD each\n& Earn Commissions',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24.0),
            ),
            SizedBox(height: 20.0),
            // Image of the phone with the spinning wheel
            Image.asset(
              'assets/phone_wheel.png', // Replace with your image path
              width: 200.0,
              height: 200.0,
            ),
            SizedBox(height: 20.0),
            TextField(
              decoration: InputDecoration(
                labelText: 'Referral Link',
                suffixIcon: Icon(Icons.copy),
              ),
              controller: TextEditingController(text: 'thuonghtf'),
              readOnly: true,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Referral Code',
                suffixIcon: Icon(Icons.copy),
              ),
              controller: TextEditingController(text: '26007'),
              readOnly: true,
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Handle invite action here
              },
              child: Text('Invite'),
            ),
            SizedBox(height: 10.0),
            Text(
              'Enter refer code & get 10 BUSD',
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
