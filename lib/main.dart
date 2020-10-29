import 'package:flutter/material.dart';
import 'package:strapipet/pet_store/pet_store.dart';
import 'package:strapipet/pet_store/pet_store_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: PetStore(),
    );
  }
}