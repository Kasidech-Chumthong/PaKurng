import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:pakrung/models/market2_model.dart';
import 'package:pakrung/screen/showmarketproduct2.dart';

class Showmarket2List extends StatefulWidget {
  const Showmarket2List({super.key});

  @override
  _Showmarket2ListState createState() => _Showmarket2ListState();
}

class _Showmarket2ListState extends State<Showmarket2List> {
  List<Widget> widgets = [];
  List<Market2Model> market2Models = [];

  @override
  void initState() {
    super.initState();
    readData();
  }

  Future<void> readData() async {
    try {
      await Firebase.initializeApp().then((value) async {
        print('initialize Success');
        FirebaseFirestore.instance
            .collection('market6')
            .snapshots()
            .listen((event) {
          print('snapshot = $event');
          int index = 0;
          for (var snapshot in event.docs) {
            Map<String, dynamic> map = snapshot.data();
            print('map = $map');
            Market2Model model = Market2Model.fromMap(map);
            market2Models.add(model);
            print('name = ${model.nameshop}');
            setState(() {
              widgets.add(createWidget(model, index));
            });
            index++;
          }
        });
      });
    } catch (e) {
      print('Error: $e');
      // Display an error message to the user
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widgets.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: widgets.length,
              itemBuilder: (BuildContext context, int index) {
                return widgets[index];
              },
            ),
    );
  }

  Widget createWidget(Market2Model model, int index) => GestureDetector(
        onTap: () {
          print('You clicked from index = $index');
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ShowMarket2Viewproduct(
                      market2Model: market2Models[index], // Corrected here
                      index: index,
                    )),
          );
        },
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          height: 150,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 29, 19, 9),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                spreadRadius: 1,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 115,
                width: 115,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: const Color.fromARGB(255, 231, 173, 0),
                    width: 2,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    model.front,
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
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Text(
                        model.product ?? '', // ใส่ ?? '' เพื่อจัดการค่า null
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 231, 173, 0),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        const Text(
                          'ราคาเช่าบูชา ',
                          style: TextStyle(
                            fontSize: 12,
                            color: Color.fromRGBO(164, 164, 164, 1),
                          ),
                        ),
                        const SizedBox(width: 5),
                        Text(
                          model.priceproduct, // ใส่ ?? '' เพื่อจัดการค่า null
                          style: const TextStyle(
                            fontSize: 12,
                            color: Color.fromRGBO(164, 164, 164, 1),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 7),
                    const Text(
                      'รายละเอียด',
                      style: TextStyle(
                        fontSize: 12,
                        color: Color.fromRGBO(255, 255, 255, 1),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      model.detailproduct ??
                          '', // ใส่ ?? '' เพื่อจัดการค่า null
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color.fromARGB(255, 231, 173, 0),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}