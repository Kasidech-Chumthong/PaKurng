import 'package:flutter/material.dart';
import 'package:pakrung/firebase/bottomnavigation.dart';
import 'package:pakrung/firebase/checklogin.dart';
import 'package:pakrung/firebase/playlist.dart';

import '../firebase/hambergerbar.dart';

class Songplaylist extends StatefulWidget {
  const Songplaylist({super.key});

  @override
  _SongplaylistState createState() => _SongplaylistState();
}

class _SongplaylistState extends State<Songplaylist> {

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
              'PraKrung | เพลง',
              style: TextStyle(
                fontSize: 20,
                color: Color.fromARGB(255, 255, 255, 255),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        body: const PlayList(), // Here is the PlayList widget
      ),
    );
  }
}
