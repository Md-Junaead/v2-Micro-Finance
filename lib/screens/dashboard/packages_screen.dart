import 'package:flutter/material.dart';

class PackagesScreen extends StatelessWidget {
  const PackagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Packages"),
      ),
      body: const Center(
        child: Text(
          "This is the Packages Screen",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
