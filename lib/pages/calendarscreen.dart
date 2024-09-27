import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:login_page/widgets/app_backgroung.dart';
import 'package:month_year_picker/month_year_picker.dart';

class CalendarScreen extends StatefulWidget {
  final bool isDarkMode;

  const CalendarScreen({super.key, required this.isDarkMode});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  double screenHeight = 0;
  double screenWidth = 0;

  Color primary = const Color(0xffee444c);

  String _month = DateFormat('MMMM').format(DateTime.now());

  final List<Map<String, String>> _data = [
    {'name': 'John Doe', 'email': 'john.doe@example.com', 'month': ''},
    {'name': 'Jane Smith', 'email': 'jane.smith@example.com', 'month': ''},
  ];

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: widget.isDarkMode ? Colors.black : Colors.white,
      body: Stack(
        children: [
          AppBackground(
            isDarkMode: widget.isDarkMode,
            data: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.only(top: 20),
                    padding: const EdgeInsets.only(top: 20),
                    child: Text(
                      "History",
                      style: TextStyle(
                        color: widget.isDarkMode ? Colors.white : Colors.black,
                        fontFamily: "NexaRegular",
                        fontSize: screenWidth / 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Stack(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(left: 50, top: 15),
                        margin: const EdgeInsets.only(top: 20),
                        child: Text(
                          _month,
                          style: TextStyle(
                            color: widget.isDarkMode ? Colors.red : Colors.red,
                            fontFamily: "NexaRegular",
                            fontSize: screenWidth / 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        margin: const EdgeInsets.only(top: 20),
                        child: GestureDetector(
                          onTap: () async {
                            final localeObj = Locale("en", "IN");
                            final month = await showMonthYearPicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2019),
                              lastDate: DateTime(2030),
                              locale: localeObj,
                            );
                            if (month != null) {
                              setState(() {
                                _month = DateFormat('MMMM').format(month);
                                // Update the month in the data
                                for (var item in _data) {
                                  item['month'] = _month;
                                }
                              });
                            }
                          },
                          child: Container(
                            margin: EdgeInsets.only(bottom: 10, top: 10),
                            padding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            decoration: BoxDecoration(
                              color: primary,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 6,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Text(
                              "Pick a Month",
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: "NexaRegular",
                                fontSize: screenWidth / 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Table(
                    border: TableBorder.all(
                      color: widget.isDarkMode ? Colors.white : Colors.black,
                    ),
                    columnWidths: {
                      0: FlexColumnWidth(2),
                      1: FlexColumnWidth(3),
                      2: FlexColumnWidth(2),
                      3: FlexColumnWidth(2),
                    },
                    children: [
                      TableRow(
                        decoration: BoxDecoration(
                          color: widget.isDarkMode
                              ? Colors.grey[800]
                              : Colors.grey[200],
                        ),
                        children: [
                          tableCell('Name', true),
                          tableCell('Email', true),
                          tableCell('Month', true),
                          tableCell('Download', true),
                        ],
                      ),
                      ..._data.map((item) {
                        return TableRow(
                          children: [
                            tableCell(item['name'] ?? ''),
                            tableCell(item['email'] ?? ''),
                            tableCell(item['month'] ?? ''),
                            tableCellWithIcons(),
                          ],
                        );
                      }).toList(),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 40.0,
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

  Widget tableCell(String text, [bool isHeader = false]) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      color: isHeader
          ? (widget.isDarkMode ? Colors.grey[800] : Colors.grey[200])
          : (widget.isDarkMode ? Colors.black : Colors.white),
      child: Text(
        text,
        style: TextStyle(
          fontSize: isHeader ? 13 : 11,
          color: isHeader
              ? (widget.isDarkMode ? Colors.white : Colors.black)
              : (widget.isDarkMode ? Colors.white : Colors.black),
          fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }

  Widget tableCellWithIcons() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            child: Icon(Icons.file_download, color: Colors.teal),
            onTap: () {
              // Handle CSV download
            },
          ),
          GestureDetector(
            child: Icon(Icons.picture_as_pdf, color: Colors.teal),
            onTap: () {
              // Handle PDF download
            },
          ),
        ],
      ),
    );
  }
}
