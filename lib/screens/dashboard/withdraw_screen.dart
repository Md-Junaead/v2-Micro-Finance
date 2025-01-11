import 'package:flutter/material.dart';

class WithdrawScreen extends StatelessWidget {
  const WithdrawScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Withdraw"),
      ),
      body: const Center(
        child: Text(
          "This is the Withdraw Screen",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
