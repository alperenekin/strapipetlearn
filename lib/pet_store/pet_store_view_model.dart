import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'model/pet_store_model.dart';
import './pet_store.dart';
abstract class PetStoreViewModel extends State<PetStore>{
 Dio dio;
 List<PetStoreModel> petStores = [];
 String path = "pet-stores";
 @override
  Future<void> initState() {
    super.initState();
    final options = BaseOptions(
      baseUrl: "http://192.168.43.174:1337/"
    );
    dio = Dio(options);
    getPetStoreList();
  }

  Future<void> getPetStoreList() async {
    setState(() {
      
    });
    final response = await dio.get(path);
    switch(response.statusCode){
      case HttpStatus.ok:
      final responseBody = response.data;
      if(responseBody is List){
        petStores = responseBody.map((e) => PetStoreModel.fromJson(e)).toList();
      }
    }
    setState(() {
      
    });
  }
}