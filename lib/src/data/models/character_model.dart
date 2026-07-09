import 'character_name_model.dart';
import 'package:practica1/src/domain/entities/character_entity.dart';

class CharacterModel extends CharacterEntity {
  CharacterModel({
    required super.id,
    required super.name,
    required super.status,
    super.age,
    super.imageUrl,
  });

  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    return CharacterModel(
      id: json['id'],
      name: CharacterNameModel.fromJson(json['name']),
      status: json['status'],
      age: json['age'],
      imageUrl: json['image_url']
    );
  }
}
