import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BankWithdrawalScreen extends StatefulWidget {
  @override
  _BankWithdrawalScreenState createState() => _BankWithdrawalScreenState();
}

class _BankWithdrawalScreenState extends State<BankWithdrawalScreen> {
  // Form key to validate the input fields
  final _formKey = GlobalKey<FormState>();

  // Controllers for capturing input values
  final TextEditingController accountNameController = TextEditingController();
  final TextEditingController accountNumberController = TextEditingController();
  final TextEditingController bankNameController = TextEditingController();
  final TextEditingController routingNumberController = TextEditingController();
  final TextEditingController swiftCodeController = TextEditingController();
  final TextEditingController ammountController = TextEditingController();

  // Demo POST API Function
  Future<void> submitBankWithdrawal() async {
    const String apiUrl =
        "https://jsonplaceholder.typicode.com/posts"; // Demo API

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode({
          "accountName": accountNameController.text,
          "accountNumber": accountNumberController.text,
          "bankName": bankNameController.text,
          "routingNumber": routingNumberController.text,
          "swiftCode": swiftCodeController.text,
        }),
      );

      if (response.statusCode == 201) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Withdrawal request submitted successfully.")),
        );
        // Clear all input fields after successful submission
        _formKey.currentState?.reset();
      } else {
        throw Exception("Failed to submit withdrawal request.");
      }
    } catch (error) {
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
                      "Bank Withdrawal",
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
                    // Account Name Input Field
                    TextFormField(
                      controller: accountNameController,
                      decoration: InputDecoration(
                        labelText: 'Enter Account Name',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter account name';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),

                    // Account Number Input Field
                    TextFormField(
                      controller: accountNumberController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Enter Account Number',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter account number';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),

                    // Bank Name Input Field
                    TextFormField(
                      controller: bankNameController,
                      decoration: InputDecoration(
                        labelText: 'Enter Bank Name',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter bank name';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),

                    // Routing Number Input Field
                    TextFormField(
                      controller: routingNumberController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Enter Routing Number',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter routing number';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),

                    // Swift Code Input Field
                    TextFormField(
                      controller: swiftCodeController,
                      decoration: InputDecoration(
                        labelText: 'Enter Swift Code',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter swift code';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height *
                            0.01), // 5% margin top
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
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        backgroundColor: Colors.blueAccent,
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
