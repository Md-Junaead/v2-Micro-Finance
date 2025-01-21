import 'package:flutter/material.dart';
import 'package:v1_micro_finance/screens/auth/signin_screen.dart';
import 'package:v1_micro_finance/screens/dashboard/deposit_screen.dart';
import 'package:v1_micro_finance/screens/dashboard/check_balance_screen.dart';
import 'package:v1_micro_finance/screens/dashboard/packages_screen.dart';
import 'package:v1_micro_finance/screens/dashboard/quick_loan_screen.dart';
import 'package:v1_micro_finance/screens/dashboard/referrals_screen.dart';
import 'package:v1_micro_finance/screens/dashboard/withdraw_screen.dart';
import 'package:v1_micro_finance/test/test.dart';

// Main entry point of the application
void main() {
  runApp(const MicroFinance());
}

// Root widget of the application
class MicroFinance extends StatelessWidget {
  const MicroFinance({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Disable debug banner in the app
    );
  }
}

// Home screen of the app
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // List of buttons with their icons, text, and respective screens
    final List<Map<String, dynamic>> buttons = [
      {
        "icon": Icons.attach_money, // Icon for "Add Money"
        "text": "Deposite", // Text label
        "screen": TestScreen(), // Target screen for navigation
      },
      {
        "icon": Icons.account_balance, // Icon for "Check Balance"
        "text": "Check Balance",
        "screen": CheckBalanceScreen(),
      },
      {
        "icon": Icons.money_off, // Icon for "Withdraw"
        "text": "Withdraw",
        "screen": WithdrawScreen(),
      },
      {
        "icon": Icons.people, // Icon for "Referrals"
        "text": "Referrals",
        "screen": ReferralsScreen(),
      },
      {
        "icon": Icons.speed, // Icon for "Quick Loan"
        "text": "Quick Loan",
        "screen": SignInScreen(),
      },
      {
        "icon": Icons.card_giftcard, // Icon for "Packages"
        "text": "Packages",
        "screen": PackagesScreen(),
      },
    ];

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(120), // Adjust AppBar height
        child: Container(
          margin: const EdgeInsets.only(top: 60), // Move AppBar 80px down
          child: AppBar(
            automaticallyImplyLeading: false,
            // AppBar with custom title layout
            title: Padding(
              padding: const EdgeInsets.only(
                left: 1, // Left padding for the title
                right: 1, // Right padding for the title
                top: 1, // Top padding for the title
                bottom: 1, // Bottom padding for the title
              ),
              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment.center, // Center-align title
                children: [
                  const Icon(
                    Icons.account_balance, // Dashboard icon
                    size: 80, // Icon size
                    color: Colors.blueAccent, // Icon color
                  ),
                  const SizedBox(width: 10), // Spacing between icon and text
                  const Text(
                    "Dashboard", // Dashboard title
                    style: TextStyle(
                      fontSize: 30, // Font size
                      color: Colors.blueAccent, // Text color
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            centerTitle: true, // Center the AppBar title
          ),
        ),
      ),
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.8, // Center horizontally
          child: GridView.builder(
            shrinkWrap: true, // Ensure GridView takes minimal height
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Two columns in the grid
              mainAxisSpacing: 20, // Vertical spacing between grid items
              crossAxisSpacing: 20, // Horizontal spacing between grid items
              childAspectRatio: 1, // Square grid items
            ),
            itemCount: buttons.length, // Number of grid items
            itemBuilder: (context, index) {
              final button = buttons[index]; // Get button data for the index
              return GestureDetector(
                onTap: () {
                  // Navigate to the respective screen on button tap
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => button["screen"], // Target screen
                    ),
                  );
                },
                child: Container(
                  // Button appearance
                  decoration: BoxDecoration(
                    color: Colors.blueAccent, // Background color
                    borderRadius: BorderRadius.circular(10), // Rounded corners
                  ),
                  child: Column(
                    // Align icon and text in the button
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        button["icon"], // Button icon
                        size: 50, // Icon size
                        color: Colors.white, // Icon color
                      ),
                      const SizedBox(height: 10), // Spacing below the icon
                      Text(
                        button["text"], // Button text
                        style: const TextStyle(
                          color: Colors.white, // Text color
                          fontSize: 16, // Text size
                        ),
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
