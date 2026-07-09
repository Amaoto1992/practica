import 'package:dartz/dartz.dart';
import 'package:practica1/src/domain/entities/failure.dart';
import 'package:practica1/src/domain/entities/character_entity.dart';
import 'package:practica1/src/domain/repositories/character_repository.dart';

class GetAllCharactersUsecase {
  GetAllCharactersUsecase(this.repository);
  final CharacterRepository repository;

  Future<Either<Failure, List<CharacterEntity>>> call() {
    return repository.getAllCharacters();
  }
}
