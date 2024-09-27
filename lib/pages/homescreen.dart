import 'package:flutter/material.dart';
import 'package:login_page/pages/calendarscreen.dart';
import 'package:login_page/pages/profilescreen.dart';
import 'package:login_page/pages/todayscreen.dart';
import 'package:login_page/widgets/app_backgroung.dart';
import 'package:login_page/pages/login_page.dart'; // Import your login page
import 'package:login_page/pages/dashboard_screen.dart'; // Import your DashboardScreen
import 'package:login_page/pages/upcoming_events_screen.dart'; // Import your UpcomingEventsScreen
import 'package:login_page/pages/settings_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double screenHeight = 0;
  double screenWidth = 0;

  bool isDarkMode = false;

  ThemeData lightTheme = ThemeData(
    primaryColor: Colors.blue, // Example color
  );

  ThemeData darkTheme = ThemeData.dark().copyWith(
    appBarTheme: AppBarTheme(
      backgroundColor: const Color(0xff0a0e21),
    ),
  );

  List<IconData> navigationIcons = [
    Icons.abc,
    Icons.calculate,
    Icons.home,
  ];

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return Theme(
      data: isDarkMode ? darkTheme : lightTheme,
      child: Scaffold(
        key: _scaffoldKey,
        drawer: Drawer(
          child: Container(
            child: Column(
              children: <Widget>[
                DrawerHeader(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/LogRegimage.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Menu',
                      style: TextStyle(
                        color: isDarkMode ? Colors.white : Colors.black,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: <Widget>[
                      ListTile(
                        leading: const Icon(Icons.calendar_today),
                        title: Text(
                          'Calendar',
                          style: TextStyle(
                            color: isDarkMode ? Colors.white : Colors.black,
                          ),
                        ),
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  CalendarScreen(isDarkMode: isDarkMode),
                            ),
                          );
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.today),
                        title: Text(
                          'Today',
                          style: TextStyle(
                            color: isDarkMode ? Colors.white : Colors.black,
                          ),
                        ),
                        onTap: () {
                          Navigator.pop(context);
                          // Uncomment and implement TodayScreen if needed
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => TodayScreen(
                          //       isDarkMode: isDarkMode,
                          //     ),
                          //   ),
                          // );
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.person),
                        title: Text(
                          'Profile',
                          style: TextStyle(
                            color: isDarkMode ? Colors.white : Colors.black,
                          ),
                        ),
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProfileScreen(
                                isDarkMode: isDarkMode,
                              ),
                            ),
                          );
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.dashboard),
                        title: Text(
                          'Dashboard',
                          style: TextStyle(
                            color: isDarkMode ? Colors.white : Colors.black,
                          ),
                        ),
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DashboardScreen(
                                isDarkMode: isDarkMode,
                              ),
                            ),
                          );
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.event),
                        title: Text(
                          'Upcoming Events ',
                          style: TextStyle(
                            color: isDarkMode ? Colors.white : Colors.black,
                          ),
                        ),
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  UpcomingEventsScreen(isDarkMode: isDarkMode),
                            ),
                          );
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.settings),
                        title: Text(
                          'Settings',
                          style: TextStyle(
                            color: isDarkMode ? Colors.white : Colors.black,
                          ),
                        ),
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  SettingsPage(isDarkMode: isDarkMode),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.brightness_6),
                  title: const Text('Switch Theme'),
                  onTap: () {
                    setState(() {
                      isDarkMode = !isDarkMode;
                      print("THEME CHANGED");
                    });
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.logout),
                  title: Text(
                    'Logout',
                    style: TextStyle(
                      color: isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
                  onTap: () {
                    _showLogoutDialog(context);
                  },
                ),
              ],
            ),
          ),
        ),
        body: Stack(
          children: [
            AppBackground(
              isDarkMode: isDarkMode,
              data: TodayScreen(
                isDarkMode: isDarkMode,
              ),
            ),
            Positioned(
              top: 36.0,
              left: 16.0,
              child: IconButton(
                icon: const Icon(Icons.menu, color: Colors.teal),
                onPressed: () {
                  _scaffoldKey.currentState?.openDrawer();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Logged out successfully"),
          actions: <Widget>[
            TextButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          LoginPage()), // Use LoginPage instead of LoginScreen
                );
              },
            ),
          ],
        );
      },
    );
  }
}
