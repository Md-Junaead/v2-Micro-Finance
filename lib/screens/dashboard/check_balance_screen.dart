import 'package:flutter/material.dart';

class CheckBalanceScreen extends StatelessWidget {
  const CheckBalanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Check Balance"),
      ),
      body: const Center(
        child: Text(
          "Can You Hear Me Dart?",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
