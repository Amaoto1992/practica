import 'package:practica1/src/domain/entities/naruto_entity.dart';

abstract class NarutoDatasource {
  Future<NarutoEntity> getANarutoCharacter(int id);
  Future<List<NarutoEntity>> getNarutoCharacters();
}
