import 'package:flutter/material.dart';
import 'package:pakrung/firebase/bottomnavigation.dart';
import 'package:pakrung/firebase/checklogin.dart';
import 'package:pakrung/firebase/market.dart';

import '../firebase/hambergerbar.dart';

class Allmarket extends StatefulWidget {
  const Allmarket({super.key});

  @override
  _AllmarketState createState() => _AllmarketState();
}

class _AllmarketState extends State<Allmarket> {
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
              'PraKrung | ตลาดพระ',
              style: TextStyle(
                fontSize: 20,
                color: Color.fromARGB(255, 255, 255, 255),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        body:
            const ShowmarketList(), // Replace the ListView.builder with the ShowmarketList widget
      ),
    );
  }
}
