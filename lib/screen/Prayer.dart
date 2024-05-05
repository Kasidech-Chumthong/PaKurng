import 'package:flutter/material.dart';
import 'package:pakrung/firebase/bottomnavigation.dart';
import 'package:pakrung/firebase/checklogin.dart';
import 'package:pakrung/firebase/prayerlist.dart';

import '../firebase/hambergerbar.dart';

class Prayer extends StatefulWidget {
  const Prayer({super.key});

  @override
  _PrayerState createState() => _PrayerState();
}

class _PrayerState extends State<Prayer> {

  @override
  void initState() {
    super.initState();
    checkLoginStatus(context);
  }

  

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        endDrawer: const Navbar(),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: AppBar(
            backgroundColor: const Color.fromARGB(255, 231, 173, 0),
            title: const Text(
              'PraKrung | บทสวด',
              style: TextStyle(
                fontSize: 20,
                color: Color.fromARGB(255, 255, 255, 255),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        body: Column(
          children: [
            SizedBox(height: 30), // Fixed the syntax here
            Expanded(
              child: ShowprayerList(), // Here is the ShowprayerList widget
            ),
          ],
        ), // Here is the PlayList widget
      ),
    );
  }
}
