import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pakrung/firebase/bottomnavigation.dart';
import 'package:pakrung/screen/seemsee.dart';

import 'hambergerbar.dart';

class TextRandom extends StatefulWidget {
  const TextRandom({super.key});

  @override
  _TextRandomState createState() => _TextRandomState();
}

class _TextRandomState extends State<TextRandom> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection("Randoms").snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Error: ${snapshot.error}");
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(
                strokeWidth: 5,
                valueColor: AlwaysStoppedAnimation<Color>(
                    Color.fromARGB(255, 231, 173, 0)),
              ),
              SizedBox(height: 10),
              Text(
                'รอคำคำนายสักครู่...',
                style: TextStyle(
                  fontSize: 18,
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          );
        } else if (snapshot.data!.docs.isEmpty) {
          return const Text("No data");
        } else {
          final List<DocumentSnapshot> documents = snapshot.data!.docs;
          final int randomIndex =
              Random().nextInt(documents.length); // สุ่ม index จาก documents
          final randomnum = documents[randomIndex]["textnumber"];
          final randomText = documents[randomIndex]["textlucky"];

          return SafeArea(
            child: Scaffold(
              endDrawer: const Navbar(),
              appBar: PreferredSize(
                preferredSize: const Size.fromHeight(50),
                child: AppBar(
                  automaticallyImplyLeading: false, // Remove the back arrow
                  backgroundColor: const Color.fromARGB(255, 231, 173, 0),
                  title: const Text(
                    'PraKrung | เซียมซี',
                    style: TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ), // Remove the comma here
              body: Center(
                child: Container(
                  width: 350,
                  height: 500,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: const Color.fromARGB(255, 231, 173, 0),
                              width: 5,
                            ),
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Text(
                                (randomText),
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 20,
                          left: 80,
                          child: Container(
                            width: 120,
                            height: 60,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 29, 19, 9),
                              borderRadius:
                                  BorderRadius.circular(20), // ทำให้มีขอบโค้ง
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Center(
                              child: Text(
                                'ใบที่ $randomnum',
                                style: const TextStyle(
                                  fontSize: 20,
                                  color: Color.fromARGB(255, 231, 173, 0),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 30, // Adjust the bottom distance as needed
                          left: 0,
                          right: 0,
                          child: Center(
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const Seemsee(), // Navigate to RandomsWidget
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 29, 19, 9),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                elevation: 5,
                              ),
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 15),
                                child: Text(
                                  'ทำนายใหม่',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color.fromARGB(255, 231, 173, 0),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
