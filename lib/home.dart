import 'package:flutter/material.dart';
import 'package:pakrung/firebase/bottomnavigation.dart';
import 'package:pakrung/firebase/checklogin.dart';
import 'package:pakrung/firebase/hambergerbar.dart';
import 'package:pakrung/firebase/listmarkethome.dart';
import 'package:pakrung/firebase/listproducthome.dart';
import 'package:pakrung/screen/Prayer.dart';
import 'package:pakrung/models/category_model.dart';
import 'package:pakrung/screen/allmarket.dart';
import 'package:pakrung/screen/seemsee.dart';
import 'package:pakrung/screen/songplaylist.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List<CategoryModel> categories;

  @override
  void initState() {
    super.initState();
    _getCategories();
    checkLoginStatus(context);
  }

  void _getCategories() {
    categories = CategoryModel.getCategories();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        endDrawer: const Navbar(),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: AppBar(
            automaticallyImplyLeading: false, // Remove the back arrow
            backgroundColor: const Color.fromARGB(255, 231, 173, 0),
            title: const Text(
              'PraKrung',
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
              height: 240.0, // Adjust the height of the poster image container
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      'assets/images/budha10.jpg'), // Your poster image path
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: categories.asMap().entries.map((entry) {
                        final index = entry.key;
                        final category = entry.value;
                        return Column(
                          children: [
                            const SizedBox(height: 10),
                            RawMaterialButton(
                              onPressed: () {
                                if (index == 0) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const Prayer(),
                                    ),
                                  );
                                } else if (index == 1) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                      const Songplaylist(),
                                    ),
                                  );
                                } else {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const Seemsee(),
                                    ),
                                  );
                                }
                              },
                              elevation: 2.0,
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color:
                                    const Color.fromARGB(255, 231, 173, 0),
                                    width: 3,
                                  ),
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: AssetImage(category.image),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                padding: EdgeInsets.all(screenWidth * 0.1),
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              category.name,
                              style: const TextStyle(fontSize: 20),
                            ),
                          ],
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 5),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Allmarket(),
                          ),
                        );
                      },
                      style: TextButton.styleFrom(
                        foregroundColor: const Color.fromARGB(255, 251, 188, 0),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'ตลาดพระ',
                            style: TextStyle(fontSize: 20, color: Colors.black),
                          ),
                          SizedBox(width: 2),
                          Icon(Icons.arrow_right_alt),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 190,
                      child: ShowmarketListHome(),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children:  [
                          Text(
                            'สินค้าแนะนำ',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 190,
                      child: ShowproductListHome(),
                    ),
                    const SizedBox(height: 5),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}