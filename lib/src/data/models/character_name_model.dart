import 'package:practica1/src/domain/entities/character_name.dart';

class CharacterNameModel extends CharacterName {
  CharacterNameModel({
    required super.en,
    required super.jp,
    required super.romaji,
  });

  factory CharacterNameModel.fromJson(Map<String, dynamic> json) {
    return CharacterNameModel(
      en: json['en'],
      jp: json['jp'],
      romaji: json['romaji'],
    );
  }
}
