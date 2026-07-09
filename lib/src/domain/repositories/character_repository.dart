import 'package:dartz/dartz.dart';
import 'package:practica1/src/domain/entities/failure.dart';
import 'package:practica1/src/domain/entities/character_entity.dart';

abstract class CharacterRepository {
  Future<Either<Failure , CharacterEntity>> getACharacter(String id);
  Future<Either<Failure , List<CharacterEntity>>> getAllCharacters();
}