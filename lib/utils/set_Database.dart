import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

setData(value, TextEditingController tc) async {
  DatabaseReference dbReference = FirebaseDatabase.instance.ref();




final number = int.tryParse(value);

  if (value.isNotEmpty && number!=null) {
    int valor = int.parse(value);
    if (valor >= 0) {
      dbReference.child('teste').set(valor);
      tc.clear();
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }

}
