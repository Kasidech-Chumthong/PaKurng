import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pakrung/firebase/market1.dart';
import 'package:pakrung/home.dart';
import 'package:pakrung/screen/Prayer.dart';
import 'package:pakrung/screen/seemsee.dart';
import 'package:pakrung/screen/songpralist.dart';

import '../screen/allmarket.dart';
import '../screen/loginscreen.dart';
import '../screen/personalpage.dart';
import '../screen/showprayerview.dart';
import '../screen/songplaylist.dart';

class Navbar extends StatelessWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text('Welcome'),
            accountEmail: Text('${user?.email ?? 'N/A'}'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset(
                  'assets/images/icon.jpg',
                  width: 90,
                  height: 90,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            decoration: const BoxDecoration(
              color: Colors.amber,
              image: DecorationImage(
                image: AssetImage('assets/images/view2.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.person_2),
            title: const Text('โปรไฟล์'),
            onTap: () =>  Navigator.push(context, MaterialPageRoute(builder: (context) => PersonalPage())),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.house),
            title: const Text('หน้าแรก'),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Home())),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.menu_book),
            title: const Text('บทสวด'),
            onTap: () =>  Navigator.push(context, MaterialPageRoute(builder: (context) => Prayer())),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.music_note_outlined),
            title: const Text('เพลง'),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Songplaylist())),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.sticky_note_2_rounded),
            title: const Text('เช๊ยมชี'),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Seemsee())),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.holiday_village_rounded),
            title: const Text('ตลาดพระ'),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Allmarket())),
          ),
          const Divider(),
        /*  ListTile(
            leading: const Icon(Icons.event_note),
            title: const Text('ปฎิทิน'),
            onTap: () => null,
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.notifications_active),
            title: const Text('แจ้งเตือน'),
            onTap: () => null,
            trailing: ClipOval(
              child: Container(
                color: Colors.orange,
                width: 25,
                height: 25,
                child: const Center(
                  child: Text(
                    '10',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const Divider(),*/
          ListTile(
            leading: const Icon(Icons.logout_outlined),
            title: const Text('ล็อคเอ้า'),
            onTap: () => _signOut(context),
          ),
          const Divider(),
        ], // Moved ListTile inside the children list
      ),
    );
  }
  void _signOut(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      // Navigate back to login screen
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    } catch (e) {
      print('Sign out error: $e');
      // Handle sign out errors here
    }
  }
}