import 'package:flutter/material.dart';
import 'package:pakrung/firebase/market2.dart';
import 'package:pakrung/models/market_model.dart';
import 'package:pakrung/firebase/bottomnavigation.dart';

import '../firebase/hambergerbar.dart';

class ShowMarket2View extends StatefulWidget {
  final MarketModel marketModel;
  final int index; // New variable for index

  const ShowMarket2View({
    super.key,
    required this.marketModel,
    required this.index, // Updated constructor
  });

  @override
  _ShowMarket2ViewState createState() => _ShowMarket2ViewState();
}

class _ShowMarket2ViewState extends State<ShowMarket2View> {
  late MarketModel model;

  @override
  void initState() {
    super.initState();
    model = widget.marketModel;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        endDrawer: const Navbar(),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: AppBar(
            backgroundColor: const Color.fromARGB(255, 231, 173, 0),
            title: Text(
              'Prakrung | ${model.nameshop}',
              style: const TextStyle(
                fontSize: 20,
                color: Color.fromARGB(255, 255, 255, 255),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: 170,
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
            const Expanded(
              child: Showmarket2List(), // Wrap it in Expanded
            ),
          ],
        ),

      ),
    );
  }
}