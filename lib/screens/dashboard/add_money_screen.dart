import 'package:flutter/material.dart';

class AddMoneyScreen extends StatelessWidget {
  const AddMoneyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Money")),
      body: const Center(
        child: Text("Can You hear me Dart?", style: TextStyle(fontSize: 18)),
      ),
    );
  }
}
