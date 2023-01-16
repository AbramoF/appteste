import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../../utils/numero_extenso.dart';

class pageTwo extends StatefulWidget {
  const pageTwo({Key? key}) : super(key: key);

  @override
  State<pageTwo> createState() => _pageTwoState();
}

class _pageTwoState extends State<pageTwo> {
  int valor = 0;
  late final DatabaseReference dbRef;
  late StreamSubscription<DatabaseEvent> dbSub;

  Color? bgColor = Colors.indigo;
//Colors.grey[50]
  BoxDecoration boxD = BoxDecoration(
      color: Colors.indigo,
      boxShadow: kElevationToShadow[1],
      border: Border.all(
        width: 2,
        color: Colors.indigo,
      ),
      borderRadius: const BorderRadius.all(Radius.circular(15)));

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    dbRef = FirebaseDatabase.instance.ref('teste');
    try {
      final valorSnapshot = await dbRef.get();
      valor = valorSnapshot.value as int;
    } catch (err) {
      debugPrint(err.toString());
    }

    dbSub = dbRef.onValue.listen((DatabaseEvent event) {
      setState(() {
        valor = (event.snapshot.value ?? 0) as int;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              padding: const EdgeInsets.all(17),
              margin: const EdgeInsets.only(bottom: 10),
              decoration: boxD,
              child: Column(
                children: [
                  const Text('Número inteiro: ',
                      style: TextStyle(
                          fontSize: 18,
                          letterSpacing: 2.5,
                          color: Colors.white)),
                  Text(valor.toString(),
                      style:
                          const TextStyle(fontSize: 15, color: Colors.white)),
                ],
              )),
          Container(
            padding: const EdgeInsets.all(17),
            decoration: boxD,
            child: Column(
              children: [
                const Text('Número em extenso: ',
                    style: TextStyle(
                        fontSize: 18, letterSpacing: 2.5, color: Colors.white)),
                Text(Extenso.descrever(valor.toDouble()),
                    style: const TextStyle(fontSize: 15, color: Colors.white))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
