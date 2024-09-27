import 'package:flutter/material.dart';
import 'package:login_page/widgets/app_backgroung.dart'; // Ensure correct import path for your background widget
import 'package:login_page/widgets/button.dart'; // Import your custom button widget
import 'package:login_page/pages/login_page.dart'; // Import the login page

class ResetSubmitPage extends StatelessWidget {
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 50),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'images/LogRegimage.png', // Replace with your image asset path
                          height: 200,
                        ),
                        SizedBox(height: 16),
                        Text(
                          'Password reset email sent',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 16),
                        SizedBox(
                          width: 150, // Adjust the width as needed
                          child: MyButton(
                            name: 'Done',
                            ontap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginPage(),
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(height: 16),
                        TextButton(
                          onPressed: () {
                            // Implement functionality for 'Resend email' button
                          },
                          child: Text(
                            'Resend email',
                            style: TextStyle(
                              color:
                                  Color(0xFF00BFA5), // Change color as needed
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 45,
            left: 16,
            child: IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                Navigator.pop(context); // Close the page
              },
            ),
          ),
        ],
      ),
    );
  }
}
