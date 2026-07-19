import 'package:practica1/src/domain/entities/naruto_entity.dart';
import 'package:practica1/src/data/datasources/naruto_datasource.dart';
import 'package:practica1/src/domain/repositories/naruto_repository.dart';

class NarutoRepositoryImpl implements NarutoRepository {
  NarutoRepositoryImpl({required this.datasource});
  final NarutoDatasource datasource;

  @override
  Future<NarutoEntity> getANarutoCharacter(int id) {
    return datasource.getANarutoCharacter(id);
  }

  @override
  Future<List<NarutoEntity>> getNarutoCharacters() {
    return datasource.getNarutoCharacters();
  }
}
