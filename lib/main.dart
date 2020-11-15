import 'package:eudeka_comp/Booking/success_booking.dart';
import 'package:eudeka_comp/Profile/profile.dart';
import 'package:eudeka_comp/booking/booking_confirm.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';

import 'Home/home.dart';
import 'booking/booking.dart';
import 'Layanan/layanan.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;
  final tabs = [
    HomePage(),
    Layanan(),
    Booking(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: tabs[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            currentIndex: _currentIndex,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.medical_services_outlined),
                  label: 'Layanan'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.calendar_today_outlined), label: 'Booking'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline), label: 'Profile'),
            ]),
      ),
    );
  }
}

class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(children: [
          HomePage(),
        ]),
      ),
    );
  }
}
