import 'package:practica1/src/domain/entities/character_entity.dart';
import 'package:practica1/src/data/datasources/character_datasource.dart';
import 'package:practica1/src/domain/repositories/character_repository.dart';

class CharacterRepositoryImpl implements CharacterRepository {
  CharacterRepositoryImpl({required this.datasource});
  final CharacterDatasource datasource;

  @override
  Future<CharacterEntity> getACharacter(int id) {
    return datasource.getACharacter(id);
  }

  @override
  Future<List<CharacterEntity>> getAllCharacters() {
    return datasource.getAllCharacters();
  }
}
