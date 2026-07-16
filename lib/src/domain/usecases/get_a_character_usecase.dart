import 'package:practica1/src/domain/entities/character_entity.dart';
import 'package:practica1/src/domain/repositories/character_repository.dart';

class GetACharacterUseCase {
  final CharacterRepository repository;

  GetACharacterUseCase({required this.repository});

  Future<CharacterEntity> call(int id) async {
    return await repository.getACharacter(id);
  }
}
