import 'dart:ui';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../../utils/set_Database.dart';

class pageOne extends StatefulWidget {
  const pageOne({Key? key}) : super(key: key);

  @override
  State<pageOne> createState() => _pageOneState();
}

class _pageOneState extends State<pageOne> {

  DatabaseReference dbReference = FirebaseDatabase.instance.ref();
  TextEditingController textEdittingController = TextEditingController();
  late int num = 0;


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          width: 400,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                selectionWidthStyle: BoxWidthStyle.tight,
                controller: textEdittingController,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: false),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Digite um Número Inteiro.',
                ),
                onSubmitted: (value) {
                  setData(value, textEdittingController);
                },
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 20)),
                onPressed: () {
                  setData(textEdittingController.text, textEdittingController);
                },
                child: const Text('Enviar'),
                
              ),
            ],
          )),
    );
  }
}
