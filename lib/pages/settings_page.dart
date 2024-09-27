import 'package:flutter/material.dart';
import 'package:login_page/widgets/app_backgroung.dart'; // Ensure this path is correct
import 'package:login_page/widgets/button.dart'; // Ensure this path is correct

class SettingsPage extends StatelessWidget {
  final bool isDarkMode;

  const SettingsPage({Key? key, required this.isDarkMode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Define light and dark theme colors
    final Color backgroundColor = isDarkMode ? Colors.black : Colors.white;
    final Color textColor = isDarkMode ? Colors.white : Colors.black;
    final Color hintColor = isDarkMode ? Colors.grey[400]! : Colors.grey[600]!;
    final Color inputTextColor = isDarkMode ? Colors.white : Colors.black;
    final Color dropdownBackgroundColor =
        isDarkMode ? Colors.black : Colors.white;
    final Color dropdownTextColor = isDarkMode ? Colors.white : Colors.black;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: AppBackground(
        isDarkMode: isDarkMode,
        data: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back, color: textColor),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              const SizedBox(height: 20.0),
              Text(
                'Settings',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
              const SizedBox(height: 20.0),
              TextField(
                style: TextStyle(color: inputTextColor),
                decoration: InputDecoration(
                  labelText: 'Start Time',
                  hintText: '10:00 AM',
                  hintStyle: TextStyle(color: hintColor),
                  labelStyle: TextStyle(color: textColor),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10.0),
              Text(
                'Fill the start time of your working hours',
                style: TextStyle(fontSize: 14, color: hintColor),
              ),
              const SizedBox(height: 20.0),
              TextField(
                style: TextStyle(color: inputTextColor),
                decoration: InputDecoration(
                  labelText: 'End Time',
                  hintText: '06:00 PM',
                  hintStyle: TextStyle(color: hintColor),
                  labelStyle: TextStyle(color: textColor),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10.0),
              Text(
                'Fill the end time of your working hours',
                style: TextStyle(fontSize: 14, color: hintColor),
              ),
              const SizedBox(height: 20.0),
              TextField(
                style: TextStyle(color: inputTextColor),
                decoration: InputDecoration(
                  labelText: 'URL',
                  hintText: 'https://example.com',
                  hintStyle: TextStyle(color: hintColor),
                  labelStyle: TextStyle(color: textColor),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10.0),
              Text(
                'Enter a URL for your application',
                style: TextStyle(fontSize: 14, color: hintColor),
              ),
              const SizedBox(height: 20.0),
              DropdownButtonFormField<String>(
                isExpanded: true,
                decoration: InputDecoration(
                  labelText: 'Timezone',
                  labelStyle: TextStyle(color: textColor),
                  border: OutlineInputBorder(),
                ),
                style: TextStyle(color: dropdownTextColor),
                dropdownColor: dropdownBackgroundColor,
                items: <Map<String, String>>[
                  {'value': 'GMT', 'label': 'GMT - Greenwich Mean Time'},
                  {
                    'value': 'EST',
                    'label': 'EST - Eastern Standard Time (USA)'
                  },
                  {
                    'value': 'CST',
                    'label': 'CST - Central Standard Time (USA)'
                  },
                  {
                    'value': 'MST',
                    'label': 'MST - Mountain Standard Time (USA)'
                  },
                  {
                    'value': 'PST',
                    'label': 'PST - Pacific Standard Time (USA)'
                  },
                  {'value': 'CET', 'label': 'CET - Central European Time'},
                  {
                    'value': 'IST',
                    'label': 'IST - Indian Standard Time (India)'
                  },
                  {
                    'value': 'JST',
                    'label': 'JST - Japan Standard Time (Japan)'
                  },
                  {
                    'value': 'AEST',
                    'label':
                        'AEST - Australian Eastern Standard Time (Australia)'
                  }
                ].map((Map<String, String> timezone) {
                  return DropdownMenuItem<String>(
                    value: timezone['value'],
                    child: Text(
                      timezone['label']!,
                      style: TextStyle(color: dropdownTextColor),
                    ),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  // Handle timezone change
                },
              ),
              const SizedBox(height: 10.0),
              Text(
                'Select your timezone',
                style: TextStyle(fontSize: 14, color: hintColor),
              ),
              const SizedBox(height: 20.0),
              Center(
                child: SizedBox(
                  width: 150,
                  child: MyButton(
                    name: 'Save',
                    ontap: () {
                      // Handle save action
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Updated successfully'),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    },
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
