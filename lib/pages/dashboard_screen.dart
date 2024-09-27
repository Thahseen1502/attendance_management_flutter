import 'package:flutter/material.dart';
import 'package:login_page/widgets/app_backgroung.dart';

class DashboardScreen extends StatelessWidget {
  final bool isDarkMode;

  const DashboardScreen({Key? key, required this.isDarkMode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: isDarkMode ? Colors.black : Colors.white,
      body: Stack(
        children: [
          AppBackground(
            isDarkMode: isDarkMode,
            data: SingleChildScrollView(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  SizedBox(height: 60),
                  buildCard(
                    context,
                    screenWidth,
                    isDarkMode,
                    Icons.group,
                    'Total No Users',
                    '123',
                    Colors.blue,
                  ),
                  SizedBox(height: 20),
                  buildCard(
                    context,
                    screenWidth,
                    isDarkMode,
                    Icons.calendar_today,
                    'Today\'s Attendance',
                    '45',
                    Colors.green,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 40.0,
            left: 16.0,
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back,
                      color: isDarkMode ? Colors.white : Colors.black),
                  onPressed: () {
                    Navigator.pop(context); // Navigate to the previous screen
                  },
                ),
                SizedBox(width: 10),
                Text(
                  'Dashboard',
                  style: TextStyle(
                    color: isDarkMode ? Colors.white : Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCard(
    BuildContext context,
    double screenWidth,
    bool isDarkMode,
    IconData icon,
    String title,
    String data,
    Color iconColor,
  ) {
    return Container(
      width: screenWidth * 0.9,
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: isDarkMode ? Colors.grey[800] : Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 6,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(icon, size: 40, color: iconColor),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: isDarkMode ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    data,
                    style: TextStyle(
                      color: isDarkMode ? Colors.white70 : Colors.black54,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 20), // Add space between content and button
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                // Define action for the "More Info" button
              },
              child: Text(
                'More Info',
                style: TextStyle(
                  color: isDarkMode ? Colors.blueAccent : Colors.blue,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
