import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:pakrung/models/market1_model.dart';
import 'package:pakrung/screen/showmarketproduct1.dart';

class ShowproductListHome extends StatefulWidget {
  const ShowproductListHome({super.key});

  @override
  _ShowproductListHomeState createState() => _ShowproductListHomeState();
}

class _ShowproductListHomeState extends State<ShowproductListHome> {
  List<Widget> widgets = [];
  List<Market1Model> market1Models = [];

  @override
  void initState() {
    super.initState();
    readData();
  }

  Future<void> readData() async {
    await Firebase.initializeApp().then((value) async {
      print('initialize Success');
      FirebaseFirestore.instance
          .collection('market1')
          .snapshots()
          .listen((event) {
        print('snapshot = ${event.docs}');
        int index = 0;
        for (var snapshot in event.docs) {
          Map<String, dynamic> map = snapshot.data();
          print('map = $map');
          Market1Model model = Market1Model.fromMap(map);
          market1Models.add(model);
          print('name = ${model.nameshop}');
          setState(() {
            widgets.add(createWidget(model, index));
          });
          index++;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widgets.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: widgets,
              ),
            ),
    );
  }

  Widget createWidget(Market1Model model, int index) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Material(
          child: InkWell(
            splashColor: const Color.fromARGB(255, 255, 255, 255),
            onTap: () {
              print('You clicked from index = $index');
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ShowMarket1Viewproduct(
                    market1Model: model,
                    index: index,
                  ),
                ),
              );
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    model.front, // Change image path here
                    height: 130, // Adjust height
                    width: 130, // Adjust width
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  model.product,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${model.priceproduct} บาท',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color.fromARGB(255, 185, 185, 185),
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