import 'package:practica1/src/domain/entities/character_entity.dart';
import 'package:practica1/src/domain/repositories/character_repository.dart';

class GetAllCharactersUseCase {
  final CharacterRepository repository;

  GetAllCharactersUseCase({required this.repository});

  Future<List<CharacterEntity>> call() {
    return repository.getAllCharacters();
  }
}
