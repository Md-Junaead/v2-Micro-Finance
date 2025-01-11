import 'package:flutter/material.dart';
import 'package:v1_micro_finance/screens/dashboard/check_balance_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> buttons = [
      {"icon": Icons.attach_money, "text": "Add Money", "route": "add_money"},
      {
        "icon": Icons.account_balance,
        "text": "Check Balance",
        "screen": const CheckBalanceScreen(),
        // "route": "check_balance"
      },
      {"icon": Icons.money_off, "text": "Withdraw", "route": "withdraw"},
      {"icon": Icons.people, "text": "Referrals", "route": "referrals"},
      {"icon": Icons.speed, "text": "Quick Loan", "route": "quick_loan"},
      {"icon": Icons.card_giftcard, "text": "Packages", "route": "packages"},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("DashBoard"),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20), // 5% margin
          child: GridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Two buttons per row
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              childAspectRatio: 1, // Square buttons
            ),
            itemCount: buttons.length,
            itemBuilder: (context, index) {
              final button = buttons[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CheckBalanceScreen()),
                    // builder: (context) => RouteScreen(button["screen"])),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius:
                        BorderRadius.circular(10), // 10px border radius
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(button["icon"], size: 50, color: Colors.white),
                      const SizedBox(height: 10),
                      Text(
                        button["text"],
                        style:
                            const TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class RouteScreen extends StatelessWidget {
  final String routeName;
  const RouteScreen(this.routeName, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(routeName.replaceAll("_", " ").toUpperCase())),
      body: Center(
        child: Text(
          "This is the $routeName screen",
          style: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
