import 'package:practica1/src/data/models/character_model.dart';

abstract class CharacterDatasource {
  Future<List<CharacterModel>> getAllCharacters();
  Future<CharacterModel> getACharacter(String id);
}
