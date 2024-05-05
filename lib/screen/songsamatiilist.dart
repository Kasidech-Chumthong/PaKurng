import 'package:flutter/material.dart';
import 'package:pakrung/firebase/bottomnavigation.dart';
import 'package:pakrung/firebase/checklogin.dart';
import 'package:pakrung/firebase/samalist.dart';

import '../firebase/hambergerbar.dart';

class Songsamatii extends StatefulWidget {
  const Songsamatii({super.key});

  @override
  _SongsamatiiState createState() => _SongsamatiiState();
}

class _SongsamatiiState extends State<Songsamatii> {
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
          preferredSize: const Size.fromHeight(
              50), // Increase the height to accommodate the bottom border
          child: AppBar(
            backgroundColor: const Color.fromARGB(255, 231, 173, 0),
            title: const Text(
              'PraKrung | เพลง',
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
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 29, 19, 9),
                    Color.fromARGB(255, 255, 255, 255),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              height: 210, // Height of the container
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0), // Add padding to the left
                    child: Container(
                      height: 160,
                      width: 160,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 178, 77, 77),
                        border: Border.all(
                          width: 5,
                          color: Colors.white, // Specify the border color
                        ),
                      ),
                      child: Image.asset(
                        'assets/images/song0.jpg', // Path to your image asset
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(
                      width: 10), // Add some spacing between the image and text
                  Expanded(
                    child: Container(
                      color:
                          Colors.transparent, // Make the container transparent
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 22.0),
                            child: Text(
                              'เพลลิสต์',
                              style: TextStyle(
                                fontSize: 22,
                                color: Color.fromARGB(255, 231, 173, 0),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                'สมาธิ',
                                style: TextStyle(
                                  fontSize: 25,
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 5), // Add spacing between texts
                              Text(
                                '6 เสียง',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            'ฟังเพลงพร้อมนั่งสมาธิ ทำให้จิตใจบริสุทธิ์',
                            style: TextStyle(
                              fontSize: 16,
                              color: Color.fromARGB(255, 192, 192, 192),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Expanded(
              child:
                  ShowsamaList(), // Replace the ListView.builder with the PrayerSoundList widget
            ),
          ],
        ),
      ),
    );
  }
}
