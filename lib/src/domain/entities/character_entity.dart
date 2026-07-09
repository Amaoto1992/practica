import 'package:practica1/src/domain/entities/character_name.dart';

class CharacterEntity {
  CharacterEntity({
    required this.id,
    required this.name,
    required this.status,
    this.age,
    this.imageUrl,
  });
  final String id;
  final CharacterName name;
  final int? age;
  final String status;
  final String? imageUrl;
}
