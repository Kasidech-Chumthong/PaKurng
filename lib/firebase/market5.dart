import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:pakrung/models/market5_model.dart';
import 'package:pakrung/screen/showmarketproduct5.dart'; // Import Market3Model

class Showmarket5List extends StatefulWidget {
  const Showmarket5List({super.key});

  @override
  _Showmarket5ListState createState() => _Showmarket5ListState();
}

class _Showmarket5ListState extends State<Showmarket5List> {
  List<Widget> widgets = [];
  List<Market5Model> market5Models = []; // Change to Market3Model

  @override
  void initState() {
    super.initState();
    readData();
  }

  Future<void> readData() async {
    await Firebase.initializeApp().then((value) async {
      print('initialize Success');
      FirebaseFirestore.instance
          .collection('market9')
          .snapshots()
          .listen((event) {
        print('snapshot = ${event.docs}');
        int index = 0;
        for (var snapshot in event.docs) {
          Map<String, dynamic> map = snapshot.data();
          print('map = $map');
          Market5Model model =
              Market5Model.fromMap(map); // Change to Market3Model
          market5Models.add(model);
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
          : ListView.builder(
              itemCount: widgets.length,
              itemBuilder: (BuildContext context, int index) {
                return widgets[index];
              },
            ),
    );
  }

  Widget createWidget(Market5Model model, int index) => GestureDetector(
        // Change to Market3Model
        onTap: () {
          print('You clicked from index = $index');
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ShowMarket5Viewproduct(
                      market5Model: market5Models[index], // Corrected here
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
                offset:
                    const Offset(0, 3), // changes the position of the shadow
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
                        model.product,
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
                          model.priceproduct,
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
                      model.detailproduct,
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