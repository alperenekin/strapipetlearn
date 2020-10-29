import 'package:json_annotation/json_annotation.dart';
import 'package:strapipet/pet_store/model/base_model.dart';
import 'package:strapipet/pet_store/model/pet_model.dart';

part 'pet_store_model.g.dart';

@JsonSerializable()
class PetStoreModel extends BaseModel{
  int id;
  String name;
  @JsonKey(defaultValue: [])
  List<PetModel> pets;

  PetStoreModel({
    this.id,
    this.name,
    this.pets,
  });

  factory PetStoreModel.fromJson(Map<String, dynamic> json) =>
      _$PetStoreModelFromJson(json);
  Map<String, dynamic> toJson() => _$PetStoreModelToJson(this);
}