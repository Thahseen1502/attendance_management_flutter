import 'package:flutter/material.dart';
import 'package:login_page/widgets/app_backgroung.dart'; // Make sure to import AppBackground

class StudentDetailsPage extends StatelessWidget {
  const StudentDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AppBackground(
            isDarkMode: false,
            data: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Container(
                  margin: const EdgeInsets.only(
                      top: 50), // Adjust the top margin as needed
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Student Details',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.teal,
                                ),
                              ),
                              Row(
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.edit, color: Colors.teal),
                                    onPressed: () {
                                      // Add your edit functionality here
                                    },
                                  ),
                                  IconButton(
                                    icon:
                                        Icon(Icons.delete, color: Colors.teal),
                                    onPressed: () {
                                      // Add your delete functionality here
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          buildDetailRow('Batch name', ''),
                          buildDetailRow('Name', ''),
                          buildDetailRow('Domain', ''),
                          buildDetailRow('Mobile', ''),
                          buildDetailRow('Email id', ''),
                          buildDetailRow('Gender', ''),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 16.0,
            left: 16.0,
            child: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.teal),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$label : ',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
