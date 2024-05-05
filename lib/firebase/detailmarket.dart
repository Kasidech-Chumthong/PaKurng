import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pakrung/models/market_model.dart';

class ShowmarketdetailList extends StatefulWidget {
  const ShowmarketdetailList({super.key});

  @override
  _ShowmarketdetailListState createState() => _ShowmarketdetailListState();
}

class _ShowmarketdetailListState extends State<ShowmarketdetailList> {
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
              itemCount: 3,
              itemBuilder: (BuildContext context, int index) {
                return widgets[index];
              },
            ),
    );
  }

  Widget createWidget(MarketModel model, int index) => GestureDetector(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
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
                    child: Image.asset(
                      'assets/images/nature$index.jpg',
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
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "วัตถุมงคลที่จำหน่าย",
              style: TextStyle(
                fontSize: 20,
                color: Color.fromARGB(255, 231, 173, 0),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 3, // Assuming you have 3 products
              itemBuilder: (BuildContext context, int index) {
                late String productName;
                late String productPrice;
                late String productDetail;

                // Determine which product to display based on the index
                if (index == 0) {
                  productName = model.product1;
                  productPrice = model.priceproduct1;
                  productDetail = model.detailproduct1;
                } else if (index == 1) {
                  productName = model.product2;
                  productPrice = model.priceproduct2;
                  productDetail = model.detailproduct2;
                } else {
                  productName = model.product3;
                  productPrice = model.priceproduct3;
                  productDetail = model.detailproduct3;
                }

                return GestureDetector(
                  onTap: () {
                    // Handle tap on the product
                    print('Tapped on $productName');
                    // You can navigate to a new page or show a dialog
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
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
                          offset: const Offset(
                              0, 3), // changes the position of the shadow
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
                            child: Image.asset(
                              'assets/images/nature$index.jpg',
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
                                  productName,
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
                                    'ราคาเช่าบูชา',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Color.fromRGBO(164, 164, 164, 1),
                                    ),
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    productPrice,
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
                                productDetail,
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
              },
            ),
          ),
        ],
      ));
}
