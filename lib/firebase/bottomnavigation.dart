import 'package:flutter/material.dart';
import 'package:pakrung/home.dart';
import 'package:pakrung/screen/personalpage.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  const BottomNavigationBarWidget({super.key});

  @override
  State<BottomNavigationBarWidget> createState() =>
      _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState
    extends State<BottomNavigationBarWidget> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.white, // กำหนดสีของไอเทมที่เลือกเป็นสีขาว
      unselectedItemColor: Colors.white.withOpacity(0.5), // กำหนดสีของไอเทมที่ไม่ได้เลือกเป็นสีขาวโปร่ง
      backgroundColor: const Color.fromARGB(255, 231, 173, 0), // กำหนดสีพื้นหลังของ BottomNavigationBar เป็นสีเหลือง
      showSelectedLabels: false,
      showUnselectedLabels: false,
      onTap: (index) {
        setState(() {
          _selectedIndex = index;
          if (_selectedIndex == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Home()),
            );
          } else if (_selectedIndex == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const PersonalPage()),
            );
          }
        });
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            color: Color.fromARGB(255, 0, 0, 0), // กำหนดสีของไอคอนเป็นสีขาว
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.person,
            color: Color.fromARGB(255, 0, 0, 0), // กำหนดสีของไอคอนเป็นสีขาว
          ),
          label: 'Profile',
        ),
      ],
    );
  }
}
