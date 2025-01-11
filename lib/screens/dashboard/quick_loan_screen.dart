import 'package:flutter/material.dart';

class QuickLoanScreen extends StatelessWidget {
  const QuickLoanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quick Loan"),
      ),
      body: const Center(
        child: Text(
          "This is the Quick Loan Screen",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
