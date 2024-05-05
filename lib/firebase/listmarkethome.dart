import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pakrung/models/market_model.dart';
import 'package:pakrung/screen/showmarket1.dart';
import 'package:pakrung/screen/showmarket2.dart';
import 'package:pakrung/screen/showmarket3.dart';
import 'package:pakrung/screen/showmarket4.dart';
import 'package:pakrung/screen/showmarket5.dart';

class ShowmarketListHome extends StatefulWidget {
  const ShowmarketListHome({super.key});

  @override
  _ShowmarketListHomeState createState() => _ShowmarketListHomeState();
}

class _ShowmarketListHomeState extends State<ShowmarketListHome> {
  List<MarketModel> marketModels = [];
  List<Widget> widgets = [];

  @override
  void initState() {
    super.initState();
    readData();
  }

  Future<void> readData() async {
    await Firebase.initializeApp().then((value) async {
      print('initialize Success');
      FirebaseFirestore.instance
          .collection('CategoriesShop')
          .snapshots()
          .listen((event) {
        print('snapshot = ${event.docs}');
        setState(() {
          marketModels = event.docs.map((snapshot) {
            Map<String, dynamic> map = snapshot.data();
            print('map = $map');
            return MarketModel.fromMap(map);
          }).toList();
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: marketModels.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: marketModels.map((model) {
                  return createWidget(context, model);
                }).toList(),
              ),
            ),
    );
  }

  Widget createWidget(BuildContext context, MarketModel model) {
    int index = marketModels.indexOf(model);
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Material(
          borderRadius: BorderRadius.circular(30),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          elevation: 8,
          child: InkWell(
            splashColor: const Color.fromARGB(255, 0, 0, 0),
            onTap: () {
              print('You clicked from index = $index');
              if (index == 0) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ShowMarketView(
                      marketModel: model,
                      index: index,
                    ),
                  ),
                );
              } else if (index == 1) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ShowMarket2View(
                      marketModel: model,
                      index: index,
                    ),
                  ),
                );
              } // Add more else if conditions for other indices if needed
              else if (index == 2) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ShowMarket3View(
                      marketModel: model,
                      index: index,
                    ),
                  ),
                );
              } // Add more else if conditions for other indices if needed
              else if (index == 3) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ShowMarket4View(
                      marketModel: model,
                      index: index,
                    ),
                  ),
                );
              } // Add more else if conditions for other indices if needed
              else if (index == 4) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ShowMarket5View(
                      marketModel: model,
                      index: index,
                    ),
                  ),
                );
              }
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.network(
                  model.pathimg,
                  height: 130, // Adjust height
                  width: 130, // Adjust width
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 6),
                Text(
                  model.nameshop,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Color.fromARGB(255, 231, 173, 0),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}