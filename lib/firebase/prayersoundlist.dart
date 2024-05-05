import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PrayerSoundList extends StatefulWidget {
  const PrayerSoundList({super.key});

  @override
  _PrayerSoundListState createState() => _PrayerSoundListState();
}

class _PrayerSoundListState extends State<PrayerSoundList> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream:
          FirebaseFirestore.instance.collection("Songprayerlist").snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Error: ${snapshot.error}");
        } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return const Text("รอสักครู่...");
        } else {
          return ListView(
            children: snapshot.data!.docs.map((document) {
              return InkWell(
                onTap: () {
                  // Add your onTap functionality here
                },
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  height: 80,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 29, 19, 9),
                    borderRadius: BorderRadius.circular(20), // Rounded corners
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: Colors.white, // Set border color to white
                            width: 2, // Set border width
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            document["title"],
                            height: 60,
                            width: 60,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Text(
                                    document["title"],
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 231, 173, 0),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 5),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Text(
                                    document["time"],
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Color.fromRGBO(255, 255, 255, 1),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              document["description"],
                              style: const TextStyle(
                                fontSize: 12,
                                color: Color.fromRGBO(164, 164, 164, 1),
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.play_circle),
                        color: Colors.amber,
                      ),
                    ],
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
