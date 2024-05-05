import 'package:flutter/material.dart';
import 'package:pakrung/firebase/bottomnavigation.dart';
import 'package:pakrung/firebase/checklogin.dart';
import 'package:pakrung/firebase/randomtextseemsee.dart';
import 'package:pakrung/home.dart';

import '../firebase/hambergerbar.dart';

class Seemsee extends StatefulWidget {
  const Seemsee({super.key});

  @override
  _SeemseeState createState() => _SeemseeState();
}

class _SeemseeState extends State<Seemsee> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration:
          const Duration(milliseconds: 500), // Adjust the duration as needed
    );
    _animation = Tween<double>(begin: -0.05, end: 0.05).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
    checkLoginStatus(context);
    _controller.repeat(reverse: true); // Repeat the animation
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        endDrawer: const Navbar(),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: AppBar(
            automaticallyImplyLeading: false, // Remove the back arrow
            backgroundColor: const Color.fromARGB(255, 231, 173, 0),
            title: GestureDetector(
              // Wrap the text with GestureDetector
              onTap: () {
                Navigator.push(
                  // Navigate to the home page
                  context,
                  MaterialPageRoute(builder: (context) => const Home()),
                );
              },
              child: const Text(
                'PraKrung | เซียมซี',
                style: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  return Transform.rotate(
                    angle: _animation.value,
                    child: Image.asset(
                      'assets/images/seemsee1.png',
                      width: 400, // Set your desired image width
                    ),
                  );
                },
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TextRandom(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 29, 19, 9),
                  minimumSize:
                      const Size(180, 60), // Set your desired button size
                ),
                child: const Text(
                  'โปรดเขย่า',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 231, 173, 0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
