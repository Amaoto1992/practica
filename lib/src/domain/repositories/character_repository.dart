import 'package:practica1/src/domain/entities/character_entity.dart';

abstract class CharacterRepository {
  Future<CharacterEntity> getACharacter(int id);
  Future<List<CharacterEntity>> getAllCharacters();
}
