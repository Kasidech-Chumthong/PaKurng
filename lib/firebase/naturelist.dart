import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pakrung/models/nature_model.dart';
import 'package:pakrung/screen/shownaturesound.dart';

class ShownatureList extends StatefulWidget {
  const ShownatureList({super.key});

  @override
  _ShownatureListState createState() => _ShownatureListState();
}

class _ShownatureListState extends State<ShownatureList> {
  List<Widget> widgets = [];
  List<NatureModel> natureModels = [];

  @override
  void initState() {
    super.initState();
    readData();
  }

  Future<void> readData() async {
    await Firebase.initializeApp().then((value) async {
      print('initialize Success');
      FirebaseFirestore.instance
          .collection('Songnaturename')
          .snapshots()
          .listen((event) {
        print('snapshot = ${event.docs}');
        int index = 0;
        for (var snapshot in event.docs) {
          Map<String, dynamic> map = snapshot.data();
          print('map = $map');
          NatureModel model = NatureModel.fromMap(map);
          natureModels.add(model);
          print('prayername = ${model.soundname}');
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

  Widget createWidget(NatureModel model, int index) => GestureDetector(
        onTap: () {
          print('You clicked from index = $index');
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ShowNatureSound(
                natureModel: natureModels[index],
                index: index,
                natureSounds: natureModels,
              ),
            ),
          );
        },
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          height: 80,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 29, 19, 9),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: Colors.white,
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
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text(
                            model.soundname,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 231, 173, 0),
                            ),
                          ),
                        ),
                        const SizedBox(width: 5),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text(
                            model.time,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Color.fromRGBO(255, 255, 255, 1),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      model.detailsong,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color.fromRGBO(164, 164, 164, 1),
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {
                  print('You clicked from index = $index');
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ShowNatureSound(
                        natureModel: natureModels[index],
                        index: index,
                        natureSounds: natureModels,
                      ),
                    ),
                  );
                },
                icon: const Icon(Icons.play_circle),
                color: Colors.amber,
              ),
            ],
          ),
        ),
      );
}
