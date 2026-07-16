import 'package:practica1/src/data/models/character_model.dart';

abstract class CharacterDatasource {
  Future<CharacterModel> getACharacter(int id);
  Future<List<CharacterModel>> getAllCharacters();
}
