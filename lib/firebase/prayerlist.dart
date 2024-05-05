import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pakrung/models/prayer_model.dart';
import 'package:pakrung/screen/showprayerview.dart';

class ShowprayerList extends StatefulWidget {
  @override
  _ShowprayerListState createState() => _ShowprayerListState();
}

class _ShowprayerListState extends State<ShowprayerList> {
  List<Widget> widgets = [];
  List<PrayerModel> prayerModels = [];

  @override
  void initState() {
    super.initState();
    readData();
  }

  Future<Null> readData() async {
    await Firebase.initializeApp().then((value) async {
      print('initialize Success');
      await FirebaseFirestore.instance
          .collection('prayer')
          .snapshots()
          .listen((event) {
        print('snapshot = ${event.docs}');
        int index = 0;
        for (var snapshot in event.docs) {
          Map<String, dynamic> map = snapshot.data();
          print('map = $map');
          PrayerModel model = PrayerModel.fromMap(map);
          prayerModels.add(model);
          print('prayername = ${model.nameprayer}');
          setState(() {
            widgets.add(createWidget(model, index));
          });
          index++;
        }
      });
    });
  }

  Widget createWidget(PrayerModel model, int index) => GestureDetector(
    onTap: () {
      print('You clicked from index = $index');
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                ShowPrayerView(prayerModel: prayerModels[index])),
      );
    },
    child: Column(
      children: [
        SizedBox(
          width: 130,
          height: 130,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes the shadow direction
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                model.imgprayer,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Text(
          model.type,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w100,
            color: Color.fromARGB(255, 176, 176, 176),
          ),
        ),
        Text(
          model.nameprayer,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        ),
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: widgets.length == 0
            ? const Center(
          child: CircularProgressIndicator(),
        )
            : GridView.extent(
          maxCrossAxisExtent: 220,
          children: widgets,
        ));
  }
}