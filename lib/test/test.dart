import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http; // Importing HTTP package for API call
import 'dart:convert';

import 'package:url_launcher/url_launcher.dart'; // For JSON encoding

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  final String referralCode = "AKGE452V"; // This will be fetched from an API
  final TextEditingController _referralCodeController = TextEditingController();

  // Function to copy the referral code to clipboard
  void _copyReferralCode() {
    Clipboard.setData(ClipboardData(text: referralCode));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Referral code copied!")),
    );
  }

  // Function to launch URLs
  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  // Function to submit the referral code via API
  Future<void> _submitReferralCode() async {
    String submittedCode = _referralCodeController.text;
    if (submittedCode.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter a referral code")),
      );
      return;
    }

    // Demo API URL (Replace with your own API URL)
    const String apiUrl = "https://jsonplaceholder.typicode.com/posts";

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        body: jsonEncode({"referral_code": submittedCode}),
        headers: {"Content-Type": "application/json"},
      );

      if (response.statusCode == 201) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text("Referral code submitted successfully!")),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Failed to submit referral code")),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(
            kToolbarHeight + MediaQuery.of(context).size.height * 0.03),
        child: AppBar(
          centerTitle: true,
          title: Padding(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height *
                    0.03), // Moves text 5% down
            child: const Text("Refer & Earn"),
          ),
          backgroundColor: Colors.blueAccent,
          titleTextStyle: TextStyle(
              color: Colors.white, fontSize: 35, fontWeight: FontWeight.bold),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(25)),
          ),
        ),
      ),
      body: SingleChildScrollView(
        // Scrollable body for the entire screen
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Spacing for visual balance
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              const Text(
                "Copy your code & Share with your Friends to get 10% of Referral's First Deposit",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),

              // Section for displaying referral code
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Your Referral Code",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              referralCode,
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: _copyReferralCode, // Copy button
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue, // Button color
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(10), // Border radius
                              ),
                              minimumSize:
                                  Size(100, 50), // Minimum size for consistency
                            ),
                            child: const Text(
                              "Copy", // Text on the button
                              style: TextStyle(
                                color: Colors.white, // Copy button text color
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10),

              // Section for sharing options
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "OR\nShare With",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),

                    // Social media icons and copy button
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // Facebook Icon
                        IconButton(
                          icon: Icon(Icons.facebook, color: Colors.blue),
                          onPressed: () {
                            _launchURL(
                                "https://www.facebook.com/sharer/sharer.php?u=http://www.yourlink.com");
                          },
                        ),
                        // WhatsApp Icon
                        IconButton(
                          icon: Icon(Icons.message, color: Colors.green),
                          onPressed: () {
                            _launchURL(
                                "https://wa.me/?text=Check%20this%20out:%20http://www.yourlink.com");
                          },
                        ),
                        // Twitter Icon
                        IconButton(
                          icon: Icon(Icons.pets, color: Colors.blueAccent),
                          onPressed: () {
                            _launchURL(
                                "https://twitter.com/intent/tweet?url=http://www.yourlink.com");
                          },
                        ),
                        // Copy Icon
                        IconButton(
                          icon: Icon(Icons.copy, color: Colors.black),
                          onPressed: _copyReferralCode,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),

              // Section for submitting referral code
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Submit Referral Code",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          // Input field on the left side of the button
                          Expanded(
                            child: TextField(
                              controller: _referralCodeController,
                              decoration: InputDecoration(
                                hintText: "Enter referral code",
                                // Removed input border
                                border: InputBorder.none, // No border
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),

                          // Submit button on the right side of the input field
                          ElevatedButton(
                            onPressed: _submitReferralCode, // Submit button
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue, // Button color
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(10), // Border radius
                              ),
                              minimumSize: Size(100, 50),
                            ),
                            child: const Text(
                              "Submit", // Text on the button
                              style: TextStyle(
                                color: Colors.white, // Submit text color
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),

              // Section for sharing options
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "OR\nShare With",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),

                    // Social media icons and copy button
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // Facebook Icon
                        IconButton(
                          icon: Icon(Icons.facebook, color: Colors.blue),
                          onPressed: () {
                            _launchURL(
                                "https://www.facebook.com/sharer/sharer.php?u=http://www.yourlink.com");
                          },
                        ),
                        // WhatsApp Icon
                        IconButton(
                          icon: Icon(Icons.message, color: Colors.green),
                          onPressed: () {
                            _launchURL(
                                "https://wa.me/?text=Check%20this%20out:%20http://www.yourlink.com");
                          },
                        ),
                        // Twitter Icon
                        IconButton(
                          icon: Icon(Icons.pets, color: Colors.blueAccent),
                          onPressed: () {
                            _launchURL(
                                "https://twitter.com/intent/tweet?url=http://www.yourlink.com");
                          },
                        ),
                        // Copy Icon
                        IconButton(
                          icon: Icon(Icons.copy, color: Colors.black),
                          onPressed: _copyReferralCode,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
