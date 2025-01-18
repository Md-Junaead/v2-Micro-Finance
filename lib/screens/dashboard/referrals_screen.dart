import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ReferralsScreen extends StatelessWidget {
  const ReferralsScreen({super.key});

  // Sample referral link and code
  final String referralLink = "https://example.com/referral";
  final String referralCode = "REF12345";

  void copyToClipboard(BuildContext context, String text) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Copied to Clipboard: $text")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Referral Program",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              // Background Image with Text Overlay
              Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.6,
                    margin: const EdgeInsets.symmetric(horizontal: 30.0),
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage("assets/images/ImageOne.jpeg"),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  Positioned(
                    top: 50,
                    left: 40,
                    right: 40,
                    child: Container(
                      padding: const EdgeInsets.all(16.0),
                      color: Colors.black.withOpacity(0.6),
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: const TextSpan(
                          text: "Invite Friends to Get ",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                          children: [
                            TextSpan(
                              text: "10%",
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold),
                            ),
                            TextSpan(text: " of your Referral's first deposit"),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Referral Details Section
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    buildReferralRow("Referral Link", referralLink, context),
                    buildReferralRow("Referral Code", referralCode, context),
                    const SizedBox(height: 10),

                    // Invite Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text(
                          "Invite",
                          style: TextStyle(color: Colors.red, fontSize: 18),
                        ),
                      ),
                    ),

                    // Dotted Border
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      decoration: const BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: Colors.red,
                                width: 1.0,
                                style: BorderStyle.solid)),
                      ),
                    ),

                    // Enter Referral Code
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/enter_code_screen');
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.qr_code, color: Colors.red),
                          SizedBox(width: 5),
                          Text(
                            "Enter Referral Code & Get 10%",
                            style: TextStyle(color: Colors.red, fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Method to create referral row
  Widget buildReferralRow(String label, String value, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
          Row(
            children: [
              Text(
                value,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
              const SizedBox(width: 10),
              GestureDetector(
                onTap: () => copyToClipboard(context, value),
                child: const Icon(Icons.copy, color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
