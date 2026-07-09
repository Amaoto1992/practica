import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:practica1/src/data/models/character_model.dart';
import 'package:practica1/src/domain/entities/server_failure.dart';
import 'package:practica1/src/data/datasources/character_datasource.dart';

class CharacterDatasourceImpl implements CharacterDatasource {
  CharacterDatasourceImpl(this.client);
  final http.Client client;

  @override
  Future<CharacterModel> getACharacter(String id) async {
    final url = Uri.parse('https://onepieceapi.com/api/characters/$id');
    try {
      final response = await client.get(url);
      if (response.statusCode == 200) {
        return CharacterModel.fromJson(jsonDecode(response.body));
      } else {
        throw ServerFailure(message: 'Failed catching the information');
      }
    } catch (error) {
      print(error);
      throw ServerFailure(message: 'Failed catching the information $error');
    }
  }

  @override
  Future<List<CharacterModel>> getAllCharacters() async {
    try {
      final url = Uri.parse(
        'https://onepieceapi.com/api/characters?page=1&limit=20',
      );
      final response = await client.get(url);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return (data as List)
            .map((item) => CharacterModel.fromJson(item))
            .toList();
      } else {
        throw ServerFailure(message: 'Failed catching the information');
      }
    } catch (error) {
      print(error);
      throw ServerFailure(message: 'Failed catching the information $error');
    }
  }
}
