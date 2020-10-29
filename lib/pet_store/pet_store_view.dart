import 'package:flutter/material.dart';

import 'pet_store_view_model.dart';

class PetStoreView extends PetStoreViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: petStores.isEmpty ? Center(child: CircularProgressIndicator()): 
      ListView.builder(
          itemBuilder: (context, index) => buildListTileStoreCard(index)),
    );
  }

  ListTile buildListTileStoreCard(int index) {
    return ListTile(
        title: Text(petStores[index].name),
        subtitle: Text(petStores[index].createDate));
  }
}
