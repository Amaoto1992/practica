import 'package:dartz/dartz.dart';
import 'package:practica1/src/domain/entities/failure.dart';
import 'package:practica1/src/domain/entities/character_entity.dart';
import 'package:practica1/src/domain/repositories/character_repository.dart';

class GetACharacterUsecase {
  GetACharacterUsecase(this.repository);
  final CharacterRepository repository;

  Future<Either<Failure, CharacterEntity>> call(String id) {
    return repository.getACharacter(id);
  }
}
