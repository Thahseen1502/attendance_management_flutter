import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:slide_to_act/slide_to_act.dart';

class TodayScreen extends StatefulWidget {
  final bool isDarkMode;

  const TodayScreen({Key? key, required this.isDarkMode}) : super(key: key);

  @override
  State<TodayScreen> createState() => _TodayScreenState();
}

class _TodayScreenState extends State<TodayScreen> {
  double screenHeight = 0;
  double screenWidth = 0;
  String checkIn = "--/--";
  String checkOut = "--/--";
  Color primary = const Color(0xffeef444c);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      height: screenHeight,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(top: 20),
              padding: const EdgeInsets.only(top: 20),
              child: Text(
                "Welcome",
                style: TextStyle(
                  color: widget.isDarkMode
                      ? Colors.white
                      : Colors.black, // Set text color based on theme
                  fontFamily: "NexaRegular",
                  fontSize: screenWidth / 15,
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "Student ", // Replace with actual employee ID
                style: TextStyle(
                  color: widget.isDarkMode
                      ? Colors.red
                      : Colors.red, // Set text color based on theme

                  fontFamily: "NexaBold",
                  fontSize: screenWidth / 18,
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(top: 32),
              child: Text(
                "Today's Status",
                style: TextStyle(
                  color: widget.isDarkMode
                      ? Colors.white
                      : Colors.black, // Set text color based on theme

                  fontFamily: "NexaBold",
                  fontSize: screenWidth / 18,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 12, bottom: 32),
              height: 150,
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black54,
                    blurRadius: 10,
                    offset: Offset(2, 2),
                  ),
                ],
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Check In",
                          style: TextStyle(
                            fontSize: screenWidth / 20,
                            color: Colors.black54,
                          ),
                        ),
                        Text(
                          checkIn,
                          style: TextStyle(
                            fontSize: screenWidth / 18,
                            color: Colors.black54,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Check Out",
                          style: TextStyle(
                            fontSize: screenWidth / 20,
                            color: Colors.black54,
                          ),
                        ),
                        Text(
                          checkOut,
                          style: TextStyle(
                            fontSize: screenWidth / 18,
                            color: Colors.black54,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: RichText(
                text: TextSpan(
                  text: DateTime.now().day.toString(),
                  style: TextStyle(
                    color: primary,
                    fontSize: screenWidth / 18,
                  ),
                  children: [
                    TextSpan(
                      text: DateFormat(' MMMM yyyy').format(DateTime.now()),
                      style: TextStyle(
                        color: widget.isDarkMode
                            ? Colors.white
                            : Colors.black, // Set text color based on theme
                        fontSize: screenWidth / 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            StreamBuilder(
              stream: Stream.periodic(const Duration(seconds: 1)),
              builder: (context, snapshot) {
                return Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    DateFormat('hh:mm:ss a').format(DateTime.now()),
                    style: TextStyle(
                      fontSize: screenWidth / 22,
                      color: widget.isDarkMode
                          ? Colors.white
                          : Colors.black, // Set text color based on theme
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                );
              },
            ),
            checkOut == "--/--"
                ? Container(
                    margin: const EdgeInsets.only(top: 24),
                    child: SlideAction(
                      text: checkIn == "--/--"
                          ? "Slide to Check In"
                          : "Slide to Check Out",
                      textStyle: TextStyle(
                        color: Colors.black,
                        fontSize: screenWidth / 20,
                      ),
                      outerColor: Colors.white,
                      innerColor: primary,
                      onSubmit: () {
                        setState(() {
                          if (checkIn == "--/--") {
                            checkIn =
                                DateFormat('hh:mm a').format(DateTime.now());
                          } else {
                            checkOut =
                                DateFormat('hh:mm a').format(DateTime.now());
                          }
                        });
                      },
                    ),
                  )
                : Container(
                    margin: const EdgeInsets.only(top: 32),
                    child: Text(
                      "You have Completed this day",
                      style: TextStyle(
                        fontSize: screenWidth / 20,
                        color: widget.isDarkMode
                            ? Colors.white
                            : Colors.black, // Set text color based on theme
                      ),
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
