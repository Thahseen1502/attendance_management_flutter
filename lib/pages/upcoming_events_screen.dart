import 'package:flutter/material.dart';
import 'package:login_page/widgets/app_backgroung.dart';

class UpcomingEventsScreen extends StatelessWidget {
  final bool isDarkMode;

  const UpcomingEventsScreen({Key? key, required this.isDarkMode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: isDarkMode ? Colors.black : Colors.white,
      body: Stack(
        children: [
          AppBackground(
            isDarkMode: isDarkMode,
            data: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 70),

                Expanded(
                    child: SingleChildScrollView(
                  child: Column(
                    children: [
                      buildEventContainer(
                        context, // Pass the context here
                        screenWidth,
                        'General Meeting',
                        'Monday, 9:00 AM - 11:00 AM',
                        Colors.blueAccent,
                        isDarkMode,
                      ),
                      buildEventContainer(
                        context, // Pass the context here
                        screenWidth,
                        'Project Plan',
                        'Tuesday, 1:00 PM - 3:00 PM',
                        Colors.greenAccent,
                        isDarkMode,
                      ),
                      buildEventContainer(
                        context, // Pass the context here
                        screenWidth,
                        'Project Execution',
                        'Wednesday, 10:00 AM - 12:00 PM',
                        Colors.orangeAccent,
                        isDarkMode,
                      ),
                      buildEventContainer(
                        context, // Pass the context here
                        screenWidth,
                        'Development Meeting',
                        'Friday, 3:00 PM - 5:00 PM',
                        Colors.redAccent,
                        isDarkMode,
                      ),
                    ],
                  ),
                ))
                // Ensure space for the back icon
              ],
            ),
          ),
          Positioned(
            top: 45.0,
            left: 16.0,
            child: Container(
              color: isDarkMode
                  ? Colors.black.withOpacity(0.5)
                  : Colors.white.withOpacity(0.8),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: isDarkMode ? Colors.white : Colors.black,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Upcoming Events ',
                    style: TextStyle(
                      color: isDarkMode ? Colors.white : Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildEventContainer(
    BuildContext context, // Add context here
    double screenWidth,
    String title,
    String timing,
    Color color,
    bool isDarkMode,
  ) {
    // Determine text color based on background color
    Color textColor = isDarkMode ? Colors.black : Colors.black;
    Color timingColor = isDarkMode ? Colors.white70 : Colors.black54;

    return Container(
      width: screenWidth,
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: isDarkMode ? Colors.black54 : Colors.grey[300]!,
            blurRadius: 6,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
          SizedBox(height: 8),
          Text(
            timing,
            style: TextStyle(
              fontSize: 16,
              color: timingColor,
            ),
          ),
          SizedBox(height: 12),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  // Handle RSVP action
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('RSVP sent for $title'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                },
                child: Text('RSVP'),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  // Handle add to calendar action
                },
                child: Text('Add to Calendar'),
              ),
            ],
          ),
          SizedBox(height: 12),
          Text(
            'For more information, contact us at info@example.com',
            style: TextStyle(
              fontSize: 14,
              color: timingColor,
            ),
          ),
        ],
      ),
    );
  }
}
