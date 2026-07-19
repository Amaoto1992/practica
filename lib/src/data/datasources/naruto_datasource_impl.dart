import 'dart:convert';
import 'naruto_datasource.dart';
import 'package:http/http.dart' as http;
import 'package:practica1/src/data/models/naruto_model.dart';
import 'package:practica1/src/domain/entities/naruto_entity.dart';

class NarutoDatasourceImpl implements NarutoDatasource {
  NarutoDatasourceImpl({required this.client});
  final http.Client client;

  @override
  Future<NarutoEntity> getANarutoCharacter(int id) async {
    try {
      final url =
          Uri.parse('https://dattebayo-api.onrender.com/characters/$id');
      final response = await client.get(url);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final character = NarutoModel.fromJson(data['characters']);
        return character;
      } else {
        throw Exception('Failed to load character');
      }
    } catch (e) {
      throw Exception('Failed to load character: $e');
    }
  }

  @override
  Future<List<NarutoEntity>> getNarutoCharacters() async {
    try {
      final url = Uri.parse('https://dattebayo-api.onrender.com/characters');
      final response = await client.get(url);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final characters = (data['characters'] as List)
            .map((character) => NarutoModel.fromJson(character))
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
