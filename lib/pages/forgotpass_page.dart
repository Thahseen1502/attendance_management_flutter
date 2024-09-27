import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Import for text input formatting
import 'package:login_page/pages/resetsubmit_page.dart';
import 'package:login_page/widgets/app_backgroung.dart'; // Ensure correct import path for your background widget
import 'package:login_page/widgets/button.dart'; // Import your custom button widget

class ForgotPasswordPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          AppBackground(
            isDarkMode: false,
            // Assuming AppBackground is a widget that provides the app background
            data: Container(
              child: Center(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 50),
                        Image.asset(
                          'images/LogRegimage.png', // Replace with your image asset path
                          height: 200,
                        ),
                        SizedBox(height: 32),
                        Text(
                          'Forgot Password?',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Enter your email address below to receive a password reset link.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black54,
                          ),
                        ),
                        SizedBox(height: 16),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24),
                          child: TextFormField(
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              hintText: 'Enter your email',
                              filled: true,
                              fillColor: Colors.white.withOpacity(0.8),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0),
                                borderSide: BorderSide(
                                  color: Colors.black.withOpacity(0.5),
                                  width: 0.5, // Adjust the width as needed
                                ),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your email';
                              } else if (!isValidEmail(value)) {
                                return 'Please enter a valid email';
                              }
                              return null;
                            },
                            // Email validation logic
                            inputFormatters: [
                              FilteringTextInputFormatter.deny(RegExp(r'\s')),
                            ],
                          ),
                        ),
                        SizedBox(height: 16),
                        SizedBox(
                          width: 200, // Adjust the width as needed
                          child: MyButton(
                            name: 'Reset Password',
                            ontap: () {
                              if (_formKey.currentState != null &&
                                  _formKey.currentState!.validate()) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ResetSubmitPage(),
                                  ),
                                );
                              }
                            },
                          ),
                        ),
                        SizedBox(height: 50),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 45,
            left: 16,
            child: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }

  bool isValidEmail(String value) {
    // Enhanced email validation
    String emailRegex = r'^[a-z0-9]+@[a-z]+\.[a-z]{2,3}$';
    return RegExp(emailRegex).hasMatch(value);
  }
}
