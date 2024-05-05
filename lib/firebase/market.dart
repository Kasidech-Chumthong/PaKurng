import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pakrung/models/market_model.dart';
import 'package:pakrung/screen/showmarket1.dart';
import 'package:pakrung/screen/showmarket2.dart';
import 'package:pakrung/screen/showmarket3.dart';
import 'package:pakrung/screen/showmarket4.dart';
import 'package:pakrung/screen/showmarket5.dart';

class ShowmarketList extends StatefulWidget {
  const ShowmarketList({super.key});

  @override
  _ShowmarketListState createState() => _ShowmarketListState();
}

class _ShowmarketListState extends State<ShowmarketList> {
  List<Widget> widgets = [];
  List<MarketModel> marketModels = [];

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
        int index = 0;
        for (var snapshot in event.docs) {
          Map<String, dynamic> map = snapshot.data();
          print('map = $map');
          MarketModel model = MarketModel.fromMap(map);
          marketModels.add(model);
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

  Widget createWidget(MarketModel model, int index) {
    return GestureDetector(
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
        } // Add more else if conditions for other indices if needed
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
              offset: const Offset(0, 3), // changes the position of the shadow
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
                  model.pathimg,
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
                      model.nameshop,
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
                        'ร้านเปิด',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color.fromRGBO(164, 164, 164, 1),
                        ),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        model.opentime,
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
                    model.shopdetail,
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
}