import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:strapipet/pet_store/model/pet_model.dart';

import 'pet_store_view_model.dart';

class PetStoreView extends PetStoreViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Our Pets"),),
      body: petStores.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: petStores.length,
              itemBuilder: (context, index) => buildListTileStoreCard(index)),
    );
  }

  Widget buildListTileStoreCard(int index) {
    return ExpansionTile(
      title: Text(petStores[index].name),
      children: petStores[index].pets.map((e) => toPetCard(e)).toList(),
    );
  }

  Widget toPetCard(PetModel pet) {
    return Card(
      child: ListTile(
          onTap: () {
            showModalBottomSheet(
              backgroundColor: Colors.green.shade700,
                context: context,
                builder: (context) => showDetailPetStore(pet));
          },
          trailing: Icon(Icons.pets),
          title: Text(pet.name),
          subtitle: Text(pet.createDate)),
    );
  }

  Widget showDetailPetStore(PetModel model) {
    return Column(
      children: [
        Expanded(flex:10 ,child: Markdown(data: model.description)),
        //Expanded(flex: 3,child: Text("Her age : ${model.age}",style: TextStyle(fontWeight: FontWeight.bold),textScaleFactor: 1.5,)),
        Expanded(flex: 20,child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Her age : ${model.age}",style: TextStyle(fontWeight: FontWeight.bold),textScaleFactor: 1.5,),
              Container(child: Image.network("http://192.168.43.174:1337" + model.photo.url),),
            ],
          ),
        ),),
        Spacer()
      ],
    );
  }
}
