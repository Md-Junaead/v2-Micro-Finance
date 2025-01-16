import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CryptoWithdrawalScreen extends StatefulWidget {
  @override
  _CryptoWithdrawalScreenState createState() => _CryptoWithdrawalScreenState();
}

class _CryptoWithdrawalScreenState extends State<CryptoWithdrawalScreen> {
  // Form key to validate the input fields
  final _formKey = GlobalKey<FormState>();

  // Controllers for capturing input values
  final TextEditingController walletIdController = TextEditingController();
  final TextEditingController ammountController = TextEditingController();

  // Variable to store the selected wallet type
  String selectedWallet = "BTC";

  // Demo POST API Function
  Future<void> submitBankWithdrawal() async {
    const String apiUrl =
        "https://jsonplaceholder.typicode.com/posts"; // Demo API URL

    try {
      // Making a POST request with wallet data
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode({
          "walletType": selectedWallet, // Selected wallet type
          "walletId": walletIdController.text, // Wallet ID entered by user
        }),
      );

      if (response.statusCode == 201) {
        // Show success message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Withdrawal request submitted successfully.")),
        );
        // Clear all input fields after successful submission
        _formKey.currentState?.reset();
        setState(() {
          selectedWallet = "BTC"; // Reset wallet selection to default
        });
      } else {
        throw Exception("Failed to submit withdrawal request.");
      }
    } catch (error) {
      // Show error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("An error occurred: $error")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Part One: Withdrawal Balance Button
            Center(
              child: Container(
                margin: EdgeInsets.only(
                    top:
                        MediaQuery.of(context).size.height * 0.08), // 8% margin
                width: MediaQuery.of(context).size.width * 0.84, // 84% width
                padding: const EdgeInsets.symmetric(vertical: 15),
                decoration: BoxDecoration(
                  border:
                      Border.all(color: Colors.black, width: 1), // Black border
                  borderRadius: BorderRadius.circular(10), // Rounded corners
                  color: Colors.white, // White background
                ),
                child: Row(
                  mainAxisAlignment:
                      MainAxisAlignment.center, // Center contents
                  children: const [
                    Icon(Icons.credit_card, color: Colors.amber), // Icon
                    SizedBox(width: 10), // Space between icon and text
                    Text(
                      "Crypto Withdrawal",
                      style: TextStyle(
                        color: Colors.blueAccent, // Blue accent color for text
                        fontSize: 25, // Font size
                        fontWeight: FontWeight.bold, // Bold text
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Part Two: Bank Withdrawal Form
            SizedBox(
                height: MediaQuery.of(context).size.height * 0.1), // 10% margin
            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  children: [
                    // Radio Buttons for Selecting Wallet Type
                    Row(
                      children: [
                        // Left Side: "Select Wallet" Text
                        Expanded(
                          flex: 2, // 20% of the row space
                          child: Text(
                            "Select Wallet",
                            style: TextStyle(
                              fontSize: 16, // Font size for the text
                              fontWeight: FontWeight.bold, // Bold text
                            ),
                          ),
                        ),

                        // Right Side: BTC and USDT Radio Buttons
                        Expanded(
                          flex: 8, // 80% of the row space
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment
                                .spaceEvenly, // Even spacing for radio buttons
                            children: [
                              // BTC Radio Button
                              Flexible(
                                child: Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal:
                                          5), // Margin of 5 from left and right
                                  child: RadioListTile<String>(
                                    value: "BTC",
                                    groupValue: selectedWallet,
                                    onChanged: (value) {
                                      setState(() {
                                        selectedWallet = value!;
                                      });
                                    },
                                    title: Text(
                                        "BTC"), // Text next to radio button
                                    contentPadding: EdgeInsets
                                        .zero, // No space between radio button and text
                                  ),
                                ),
                              ),

                              // USDT Radio Button
                              Flexible(
                                child: Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal:
                                          5), // Margin of 5 from left and right
                                  child: RadioListTile<String>(
                                    value: "USDT",
                                    groupValue: selectedWallet,
                                    onChanged: (value) {
                                      setState(() {
                                        selectedWallet = value!;
                                      });
                                    },
                                    title: Text(
                                        "USDT"), // Text next to radio button
                                    contentPadding: EdgeInsets
                                        .zero, // No space between radio button and text
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16), // Space between widgets

                    // Wallet ID Input Field
                    TextFormField(
                      controller: walletIdController,
                      decoration: InputDecoration(
                        labelText: 'Enter Wallet ID',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Wallet ID';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    TextFormField(
                      controller: ammountController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Enter Withdrawal Ammount',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter Withdrawal Ammount';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height *
                            0.05), // 5% margin top

                    // Submit Button
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          submitBankWithdrawal();
                        }
                      },
                      child: Text('Submit'),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 15),
                        textStyle: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        backgroundColor: Colors.grey,
                        // Button color
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
