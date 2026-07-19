import 'package:practica1/src/domain/entities/naruto_entity.dart';

abstract class NarutoRepository {
  Future<NarutoEntity> getANarutoCharacter(int id);
  Future<List<NarutoEntity>> getNarutoCharacters();
}
