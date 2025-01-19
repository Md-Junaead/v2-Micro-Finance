import 'package:flutter/material.dart';

class QuickLoanScreen extends StatefulWidget {
  const QuickLoanScreen({super.key});

  @override
  State<QuickLoanScreen> createState() => _QuickLoanScreenState();
}

class _QuickLoanScreenState extends State<QuickLoanScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quick Loan'),
      ),
      body: const Center(
        child: Text(
          'This is Quick Loan Screen',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
