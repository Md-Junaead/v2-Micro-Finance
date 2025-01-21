import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:v1_micro_finance/configs/routes/routes_name.dart';
import 'package:v1_micro_finance/screens/auth/verification.dart';

class SignupScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  // Controllers to capture user input
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController nidController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController dobController =
      TextEditingController(); // For Date of Birth
  final TextEditingController addressController =
      TextEditingController(); // For Address

  File? uploadedImage; // To hold the uploaded image

  // Function to pick an image
  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 1000,
      maxHeight: 1000,
      imageQuality: 85,
    );
    if (pickedFile != null &&
        (await File(pickedFile.path).length() <= 10 * 1024 * 1024)) {
      uploadedImage = File(pickedFile.path);
    } else {
      uploadedImage = null;
    }
  }

  // API Call
  Future<void> registerUser(BuildContext context) async {
    const String apiUrl = "http://3000.com/api/signup";

    try {
      final request = http.MultipartRequest('POST', Uri.parse(apiUrl));
      request.fields['name'] = fullNameController.text;
      request.fields['gender'] = genderController.text;
      request.fields['cellNo'] = phoneController.text;
      request.fields['nid'] = nidController.text;
      request.fields['email'] = emailController.text;
      request.fields['password'] = passwordController.text;
      request.fields['confirmPassword'] = confirmPasswordController.text;
      request.fields['dob'] = dobController.text;
      request.fields['address'] = addressController.text;

      if (uploadedImage != null) {
        request.files.add(await http.MultipartFile.fromPath(
          'profileImage',
          uploadedImage!.path,
          contentType: MediaType('image', 'jpeg'),
        ));
      }

      final response = await request.send();

      if (response.statusCode == 200) {
        final responseData = await response.stream.bytesToString();
        final data = jsonDecode(responseData);

        if (data['status'] == 'success') {
          // Navigate to verification screen
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => VerificationScreen()),
          );
        } else {
          // Show error message
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(data['message'])),
          );
        }
      } else {
        throw Exception("Failed to register user.");
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
      appBar: AppBar(
        title: Text('Signup'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // User Name Field
              TextFormField(
                controller: fullNameController,
                decoration: InputDecoration(
                  labelText: 'Full Name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your Full name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),

              // Password Field
              TextFormField(
                controller: passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty || value.length < 8) {
                    return 'Password must be at least 8 characters';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),

              // Email Field
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty || !value.contains('@')) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),

              // Phone Number Field
              TextFormField(
                controller: phoneController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your phone number';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),

              // Date of Birth Field
              TextFormField(
                controller: dobController,
                decoration: InputDecoration(
                  labelText: 'Date of Birth (MM/DD/YYYY)',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your Date of Birth';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),

              // Address Field
              TextFormField(
                controller: addressController,
                decoration: InputDecoration(
                  labelText: 'Address',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your address';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),

              // File Upload Section
              ElevatedButton(
                onPressed: () async {
                  await pickImage();
                  if (uploadedImage != null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Image selected successfully")),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text("Image not selected or exceeds 10MB")),
                    );
                  }
                },
                child: Text("Upload Image (PNG/JPG, max 10MB)"),
              ),
              SizedBox(height: 16),

              // Signup Button
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    registerUser(context);
                    //Previous Part
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => VerificationScreen()),
                    // );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: const BorderSide(
                      color: Colors.black,
                      width: 1.0,
                    ),
                  ),
                ),
                child: Text(
                  'Signup',
                  style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFF06426D),
                      fontWeight: FontWeight.bold),
                ),
              ),

              // Sign-in Link
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, RoutesName.signInScreen);
                },
                child: Text(
                  'Already? Sign in',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF06426D),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
