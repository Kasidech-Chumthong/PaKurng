import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pakrung/screen/songnatureelist.dart';
import 'package:pakrung/screen/songpralist.dart';
import 'package:pakrung/screen/songsamatiilist.dart';
import 'package:pakrung/screen/songteachlist.dart';

class PlayList extends StatefulWidget {
  const PlayList({super.key});

  @override
  _PlayListState createState() => _PlayListState();
}

class _PlayListState extends State<PlayList> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection("playlistname").snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Error: ${snapshot.error}");
        } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return const Text("รอสักครู่...");
        } else {
          return GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 3.0,
            mainAxisSpacing: 5.0,
            childAspectRatio: 2 / 2.7,
            children: snapshot.data!.docs.asMap().entries.map((entry) {
              final index = entry.key;
              final document = entry.value;
              return Padding(
                padding: const EdgeInsets.all(5.0),
                child: Material(
                  borderRadius: BorderRadius.circular(20),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  elevation: 8,
                  color: const Color.fromARGB(255, 29, 19, 9),
                  child: InkWell(
                    splashColor: const Color.fromARGB(255, 231, 173, 0),
                    onTap: () {
                      if (index == 0) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Songsamatii(),
                          ),
                        );
                      } else if (index == 1) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Songteach(),
                          ),
                        );
                      } else if (index == 2) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Songnature(),
                          ),
                        );
                      } else if (index == 3) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Song(),
                          ),
                        );
                      }
                    },
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 15.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color:
                                        const Color.fromARGB(255, 231, 173, 0),
                                    width: 3,
                                  ),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(17),
                                  child: SizedBox(
                                    width: 140,
                                    height: 140,
                                    child: Image.asset(
                                      'assets/images/song$index.jpg',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 0,
                              right: 0,
                              child: FractionalTranslation(
                                translation: const Offset(0.2, 2),
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                    border: Border.all(
                                      color:
                                          const Color.fromARGB(255, 29, 19, 9),
                                      width: 5,
                                    ),
                                  ),
                                  child: const Icon(
                                    Icons.play_circle_outline,
                                    color: Color.fromARGB(255, 29, 19, 9),
                                    size: 30,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.only(left: 30.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              document["title"],
                              style: const TextStyle(
                                fontSize: 18,
                                color: Color.fromARGB(255, 255, 255, 255),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 2),
                        Padding(
                          padding: const EdgeInsets.only(left: 30.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              document["subtitle"],
                              style: const TextStyle(
                                fontSize: 14,
                                color: Color.fromARGB(255, 162, 157, 157),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          );
        }
      },
    );
  }
}
