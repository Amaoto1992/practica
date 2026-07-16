import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:practica1/src/data/models/character_model.dart';
import 'package:practica1/src/data/datasources/character_datasource.dart';

class CharacterDatasourceImpl implements CharacterDatasource {
  CharacterDatasourceImpl({required this.client});
  final http.Client client;

  @override
  Future<CharacterModel> getACharacter(int id) async {
    final url = Uri.parse('https://rickandmortyapi.com/api/character/$id');
    try {
      final response = await client.get(url);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        // data['results']
        final character = CharacterModel.fromJson(data);
        return character;
      } else {
        throw Exception('Failed to load character');
      }
    } catch (e) {
      throw Exception('Failed to load character: $e');
    }
  }

  @override
  Future<List<CharacterModel>> getAllCharacters() async {
    try {
      final url = Uri.parse('https://rickandmortyapi.com/api/character');
      final response = await client.get(url);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final List<CharacterModel> characters = (data['results'] as List)
            .map((character) => CharacterModel.fromJson(character))
            .toList();
        return characters;
      } else {
        throw Exception('Failed to load characters');
      }
    } catch (e) {
      throw Exception('Failed to load characters: $e');
    }
  }
}
